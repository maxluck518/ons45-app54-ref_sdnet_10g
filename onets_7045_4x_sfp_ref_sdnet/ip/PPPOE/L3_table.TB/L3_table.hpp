#ifndef SDNET_ENGINE_L3_table
#define SDNET_ENGINE_L3_table

#include "sdnet_lib.hpp"

namespace SDNET {

//######################################################
class L3_table { // LookupEngine
public:

	struct Tb_in {
		static const size_t _SIZE = 32;
		_LV<32> dst_ip;
		Tb_in& operator=(_LV<32> _x) {
			dst_ip = _x.slice(31,0);
			return *this;
		}
		operator _LV<32>() { return (dst_ip); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tdst_ip = " + dst_ip.to_string() + "\n" + "\t)";
		}
	};
	struct Tb_out {
		static const size_t _SIZE = 116;
		_LV<2> mac_id;
		_LV<2> ppp_id;
		_LV<48> dmac;
		_LV<48> smac;
		_LV<16> sid;
		Tb_out& operator=(_LV<116> _x) {
			mac_id = _x.slice(115,114);
			ppp_id = _x.slice(113,112);
			dmac = _x.slice(111,64);
			smac = _x.slice(63,16);
			sid = _x.slice(15,0);
			return *this;
		}
		operator _LV<116>() { return (mac_id,ppp_id,dmac,smac,sid); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tmac_id = " + mac_id.to_string() + "\n" + "\t\tppp_id = " + ppp_id.to_string() + "\n" + "\t\tdmac = " + dmac.to_string() + "\n" + "\t\tsmac = " + smac.to_string() + "\n" + "\t\tsid = " + sid.to_string() + "\n" + "\t)";
		}
	};
	// lookup members
	static const size_t _num_entries = 256;
	static const size_t _key_width   = 32;
	static const size_t _value_width = 116;
	std::string _name;
	Tb_in request;
	Tb_out response;
	_TCAM<_key_width, _value_width, _num_entries> _entries;
	// lookup ctor
	L3_table(std::string n, std::string _filename = "") : _name(n) , _entries(n, _filename.empty() ? (n + ".tbl") : _filename) { }
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
extern "C" void L3_table_DPI(const char*, int, const char*, int, int, int);


} // namespace SDNET

#endif // SDNET_ENGINE_L3_table
