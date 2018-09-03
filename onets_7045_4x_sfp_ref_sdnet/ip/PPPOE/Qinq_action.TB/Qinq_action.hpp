#ifndef SDNET_ENGINE_Qinq_action
#define SDNET_ENGINE_Qinq_action

#include "sdnet_lib.hpp"

namespace SDNET {

//######################################################
class Qinq_action { // EditingEngine 
public:

	// tuple types
	struct Action_in {
		static const size_t _SIZE = 2;
		_LV<2> qinq_tb_list;
		Action_in& operator=(_LV<2> _x) {
			qinq_tb_list = _x.slice(1,0);
			return *this;
		}
		operator _LV<2>() { return (qinq_tb_list); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tqinq_tb_list = " + qinq_tb_list.to_string() + "\n" + "\t)";
		}
	};
	struct CONTROL_STRUCT {
		static const size_t _SIZE = 42;
		_LV<17> offset;
		_LV<17> virtual_offset;
		_LV<3> section;
		_LV<1> activeBank;
		_LV<1> done;
		_LV<3> error;
		CONTROL_STRUCT& operator=(_LV<42> _x) {
			offset = _x.slice(41,25);
			virtual_offset = _x.slice(24,8);
			section = _x.slice(7,5);
			activeBank = _x.slice(4,4);
			done = _x.slice(3,3);
			error = _x.slice(2,0);
			return *this;
		}
		operator _LV<42>() { return (offset,virtual_offset,section,activeBank,done,error); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\toffset = " + offset.to_string() + "\n" + "\t\tvirtual_offset = " + virtual_offset.to_string() + "\n" + "\t\tsection = " + section.to_string() + "\n" + "\t\tactiveBank = " + activeBank.to_string() + "\n" + "\t\tdone = " + done.to_string() + "\n" + "\t\terror = " + error.to_string() + "\n" + "\t)";
		}
	};

	// section function pointer signature
	typedef void (Qinq_action::*Section) (int _stage, Packet& packet_in, CONTROL_STRUCT& control, Action_in& action_in);

	// engine members
	static const int _num_stages = 2;
	std::string _name;
	Section     _sections     [5];
	const char* _section_names[5];

	Packet packet_in;
	Packet packet_out;
	CONTROL_STRUCT control;
	Action_in action_in;

	// engine ctor
	Qinq_action(std::string n) : _name(n) {
		// initial section
		_sections     [0] = &Qinq_action::judge;
		_section_names[0] = "judge";
		// section encodings
		_sections     [1] = &Qinq_action::judge;
		_section_names[1] = "judge";
		_sections     [2] = &Qinq_action::nop;
		_section_names[2] = "nop";
		_sections     [3] = &Qinq_action::pop_vlan;
		_section_names[3] = "pop_vlan";
		_sections     [4] = &Qinq_action::pop_qinq;
		_section_names[4] = "pop_qinq";
	}

	// engine sections
	void judge(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_in& action_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section judge starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 1 :
				break;
			default:
				std::cout << "section judge is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_in _new_action_in = action_in;
		// declare section struct fields
		_LV<16> pkt_len;
		_LV<8> src_port;
		_LV<8> dst_port;
		_LV<32> pad;
		_LV<48> smac;
		_LV<48> dmac;
		// maps
		static _MAP<2,4> types(
			{
				{ _LV<2>(0x0), _LV<4>(0x4) },
				{ _LV<2>(0x1), _LV<4>(0x6) },
				{ _LV<2>(0x2), _LV<4>(0x8) }
			},
			_LV<4>(0x3)
		);
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// extract section struct
		(pkt_len,src_port,dst_port,pad,smac,dmac) = extract<160>(_packet, _new_control.offset.to_ulong());
		std::cout << "	extracting 160 bits at offset " << _new_control.offset << std::endl;
		std::cout << "		pkt_len = " << pkt_len.to_string() << std::endl;
		std::cout << "		src_port = " << src_port.to_string() << std::endl;
		std::cout << "		dst_port = " << dst_port.to_string() << std::endl;
		std::cout << "		pad = " << pad.to_string() << std::endl;
		std::cout << "		smac = " << smac.to_string() << std::endl;
		std::cout << "		dmac = " << dmac.to_string() << std::endl;
		std::cout << std::endl;
		// update packet fields
		std::cout << "	method update (packet)" << std::endl;
		std::cout << std::endl;
		_LV<160> _update_struct = (pkt_len,src_port,dst_port,pad,smac,dmac);
		// update bytes from struct starting with MSB
		size_t _update_offset = _new_control.offset.to_ulong() / 8;
		std::cout << "	updating " << 20 << " bytes starting with byte " << _update_offset << ':' << std::endl;
		for (int msb = 159; msb >= 7; msb -= 8) {
		    _packet[_update_offset++] = _update_struct.slice(msb, msb-7).to_ulong();
		}
		printPacketSlice(std::cout, _packet, _new_control.offset.to_ulong() / 8, (_new_control.offset.to_ulong() + 160) / 8);
		std::cout << std::endl;
		// increment by the size of the section struct
		std::cout << "	increment offset by the size of the section struct" << std::endl << std::endl;
		_new_control.offset = _new_control.offset + 160 ;
		_new_control.virtual_offset = _new_control.virtual_offset + 160 ;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<4>(types( _LV<4>(action_in.qinq_tb_list) ));
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	action_in = " << _new_action_in.to_string()  << std::endl;
		std::cout << "Section judge finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
	}

	void nop(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_in& action_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section nop starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section nop is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_in _new_action_in = action_in;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// remove 
		std::cout << "	method remove" << std::endl;
		size_t _remove = (_LV<17>(0)).to_ulong() / 8;
		size_t _remove_offset = _new_control.offset.to_ulong() / 8;
		std::cout << "	removing " << _remove << " bytes at byte " << _remove_offset << ':' << std::endl;
		printPacketSlice(std::cout, _packet, _remove_offset, _remove_offset + _remove);
		_packet.erase( _packet.begin() + _remove_offset, _packet.begin() + _remove_offset + _remove);
		// increment virtual_offset by the amount of remove 
		_new_control.virtual_offset = _new_control.virtual_offset + _remove * 8;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<3>(1);
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	action_in = " << _new_action_in.to_string()  << std::endl;
		std::cout << "Section nop finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
	}

	void pop_vlan(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_in& action_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section pop_vlan starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section pop_vlan is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_in _new_action_in = action_in;
		// declare section struct fields
		_LV<3> pcp;
		_LV<1> vfi;
		_LV<12> vid;
		_LV<16> ethertype;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// update packet fields
		std::cout << "	method update (packet)" << std::endl;
		std::cout << std::endl;
		// remove 
		std::cout << "	method remove" << std::endl;
		size_t _remove = (_LV<17>(32)).to_ulong() / 8;
		size_t _remove_offset = _new_control.offset.to_ulong() / 8;
		std::cout << "	removing " << _remove << " bytes at byte " << _remove_offset << ':' << std::endl;
		printPacketSlice(std::cout, _packet, _remove_offset, _remove_offset + _remove);
		_packet.erase( _packet.begin() + _remove_offset, _packet.begin() + _remove_offset + _remove);
		// increment virtual_offset by the amount of remove 
		_new_control.virtual_offset = _new_control.virtual_offset + _remove * 8;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<3>(1);
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	action_in = " << _new_action_in.to_string()  << std::endl;
		std::cout << "Section pop_vlan finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
	}

	void pop_qinq(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_in& action_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section pop_qinq starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section pop_qinq is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_in _new_action_in = action_in;
		// declare section struct fields
		_LV<3> spcp;
		_LV<1> svfi;
		_LV<12> svid;
		_LV<16> svlantype;
		_LV<3> cpcp;
		_LV<1> cvfi;
		_LV<12> cvid;
		_LV<16> cvlantype;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// update packet fields
		std::cout << "	method update (packet)" << std::endl;
		std::cout << std::endl;
		// remove 
		std::cout << "	method remove" << std::endl;
		size_t _remove = (_LV<17>(64)).to_ulong() / 8;
		size_t _remove_offset = _new_control.offset.to_ulong() / 8;
		std::cout << "	removing " << _remove << " bytes at byte " << _remove_offset << ':' << std::endl;
		printPacketSlice(std::cout, _packet, _remove_offset, _remove_offset + _remove);
		_packet.erase( _packet.begin() + _remove_offset, _packet.begin() + _remove_offset + _remove);
		// increment virtual_offset by the amount of remove 
		_new_control.virtual_offset = _new_control.virtual_offset + _remove * 8;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<3>(1);
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	action_in = " << _new_action_in.to_string()  << std::endl;
		std::cout << "Section pop_qinq finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
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
		// input and inout tuples:
		std::cout << "initial input and inout tuples:" << std::endl;
		std::cout << "	control = " << control.to_string() << std::endl;
		std::cout << "	action_in = " << action_in.to_string() << std::endl;
		// clear internal and output-only tuples:
		std::cout << "clear internal and output-only tuples" << std::endl;
		// section loop
		for (int _stage = 1; _stage <= 2 && control.done.none() && control.error.none(); _stage++) {
			std::cout << "processing section " << _section_names[control.section.to_ulong()] << " in stage " << _stage << std::endl;
			(this->*_sections[control.section.to_ulong()])(_stage, packet_out, control, action_in); 
		}
		// inout and output tuples:
		std::cout << "final inout and output tuples:" << std::endl;
		std::cout << "	control = " << control.to_string() << std::endl;
		// output packet
		std::cout << "output packet (" << packet_out.size() << " bytes)" << std::endl;
		std::cout << packet_out;
		std::cout << "Exiting engine " << _name << std::endl;
		std::cout << "===================================================================" << std::endl;
	}
};

//######################################################
// top-level DPI function
extern "C" void Qinq_action_DPI(const char*, int, const char*, int, int, int);


} // namespace SDNET

#endif // SDNET_ENGINE_Qinq_action
