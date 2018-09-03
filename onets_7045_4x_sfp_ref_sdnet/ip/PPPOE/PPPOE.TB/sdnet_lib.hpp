#ifndef _SDNET_LIB
#define _SDNET_LIB

#include <algorithm>
#include <limits>
#include <utility>
#include <tuple>
#include <vector>
#include <map>
#include <bitset>

#ifdef SDNET_ASSERT
    #include <cassert>
#endif

#ifdef SDNET_EXCEPT
    #include <stdexcept>
#endif
#include <cstdlib>

#include <sstream>
#include <fstream>
#include <iostream>
#include <string>
#include <iomanip>


namespace SDNET {

// ############################################################################
// hex byte helper with leading zero
std::string padHexByte(unsigned char b);

// ############################################################################
// forward declaration
template <size_t N>
class _LV;

template<class...Types>
struct _CONCAT;

// ############################################################################
// integer sequence for variadic parameter unpacking
// BOZO: replace with C++14 integer_sequence when support is prevalent
template<int...> 
struct SEQ { };

template<int N, int... S> 
struct GEN_SEQ : GEN_SEQ<N-1, N-1, S...> { };

template<int... S> 
struct GEN_SEQ<0, S...> { typedef SEQ<S...> type; };

// ############################################################################

// recursive sizer
template<size_t N, class... Types>
struct _SIZE_TYPE_HELPER {
    using type = typename std::tuple_element<N, std::tuple<Types...>>::type;
    static const size_t SIZE = 
        _SIZE_TYPE_HELPER<0, type>::SIZE 
        + 
        _SIZE_TYPE_HELPER<N-1, Types...>::SIZE;
};

// specialization for end of sequence
template<class... Types>
struct _SIZE_TYPE_HELPER<-1, Types...> {
    static const size_t SIZE = 0;
};

// specialization for _CONCAT
template<class... OtherTypes>
struct _SIZE_TYPE_HELPER<0, _CONCAT<OtherTypes...>> {
    static const size_t SIZE = _SIZE_TYPE_HELPER<sizeof...(OtherTypes)-1, OtherTypes...>::SIZE;
};

// specialization for mystring
template<size_t M>
struct _SIZE_TYPE_HELPER<0, _LV<M>> {
    static const size_t SIZE = M;
};

// top-level util
template<class... Types>
struct _SIZE_TYPE {
    static const size_t SIZE = _SIZE_TYPE_HELPER<sizeof...(Types)-1, Types...>::SIZE;
};

// ############################################################################
// helper type for iteration over tuple
// in assignment and value getting
template<class Type, std::size_t N, std::size_t M>
struct _ITERATE_TYPE {
    static void _assign(Type& t, _LV<M> value) {
        std::get<N-1>(t) = value;
        _ITERATE_TYPE<Type, N-1, M>::_assign(t, value >> _LV<M>(std::get<N-1>(t).size()));
    }
    static _LV<M> _value(const Type& t) {
        return (_ITERATE_TYPE<Type, N-1, M>::_value(t) << _LV<M>(std::get<N-1>(t).size())) | _LV<M>(std::get<N-1>(t));
    }
};

template<class Type, std::size_t M>
struct _ITERATE_TYPE<Type, 1, M> {
    static void _assign(Type& t, _LV<M> value) {
        std::get<0>(t) = value;
    }
    static _LV<M> _value(const Type& t) {
        return std::get<0>(t);
    }
};

// ############################################################################

// tuple derived class with overloaded concatenation, assignment and LV<> conversions
template<class...Types>
struct _CONCAT : public std::tuple<Types&...> {

    static const size_t _SIZE = _SIZE_TYPE<Types...>::SIZE;

    _CONCAT(std::tuple<Types&...> t) : std::tuple<Types&...>(t) {}

    _CONCAT operator=(_LV<_SIZE> value) {
        _ITERATE_TYPE<std::tuple<Types&...>, sizeof...(Types), _SIZE>::_assign(*this, value);
        return *this;
    }
    
    operator _LV<_SIZE>() const {
        return _ITERATE_TYPE<std::tuple<Types&...>, sizeof...(Types), _SIZE>::_value(*this);
    }
    
    size_t size() const { 
        return _SIZE;
    }

    template<size_t M>
    _CONCAT<Types... , _LV<M>> operator,(_LV<M>& x) {
        return comma_helper(typename GEN_SEQ<sizeof...(Types)>::type(), x);
    }
    template<int... S, size_t M>
    _CONCAT<Types... , _LV<M>> comma_helper(SEQ<S...>, _LV<M>& x) {
        return std::tie(std::get<S>(*this)..., x);
    }
    
    template<int... S1, class... OtherTypes, int... S2>
    _CONCAT<Types... , OtherTypes...> comma_helper2(SEQ<S1...>, _CONCAT<OtherTypes...>& x, SEQ<S2...>) {
        return std::tie(std::get<S1>(*this)..., std::get<S2>(x)...);
    }
    template<class...OtherTypes>
    _CONCAT<Types... , OtherTypes...> operator,(_CONCAT<OtherTypes...> x) {
        return comma_helper2(
            typename GEN_SEQ<sizeof...(Types)>::type(), 
            x, 
            typename GEN_SEQ<sizeof...(OtherTypes)>::type());
    }
    
    operator std::string() const {
        std::stringstream s;
        s << *this;
        return s.str();
    }
};

template<size_t M, class... Types>
struct print_helper {
    static std::string help(const _CONCAT<Types...>& t) {
        return print_helper<M-1, Types...>::help(t) + " " + (std::string)(std::get<M>(t));
    }
};

template<class... Types>
struct print_helper<0, Types...> {
    static std::string help(const _CONCAT<Types...>& t) {
        return std::get<0>(t);
    }
};

template<class...Types>
std::ostream& operator<<(std::ostream& os, const _CONCAT<Types...>& x) {
    return os << print_helper<sizeof...(Types)-1, Types...>::help(x);
}

// ############################################################################

// logic vector type
template <size_t N>
class _LV : public std::bitset<N> {
public:
    static const size_t SIZE = N;

    _LV() : std::bitset<N>() {}

    _LV(size_t i) : std::bitset<N>(i) {}

    explicit _LV(const std::string& s, int base = 10) : std::bitset<N>(0) {
        switch (base) {
            case 2:
                for(auto i : s) {
                    *this = (*this << 1) | (i - '0');
                }
                break;
            case 10:
                for(auto i : s) {
                    *this = *this * base + (i - '0');
                }
                break;
            case 16:
                for(auto i : s) {
                    *this = *this << 4;
                    if (i > '9') {
                        unsigned char d = tolower(i);
                        *this = *this | (d - 'a' + 10);
                    }
                    else {
                        *this = *this | (i - '0');
                    }
                }
                break;
            #ifdef SDNET_ASSERT
            default:
                assert(false);
            #endif
            #ifdef SDNET_EXCEPT
            default:
                throw std::invalid_argument("_LV(const std::string& s, int base = 10) -- invalid base");
            #endif
        }
    }

    template <size_t M>
    _LV(const std::bitset<M>& x) : std::bitset<N>(x.to_string(), (M > N) ? (M - N) : 0) {}

    static constexpr size_t size() { return N; }
   
    std::string to_hex() const {
        std::stringstream s;
        unsigned char h = 0;
        for (int bit = N-1; bit >= 0; bit--) {
            h = h * 2 + this->test(bit);
            if (bit % 4 == 0) {
                s << (char)((h < 10) ? (h + '0') : (h - 10 + 'a'));
                h = 0;
            }
        }
        return s.str();
    }
   
    std::string to_string() const {
        std::stringstream s;
        s << "0x" << to_hex();
        if (N <= sizeof(long long)*8) {
            s << '(' << this->to_ulong() << ')';
        }
        return s.str();
    }
    
    _LV slice(size_t msb, size_t lsb) const {
#ifdef SDNET_ASSERT
    assert(N-1 >= msb);
    assert(msb >= lsb);
    assert(lsb >= 0);
#endif
#ifdef SDNET_EXCEPT
    if (N-1 < msb) 
        throw std::range_error("_LV::slice msb exceeds vector size");
    if (msb < lsb) 
        throw std::range_error("_LV::slice msb is less than lsb");
    if (lsb >= 0) 
        throw std::range_error("_LV::slice lsb is negative");
#endif
        return (*this >> _LV(lsb)) & ~(~_LV(0) << _LV(msb - lsb + 1));
    }
    
    template <size_t M>
    _CONCAT<_LV<N>, _LV<M>> operator,(_LV<M>& x) {
        return std::tie(*this, x);
    }
    
    _LV operator~() const {
        _LV r = *this;
        r.flip();
        return r;
    }
    
    _LV operator!() const {
        return this->none();
    }
    
    _LV operator-() const {
        return ~ *this + 1;
    }

    // made -- the reverse bit_vector operator
    _LV operator--() const {
        const _LV& x = *this;
        _LV<N> r;
        for(int i=0; i<N; i++) {
            r.set((N-1)-i, x.test(i));
        }
        return r;
    }

    _LV operator|(const _LV<N>& y) const {
        const _LV& x = *this; 
        return (std::bitset<N>)x | (std::bitset<N>)y;
    }

    _LV operator&(const _LV<N>& y) const {
        const _LV& x = *this;
        return (std::bitset<N>)x & (std::bitset<N>)y;
    }

    _LV operator^(const _LV<N>& y) const {
        const _LV& x = *this;
        return (std::bitset<N>)x ^ (std::bitset<N>)y;
    }

    _LV operator*(const _LV<N>& y) const {
        const _LV& x = *this;
        _LV<N> r;
        for (int i = 0; i < N; i++) {
            if (y.test(i))
                r = r + (x << i);
        }
        return r;
    }

    _LV operator/(const _LV<N>& y) const {
        const _LV& x = *this;
        // TODO: implement long division
        return x.to_ulong() / y.to_ulong();
    }

    _LV operator%(const _LV<N>& y) const {
        const _LV& x = *this;
        // TODO: implement long division
        return x.to_ulong() % y.to_ulong();
    }

    _LV operator+(const _LV<N>& y) const {
        const _LV& x = *this;
        _LV<N> r;
        bool carry = 0;
        for (int i = 0; i < N; i++) {
            bool new_carry = (carry & x.test(i)) | (carry & y.test(i)) | (x.test(i) & y.test(i));
            r.set(i, carry ^ x.test(i) ^ y.test(i));
            carry = new_carry;
        }
        return r;
    }

    _LV operator-(const _LV<N>& y) const {
        const _LV& x = *this;
        _LV<N> r;
        bool carry = 1;
        for (int i = 0; i < N; i++) {
            bool new_carry = (carry & x.test(i)) | (carry & !y.test(i)) | (x.test(i) & !y.test(i));
            r.set(i, carry ^ x.test(i) ^ !y.test(i));
            carry = new_carry;
        }
        return r;
    }

    _LV operator<(const _LV<N>& y) const {
        const _LV& x = *this;
        _LV<N> r;
        bool carry = 1;
        for (int i = 0; i < N; i++) {
            bool new_carry = (carry & x.test(i)) | (carry & !y.test(i)) | (x.test(i) & !y.test(i));
            r.set(i, carry ^ x.test(i) ^ !y.test(i));
            carry = new_carry;
        }
        return _LV<N>(!carry);
    }

    _LV operator>(const _LV<N>& y) const {
        const _LV& x = *this;
        return y < x;
    }

    _LV operator<=(const _LV<N>& y) const {
        const _LV& x = *this;
        return _LV<N>("1") ^ (y < x);
    }

    _LV operator>=(const _LV<N>& y) const {
        const _LV& x = *this;
        return y <= x;
    }

    _LV operator<<(const _LV<N>& y) const {
        const _LV& x = *this;
        return (std::bitset<N>)x << y.to_ulong();
    }

    _LV operator>>(const _LV<N>& y) const {
        const _LV& x = *this;
        return (std::bitset<N>)x >> y.to_ulong();
    }

    _LV operator==(const _LV<N>& y) const {
        const _LV& x = *this;
        return (x ^ y).none();
    }

    _LV operator!=(const _LV<N>& y) const {
        const _LV& x = *this;
        return (x ^ y).any();
    }
    
    _LV operator&&(const _LV<N>& y) const {
        return this->any() && y.any();
    }
    
    _LV operator||(const _LV<N>& y) const {
        return this->any() || y.any();
    }

};

template <size_t N>
std::ostream&
operator<<(std::ostream& os, const _LV<N>& x) {
    return os << x.to_string();
}

template <size_t NC, size_t NT, size_t NF>
_LV< (NC > ((NT > NF) ? NT : NF)) ? NC : ((NT > NF) ? NT : NF)> _IF(const _LV<NC>& c, const _LV<NT>& t, const _LV<NF>& f) {
    if (c.any())
        return t;
    return f;
}

// ############################################################################
// utility functon for parsing dotted-decimal and colon-separated-hex IP address
template <size_t N>
_LV<N> parseIpAddress(const std::string& str) {
    _LV<N> n;
    _LV<N> w;

    if (str.find_first_not_of(":0123456789abcdefABCDEF") == std::string::npos) {
        for(auto c : str) {
            if (c != ':') {
                c = tolower(c);
                w = (w << 4) | ((c <= '9') ? (c - '0') : (c - 'a' + 10));
            }
            else {
                if ((w>>16).any()) std::cerr << "Warning: more than 4 hex digits between colons, truncating to 16-bit value\n";
                n = (n << 16) | (w & 0xFFFF);
                w = 0;
            }
        }
        n = (n << 16) | w;
    }
    else if (str.find_first_not_of(".0123456789") == std::string::npos) {
        for(auto c : str) {
            if (c != '.') {
                w = (w * 10) + (c - '0');
            }
            else {
                if ((w>>16).any()) std::cerr << "Warning: more than one byte between dots, truncating to 8-bit value\n";
                n = (n << 8) | (w & 0xFF);
                w = 0;
            }
        }
        n = (n << 8) | w;
    }
    else {
#ifdef SDNET_ASSERT
        assert(false);
#endif
#ifdef SDNET_EXCEPT
        throw std::range_error("parseIpAddress invalid input address format");
#endif
    }
    return n;
}

// ############################################################################
// section map utility class
template <size_t K>
struct _MAP_COMP {
    bool operator() (const _LV<K>& x, const _LV<K>& y) const { return (x < y).any(); }
};

template <size_t K, size_t V>
class _MAP : public std::map< _LV<K>, _LV<V>, _MAP_COMP<K>> {
public:
    _LV<V> default_value;

    _MAP(std::initializer_list<std::pair<const _LV<K>,_LV<V>>> pair_list, _LV<V> d = _LV<V>(0)) : std::map<_LV<K>,_LV<V>, _MAP_COMP<K>>(pair_list) , default_value(d) {}
    
    _LV<V> operator()(_LV<K> k) const {
        auto i = std::map< _LV<K>,_LV<V>, _MAP_COMP<K>>::find(k);
        if (i != std::map< _LV<K>,_LV<V>, _MAP_COMP<K>>::end()) {
            return i->second;
        }
        return default_value;
    }

};

// ############################################################################
// RAM lookup engine utility class
template <size_t K, size_t V>
class _DIRECT : public std::vector<_LV<V>> {
public:
    std::string name;

    _DIRECT(std::string n, std::string filename) : std::vector<_LV<V>>(1<<K), name(n) {
        std::cout << "[DIRECT::" << name << "] opening file '" << filename << "' for initialization\n";
        std::cout << "table size = " << this->size() << std::endl;
        std::ifstream stream(filename);
        if (!stream.is_open() || !stream.good() || stream.fail() || stream.eof()) {
            std::cout << "[DIRECT::" << name << "] could not read from file\n";
            return;
        }
        std::string line;
        std::string addr_str;
        std::string value_str;
        while(!stream.eof()) {
            std::getline(stream, line);
            std::istringstream iss(line);
            if (line.length() == 0) {
  	          continue;
            } else if (line.find_first_of('#') != std::string::npos) {
                // strip comments
  	            size_t i = line.find_first_of('#');
  	            line.erase(i, line.length()-i);
                if (line.length() == 0)
  		            continue;
  	            else
  		            std::istringstream iss(line);
   	        }
            iss >> addr_str >> value_str;
            _LV<K> address (addr_str,   10);
            _LV<V> value   (value_str,  16);
            this->emplace(this->begin() + address.to_ulong(), value);
            std::cout << "[DIRECT::" << name << "] added rule " << address.to_ulong() << " -> " << value << std::endl;
        }
    }

    std::tuple<bool, _LV<V>> operator()(_LV<K> key) const {
        return std::make_tuple(true, this->at(key.to_ulong()));
    }
};

// ############################################################################
// CAM lookup engine utility class
template <size_t K, size_t V>
class _EM : private std::map< _LV<K>, _LV<V>, _MAP_COMP<K>> {
public:
    std::string name;

    _EM(std::string n, std::string filename) : std::map< _LV<K>, _LV<V>, _MAP_COMP<K>>(), name(n) {
        std::cout << "[EM::" << name << "] opening file '" << filename << "' for initialization\n";
        std::ifstream stream(filename);
        if (!stream.is_open() || !stream.good() || stream.fail() || stream.eof()) {
            std::cout << "[EM::" << name << "] could not read from file\n";
            return;
        }
        std::string line;
        std::string key_str;
        std::string value_str;
        while(!stream.eof()) {
            std::getline(stream, line);
            std::istringstream iss(line);
            if (line.length() == 0) {
	            continue;
            } else if (line.find_first_of('#') != std::string::npos) {
              // strip comments
	          size_t i = line.find_first_of('#');
	          line.erase(i, line.length()-i);
              if (line.length() == 0)
		          continue;
	          else
		          std::istringstream iss(line);
 	        }
            iss >> key_str >> value_str;
            _LV<K> key     (key_str,    16);
            _LV<V> value   (value_str,  16);
            //this->emplace(key, value); // does not yet work in gcc/4.7.4
            this->insert(std::pair<_LV<K>, _LV<V>>(key, value));
            std::cout << "[EM::" << name << "] added rule " << (this->size()-1) << ": " << key << " -> " << value << std::endl;
        }
    }

    std::tuple<bool, _LV<V>> operator()(const _LV<K>& key) const {
        auto i = this->find(key);
        if (i != this->end()) {
            std::cout << "[EM] key " << key << " matched\n";
            return std::make_tuple(true, i->second);
        }
        std::cout << "[EM] key " << key << " did not match any rule \n";
        return std::make_tuple(false, 0);
    }
};

// ############################################################################
// LPM lookup engine utility class
template <size_t K, size_t V>
class _LPM : private std::vector<std::tuple<_LV<K>, int, _LV<V>>> {
public:
    std::string name;
    
    _LPM(std::string n, std::string filename) : std::vector<std::tuple<_LV<K>, int, _LV<V>>>(), name(n) {
        std::cout << "[LPM::" << name << "] opening file '" << filename << "' for initialization\n"; 
        std::ifstream stream(filename);
        if (!stream.is_open() || !stream.good() || stream.fail() || stream.eof()) {
            std::cout << "[LPM::" << name << "] could not read from file\n"; 
            return;
        }
        std::string line;
        std::string prefix_str;
        std::string length_str;
        std::string value_str;
        while(!stream.eof()) {
            std::getline(stream, line);
            std::istringstream iss(line);
            if (line.length() == 0) {
	            continue;
            } else if (line.find_first_of('#') != std::string::npos) {
              // strip comments
	          size_t i = line.find_first_of('#');
	          line.erase(i, line.length()-i);
              if (line.length() == 0)
		          continue;
	          else
		          std::istringstream iss(line);
 	        }
            iss >> prefix_str >> length_str >> value_str;
            _LV<K> prefix  = parseIpAddress<K>(prefix_str);
            _LV<K> length  (length_str,  10);
            _LV<V> value   (value_str,   16);
            this->push_back(std::make_tuple(prefix, length.to_ulong(), value));
            std::cout << "[LPM::" << name << "] added rule " << (this->size()-1) << ": " << prefix << '/' << length.to_ulong() << " -> " << value << std::endl; 
        }
    }

    std::tuple<bool, _LV<V>> operator()(const _LV<K>& key) const {
        int max_length = -1;
        _LV<V> result = ~_LV<V>(0); // LPM outputs a value of all 1's on a miss
        for(auto t : *this) {
            auto prefix = std::get<0>(t);
            auto length = std::get<1>(t);
            auto value  = std::get<2>(t);
            if (length > max_length && ((key ^ prefix) >> (K - length)).none()) { 
                std::cout << "[LPM] key " << key << " matches rule " << " : " << prefix << '/' << length << '\n';
                max_length = length;
                result = value;
            }
        }
        
        if (max_length == -1) std::cout << "[LPM] key " << key << " did not match any rule \n";
        return std::make_tuple(max_length >= 0, result);
    }
};

// ############################################################################
// TCAM lookup engine utility class
template <size_t K, size_t V, size_t N>
class _TCAM : private std::vector<std::tuple<bool, _LV<K>, _LV<K>, _LV<V>>> {
public:
    std::string name;
    
    _TCAM(std::string n, std::string filename) : std::vector<std::tuple<bool, _LV<K>, _LV<K>, _LV<V>>>(N), name(n) {
        std::cout << "[TCAM::" << name << "] opening file '" << filename << "' for initialization\n"; 
        std::ifstream stream(filename);
        if (!stream.is_open() || !stream.good() || stream.fail() || stream.eof()) {
            std::cout << "[TCAM::" << name << "] could not read from file\n"; 
            return;
        }
        std::string line;
        std::string addr_str;
        std::string pattern_str;
        std::string mask_str;
        std::string value_str;
        while(!stream.eof()) {
            std::getline(stream, line);
            std::istringstream iss(line);
            if (line.length() == 0) {
	            continue;
            } else if (line.find_first_of('#') != std::string::npos) {
              // strip comments
	          size_t i = line.find_first_of('#');
	          line.erase(i, line.length()-i);
              if (line.length() == 0)
		          continue;
	          else
		          std::istringstream iss(line);
 	        }
            iss >> addr_str >> pattern_str >> mask_str >> value_str;
            _LV<16> address (addr_str,    10);
            _LV<K> pattern  (pattern_str, 16);
            _LV<K> mask     (mask_str,    16);
            _LV<V> value    (value_str,   16);
            std::cout << "[TCAM::" << name << "] added rule " << address.to_ulong() << ": " << pattern << '/' << mask << " -> " << value << std::endl; 
            this->emplace(this->begin() + address.to_ulong(), true, pattern, mask, value);
        }
    }
    
    std::tuple<bool, _LV<V>> operator()(const _LV<K>& key) const {
        int r = 0;
        for(auto t : *this) {
            auto valid   = std::get<0>(t);
            auto pattern = std::get<1>(t);
            auto mask    = std::get<2>(t);
            auto value   = std::get<3>(t);
            if (valid && ((key ^ pattern) & mask).none()) { 
                std::cout << "[TCAM] key " << key << " matches rule " << r << " : " << pattern << '/' << mask << '\n';
                return std::make_tuple(true, value);
            }
            r++;
        }
        std::cout << "[TCAM] key " << key << " did not match any rule \n";
        if (this->size() > 0) {
            auto t = this->at(0);
            _LV<V> value = std::get<3>(t);
            return std::make_tuple(false, _LV<V>(0)); // return zero instead of first entry
        } else {
            return std::make_tuple(false, _LV<V>(0));
        }
    }
};

// ############################################################################
// packet type and utility functions
typedef std::vector<unsigned char> Packet;

template <size_t N>
_LV<N> extract(const Packet& pkt, size_t bit_offset) {
    _LV<N> r;
    // parsing past eof, should be caught by explicit error checking in the section
    #ifdef SDNET_ASSERT
    assert(bit_offset + N <= pkt.size()*8);
    #endif
    #ifdef SDNET_EXCEPT
    if (bit_offset + N > pkt.size()*8) 
    throw std::range_error("parsing past EOF");
    #endif

    size_t byte_offset = bit_offset / 8;
    // extract first partial byte
    if (bit_offset % 8) {
        size_t first_bits = 8 - bit_offset % 8;
        r = _LV<N>(pkt[byte_offset] & ((1 << first_bits) - 1));
        byte_offset++;
    }
    for (; (byte_offset+1)*8 <= bit_offset + N; byte_offset++) {
        r = (r << _LV<N>(8)) | _LV<N>(pkt[byte_offset]);
    }
    // last partial byte
    if (byte_offset*8 < bit_offset + N) {
        size_t last_bits = (bit_offset + N) % 8;
        r = (r << _LV<N>(last_bits)) | _LV<N>(pkt[byte_offset] >> (8 - last_bits));
    }
    return r;
}

std::ostream& operator<<(std::ostream& os, const Packet& pkt);

void printPacketSlice(std::ostream& stream, const Packet& pkt, size_t from, size_t to);

// Write an input Packet to the output stream with desired bus format and bus width
void busFormatPacket(std::ostream& stream, const Packet& packet, int bus_width, bool isAXI);

// Pcap Global Header
struct pcap_hdr_s { 
    uint32_t magic_number;   /* magic number */
    uint16_t version_major;  /* major version number */
    uint16_t version_minor;  /* minor version number */
    int32_t  thiszone;       /* GMT to local correction */
    uint32_t sigfigs;        /* accuracy of timestamps */
    uint32_t snaplen;        /* max length of captured packets, in octets */
    uint32_t network;        /* data link type */
}; 

// Pcap Record (Packet) Header
struct pcaprec_hdr_s { 
    uint32_t ts_sec;         /* timestamp seconds */
    uint32_t ts_usec;        /* timestamp microseconds */
    uint32_t incl_len;       /* number of octets of packet saved in file */
    uint32_t orig_len;       /* actual length of packet */
}; 


// Read an input packet in TEXT format from the input stream
// Skip spaces, commented lines
// Input packet is terminated by ";" character
Packet ReadPacket(std::istream& fin);

// Read an input packet in PCAP format from the input stream
Packet ReadPcapPacket(std::istream &fin, bool swapped);

// Read PCAP global header from the input stream
bool ReadPcapGlobalHeader(std::istream& fin, bool& swapped);

// Write PCAP global header to the output stream
void WritePcapGlobalHeader(std::ostream& fout);

// Write packet output in PCAP format to the output stream
void WritePcapPacket(std::ostream& fout, const Packet& packet);

// ############################################################################

}
#endif // _SDNET_LIB
