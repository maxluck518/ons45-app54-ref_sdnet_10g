#ifndef SDNET_ENGINE_Qinq_table
#define SDNET_ENGINE_Qinq_table

#include "sdnet_lib.hpp"

namespace SDNET {

//######################################################
class Qinq_table { // LookupEngine
public:

	struct Tb_in {
		static const size_t _SIZE = 24;
		_LV<16> eth_type;
		_LV<8> pppoe_dis_code;
		Tb_in& operator=(_LV<24> _x) {
			eth_type = _x.slice(23,8);
			pppoe_dis_code = _x.slice(7,0);
			return *this;
		}
		operator _LV<24>() { return (eth_type,pppoe_dis_code); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\teth_type = " + eth_type.to_string() + "\n" + "\t\tpppoe_dis_code = " + pppoe_dis_code.to_string() + "\n" + "\t)";
		}
	};
	struct Tb_out {
		static const size_t _SIZE = 2;
		_LV<2> qinq_tb_list;
		Tb_out& operator=(_LV<2> _x) {
			qinq_tb_list = _x.slice(1,0);
			return *this;
		}
		operator _LV<2>() { return (qinq_tb_list); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tqinq_tb_list = " + qinq_tb_list.to_string() + "\n" + "\t)";
		}
	};
	// lookup members
	static const size_t _num_entries = 256;
	static const size_t _key_width   = 24;
	static const size_t _value_width = 2;
	std::string _name;
	Tb_in request;
	Tb_out response;
	_TCAM<_key_width, _value_width, _num_entries> _entries;
	// lookup ctor
	Qinq_table(std::string n, std::string _filename = "") : _name(n) , _entries(n, _filename.empty() ? (n + ".tbl") : _filename) { }
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
extern "C" void Qinq_table_DPI(const char*, int, const char*, int, int, int);


} // namespace SDNET

#endif // SDNET_ENGINE_Qinq_table
