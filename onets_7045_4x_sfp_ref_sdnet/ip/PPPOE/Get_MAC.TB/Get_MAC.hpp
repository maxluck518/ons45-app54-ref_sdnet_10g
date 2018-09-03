#ifndef SDNET_ENGINE_Get_MAC
#define SDNET_ENGINE_Get_MAC

#include "sdnet_lib.hpp"

namespace SDNET {

//######################################################
class Get_MAC { // TupleEngine 
public:

	// tuple types
	struct L3_mac_in {
		static const size_t _SIZE = 49;
		_LV<1> hit;
		_LV<48> dmac;
		L3_mac_in& operator=(_LV<49> _x) {
			hit = _x.slice(48,48);
			dmac = _x.slice(47,0);
			return *this;
		}
		operator _LV<49>() { return (hit,dmac); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\thit = " + hit.to_string() + "\n" + "\t\tdmac = " + dmac.to_string() + "\n" + "\t)";
		}
	};
	struct Origin_mac_in {
		static const size_t _SIZE = 200;
		_LV<48> eth_smac;
		_LV<48> eth_dmac;
		_LV<16> eth_type;
		_LV<32> sa;
		_LV<32> da;
		_LV<8> proto;
		_LV<16> ipv4_length;
		Origin_mac_in& operator=(_LV<200> _x) {
			eth_smac = _x.slice(199,152);
			eth_dmac = _x.slice(151,104);
			eth_type = _x.slice(103,88);
			sa = _x.slice(87,56);
			da = _x.slice(55,24);
			proto = _x.slice(23,16);
			ipv4_length = _x.slice(15,0);
			return *this;
		}
		operator _LV<200>() { return (eth_smac,eth_dmac,eth_type,sa,da,proto,ipv4_length); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\teth_smac = " + eth_smac.to_string() + "\n" + "\t\teth_dmac = " + eth_dmac.to_string() + "\n" + "\t\teth_type = " + eth_type.to_string() + "\n" + "\t\tsa = " + sa.to_string() + "\n" + "\t\tda = " + da.to_string() + "\n" + "\t\tproto = " + proto.to_string() + "\n" + "\t\tipv4_length = " + ipv4_length.to_string() + "\n" + "\t)";
		}
	};
	struct Mac_out {
		static const size_t _SIZE = 48;
		_LV<48> dmac;
		Mac_out& operator=(_LV<48> _x) {
			dmac = _x.slice(47,0);
			return *this;
		}
		operator _LV<48>() { return (dmac); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tdmac = " + dmac.to_string() + "\n" + "\t)";
		}
	};
	struct CONTROL_STRUCT {
		static const size_t _SIZE = 26;
		_LV<10> offset;
		_LV<10> virtual_offset;
		_LV<1> section;
		_LV<1> activeBank;
		_LV<1> done;
		_LV<3> error;
		CONTROL_STRUCT& operator=(_LV<26> _x) {
			offset = _x.slice(25,16);
			virtual_offset = _x.slice(15,6);
			section = _x.slice(5,5);
			activeBank = _x.slice(4,4);
			done = _x.slice(3,3);
			error = _x.slice(2,0);
			return *this;
		}
		operator _LV<26>() { return (offset,virtual_offset,section,activeBank,done,error); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\toffset = " + offset.to_string() + "\n" + "\t\tvirtual_offset = " + virtual_offset.to_string() + "\n" + "\t\tsection = " + section.to_string() + "\n" + "\t\tactiveBank = " + activeBank.to_string() + "\n" + "\t\tdone = " + done.to_string() + "\n" + "\t\terror = " + error.to_string() + "\n" + "\t)";
		}
	};

	// section function pointer signature
	typedef void (Get_MAC::*Section) (int _stage, Packet& packet_in, CONTROL_STRUCT& control, L3_mac_in& l3_mac, Origin_mac_in& origin_mac, Mac_out& mac_out);

	// engine members
	static const int _num_stages = 1;
	std::string _name;
	Section     _sections     [2];
	const char* _section_names[2];

	Packet packet_in;
	Packet packet_out;
	CONTROL_STRUCT control;
	L3_mac_in l3_mac;
	Origin_mac_in origin_mac;
	Mac_out mac_out;

	// engine ctor
	Get_MAC(std::string n) : _name(n) {
		// initial section
		_sections     [0] = &Get_MAC::mac;
		_section_names[0] = "mac";
		// section encodings
		_sections     [1] = &Get_MAC::mac;
		_section_names[1] = "mac";
	}

	// engine sections
	void mac(int _stage, Packet& _packet, CONTROL_STRUCT& control, L3_mac_in& l3_mac, Origin_mac_in& origin_mac, Mac_out& mac_out) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section mac starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 1 :
				break;
			default:
				std::cout << "section mac is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		L3_mac_in _new_l3_mac = l3_mac;
		Origin_mac_in _new_origin_mac = origin_mac;
		Mac_out _new_mac_out = mac_out;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_mac_out.dmac = _IF(( _LV<48>(l3_mac.hit) == _LV<48>(1) ),/*then*/ l3_mac.dmac, /*else*/origin_mac.eth_dmac);
		std::cout << "		mac_out.dmac = " << _new_mac_out.dmac.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<1>(1);
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	l3_mac = " << _new_l3_mac.to_string()  << std::endl;
		std::cout << "	origin_mac = " << _new_origin_mac.to_string()  << std::endl;
		std::cout << "	mac_out = " << _new_mac_out.to_string()  << std::endl;
		std::cout << "Section mac finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		l3_mac = _new_l3_mac;
		origin_mac = _new_origin_mac;
		mac_out = _new_mac_out;
	}


	// engine function
	void operator()() {
		std::cout << "===================================================================" << std::endl;
		std::cout << "Entering engine " << _name << std::endl;
		// input packet:
		std::cout << "input packet (" << packet_in.size() << " bytes)" << std::endl;
		std::cout << packet_in;
		// copy input packet
		packet_out = packet_in;
		// clear control tuple for tuple engine
		control = 0;
		// input and inout tuples:
		std::cout << "initial input and inout tuples:" << std::endl;
		std::cout << "	l3_mac = " << l3_mac.to_string() << std::endl;
		std::cout << "	origin_mac = " << origin_mac.to_string() << std::endl;
		// clear internal and output-only tuples:
		std::cout << "clear internal and output-only tuples" << std::endl;
		control = 0;
		std::cout << "	control = " << control.to_string() << std::endl;
		mac_out = 0;
		std::cout << "	mac_out = " << mac_out.to_string() << std::endl;
		// section loop
		for (int _stage = 1; _stage <= 1 && control.done.none() && control.error.none(); _stage++) {
			std::cout << "processing section " << _section_names[control.section.to_ulong()] << " in stage " << _stage << std::endl;
			(this->*_sections[control.section.to_ulong()])(_stage, packet_out, control, l3_mac, origin_mac, mac_out); 
		}
		// inout and output tuples:
		std::cout << "final inout and output tuples:" << std::endl;
		std::cout << "	mac_out = " << mac_out.to_string() << std::endl;
		std::cout << "Exiting engine " << _name << std::endl;
		std::cout << "===================================================================" << std::endl;
	}
};

//######################################################
// top-level DPI function
extern "C" void Get_MAC_DPI(const char*, int, const char*, int, int, int);


} // namespace SDNET

#endif // SDNET_ENGINE_Get_MAC
