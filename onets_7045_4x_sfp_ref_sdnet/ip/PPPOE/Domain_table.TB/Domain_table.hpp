#ifndef SDNET_ENGINE_Domain_table
#define SDNET_ENGINE_Domain_table

#include "sdnet_lib.hpp"

namespace SDNET {

//######################################################
class Domain_table { // LookupEngine
public:

	struct Tb_in {
		static const size_t _SIZE = 32;
		_LV<16> eth_type;
		_LV<16> ppp_protocol;
		Tb_in& operator=(_LV<32> _x) {
			eth_type = _x.slice(31,16);
			ppp_protocol = _x.slice(15,0);
			return *this;
		}
		operator _LV<32>() { return (eth_type,ppp_protocol); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\teth_type = " + eth_type.to_string() + "\n" + "\t\tppp_protocol = " + ppp_protocol.to_string() + "\n" + "\t)";
		}
	};
	struct Tb_out {
		static const size_t _SIZE = 3;
		_LV<3> domain_tb_list;
		Tb_out& operator=(_LV<3> _x) {
			domain_tb_list = _x.slice(2,0);
			return *this;
		}
		operator _LV<3>() { return (domain_tb_list); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tdomain_tb_list = " + domain_tb_list.to_string() + "\n" + "\t)";
		}
	};
	// lookup members
	static const size_t _num_entries = 256;
	static const size_t _key_width   = 32;
	static const size_t _value_width = 3;
	std::string _name;
	Tb_in request;
	Tb_out response;
	_TCAM<_key_width, _value_width, _num_entries> _entries;
	// lookup ctor
	Domain_table(std::string n, std::string _filename = "") : _name(n) , _entries(n, _filename.empty() ? (n + ".tbl") : _filename) { }
	// engine function
	void operator()(){
		std::cout << "===================================================================" << std::endl;
		std::cout << "Entering engine " << _name << std::endl;
		// input tuple:
		std::cout << "input key tuple:" << std::endl;
		std::cout << "	request = " << request.to_string() << std::endl;
		auto _value = _entries(request);
		response = std::get<1>(_value);
		// output value tuple:
		std::cout << "	response = " << response.to_string() << std::endl;
		std::cout << "Exiting engine " << _name << std::endl;
		std::cout << "===================================================================" << std::endl;
	}
};
//######################################################
// top-level DPI function
extern "C" void Domain_table_DPI(const char*, int, const char*, int, int, int);


} // namespace SDNET

#endif // SDNET_ENGINE_Domain_table
