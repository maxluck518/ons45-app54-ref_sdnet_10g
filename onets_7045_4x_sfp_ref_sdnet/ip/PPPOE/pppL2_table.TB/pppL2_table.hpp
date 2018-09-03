#ifndef SDNET_ENGINE_pppL2_table
#define SDNET_ENGINE_pppL2_table

#include "sdnet_lib.hpp"

namespace SDNET {

//######################################################
class pppL2_table { // LookupEngine
public:

	struct Tb_in {
		static const size_t _SIZE = 48;
		_LV<48> dmac;
		Tb_in& operator=(_LV<48> _x) {
			dmac = _x.slice(47,0);
			return *this;
		}
		operator _LV<48>() { return (dmac); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tdmac = " + dmac.to_string() + "\n" + "\t)";
		}
	};
	struct Tb_out {
		static const size_t _SIZE = 29;
		_LV<3> pppL2_tb_list;
		_LV<2> port;
		_LV<12> svid;
		_LV<12> cvid;
		Tb_out& operator=(_LV<29> _x) {
			pppL2_tb_list = _x.slice(28,26);
			port = _x.slice(25,24);
			svid = _x.slice(23,12);
			cvid = _x.slice(11,0);
			return *this;
		}
		operator _LV<29>() { return (pppL2_tb_list,port,svid,cvid); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tpppL2_tb_list = " + pppL2_tb_list.to_string() + "\n" + "\t\tport = " + port.to_string() + "\n" + "\t\tsvid = " + svid.to_string() + "\n" + "\t\tcvid = " + cvid.to_string() + "\n" + "\t)";
		}
	};
	// lookup members
	static const size_t _num_entries = 256;
	static const size_t _key_width   = 48;
	static const size_t _value_width = 29;
	std::string _name;
	Tb_in request;
	Tb_out response;
	_TCAM<_key_width, _value_width, _num_entries> _entries;
	// lookup ctor
	pppL2_table(std::string n, std::string _filename = "") : _name(n) , _entries(n, _filename.empty() ? (n + ".tbl") : _filename) { }
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
extern "C" void pppL2_table_DPI(const char*, int, const char*, int, int, int);


} // namespace SDNET

#endif // SDNET_ENGINE_pppL2_table
