#ifndef SDNET_ENGINE_L3_action
#define SDNET_ENGINE_L3_action

#include "sdnet_lib.hpp"

namespace SDNET {

//######################################################
class L3_action { // EditingEngine 
public:

	// tuple types
	struct L3_action_in {
		static const size_t _SIZE = 116;
		_LV<2> mac_id;
		_LV<2> ppp_id;
		_LV<48> dmac;
		_LV<48> smac;
		_LV<16> sid;
		L3_action_in& operator=(_LV<116> _x) {
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
	struct Mac_out {
		static const size_t _SIZE = 49;
		_LV<1> hit;
		_LV<48> dmac;
		Mac_out& operator=(_LV<49> _x) {
			hit = _x.slice(48,48);
			dmac = _x.slice(47,0);
			return *this;
		}
		operator _LV<49>() { return (hit,dmac); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\thit = " + hit.to_string() + "\n" + "\t\tdmac = " + dmac.to_string() + "\n" + "\t)";
		}
	};
	struct L3_metadata_in {
		static const size_t _SIZE = 4;
		_LV<1> drop;
		_LV<1> L3;
		_LV<1> pppL2;
		_LV<1> extL2;
		L3_metadata_in& operator=(_LV<4> _x) {
			drop = _x.slice(3,3);
			L3 = _x.slice(2,2);
			pppL2 = _x.slice(1,1);
			extL2 = _x.slice(0,0);
			return *this;
		}
		operator _LV<4>() { return (drop,L3,pppL2,extL2); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tdrop = " + drop.to_string() + "\n" + "\t\tL3 = " + L3.to_string() + "\n" + "\t\tpppL2 = " + pppL2.to_string() + "\n" + "\t\textL2 = " + extL2.to_string() + "\n" + "\t)";
		}
	};
	struct L3_metadata_out {
		static const size_t _SIZE = 4;
		_LV<1> drop;
		_LV<1> L3;
		_LV<1> pppL2;
		_LV<1> extL2;
		L3_metadata_out& operator=(_LV<4> _x) {
			drop = _x.slice(3,3);
			L3 = _x.slice(2,2);
			pppL2 = _x.slice(1,1);
			extL2 = _x.slice(0,0);
			return *this;
		}
		operator _LV<4>() { return (drop,L3,pppL2,extL2); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tdrop = " + drop.to_string() + "\n" + "\t\tL3 = " + L3.to_string() + "\n" + "\t\tpppL2 = " + pppL2.to_string() + "\n" + "\t\textL2 = " + extL2.to_string() + "\n" + "\t)";
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
	typedef void (L3_action::*Section) (int _stage, Packet& packet_in, CONTROL_STRUCT& control, L3_action_in& action_in, Mac_out& mac_out, L3_metadata_in& metadata_in, L3_metadata_out& metadata_out);

	// engine members
	static const int _num_stages = 3;
	std::string _name;
	Section     _sections     [6];
	const char* _section_names[6];

	Packet packet_in;
	Packet packet_out;
	CONTROL_STRUCT control;
	L3_action_in action_in;
	Mac_out mac_out;
	L3_metadata_in metadata_in;
	L3_metadata_out metadata_out;

	// engine ctor
	L3_action(std::string n) : _name(n) {
		// initial section
		_sections     [0] = &L3_action::nop;
		_section_names[0] = "nop";
		// section encodings
		_sections     [1] = &L3_action::nop;
		_section_names[1] = "nop";
		_sections     [2] = &L3_action::set_dmac;
		_section_names[2] = "set_dmac";
		_sections     [3] = &L3_action::set_smac_dmac;
		_section_names[3] = "set_smac_dmac";
		_sections     [4] = &L3_action::set_sid;
		_section_names[4] = "set_sid";
		_sections     [5] = &L3_action::pop_pppoe;
		_section_names[5] = "pop_pppoe";
	}

	// engine sections
	void nop(int _stage, Packet& _packet, CONTROL_STRUCT& control, L3_action_in& action_in, Mac_out& mac_out, L3_metadata_in& metadata_in, L3_metadata_out& metadata_out) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section nop starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 1 :
				break;
			default:
				std::cout << "section nop is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		L3_action_in _new_action_in = action_in;
		Mac_out _new_mac_out = mac_out;
		L3_metadata_in _new_metadata_in = metadata_in;
		L3_metadata_out _new_metadata_out = metadata_out;
		// maps
		static _MAP<2,3> types(
			{
				{ _LV<2>(0x1), _LV<3>(0x4) },
				{ _LV<2>(0x3), _LV<3>(0x6) }
			},
			_LV<3>(0x1)
		);
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_metadata_out.drop = _IF(( ( _LV<2>(metadata_in.drop) == _LV<2>(1) ) || ( ( action_in.mac_id == _LV<2>(0) ) && ( _LV<2>(metadata_in.L3) == _LV<2>(1) ) ) ),/*then*/ _LV<2>(1), /*else*/_LV<2>(0));
		std::cout << "		metadata_out.drop = " << _new_metadata_out.drop.to_string() << std::endl;
		_new_metadata_out.L3 = metadata_in.L3;
		std::cout << "		metadata_out.L3 = " << _new_metadata_out.L3.to_string() << std::endl;
		_new_metadata_out.pppL2 = metadata_in.pppL2;
		std::cout << "		metadata_out.pppL2 = " << _new_metadata_out.pppL2.to_string() << std::endl;
		_new_metadata_out.extL2 = metadata_in.extL2;
		std::cout << "		metadata_out.extL2 = " << _new_metadata_out.extL2.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// move_to_section
		(_new_control.section, _new_control.done) = _IF(( ( _LV<3>(metadata_in.drop) == _LV<3>(1) ) || ( _LV<3>(action_in.mac_id) == _LV<3>(0) ) ),/*then*/ _LV<3>(1), /*else*/_LV<3>(types( _LV<3>(action_in.mac_id) )));
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
		std::cout << "	mac_out = " << _new_mac_out.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	metadata_out = " << _new_metadata_out.to_string()  << std::endl;
		std::cout << "Section nop finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
		mac_out = _new_mac_out;
		metadata_in = _new_metadata_in;
		metadata_out = _new_metadata_out;
	}

	void set_dmac(int _stage, Packet& _packet, CONTROL_STRUCT& control, L3_action_in& action_in, Mac_out& mac_out, L3_metadata_in& metadata_in, L3_metadata_out& metadata_out) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section set_dmac starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section set_dmac is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		L3_action_in _new_action_in = action_in;
		Mac_out _new_mac_out = mac_out;
		L3_metadata_in _new_metadata_in = metadata_in;
		L3_metadata_out _new_metadata_out = metadata_out;
		// declare section struct fields
		_LV<48> dmac;
		_LV<48> smac;
		// maps
		static _MAP<2,4> types(
			{
				{ _LV<2>(0x0), _LV<4>(0x1) },
				{ _LV<2>(0x1), _LV<4>(0xa) },
				{ _LV<2>(0x2), _LV<4>(0x8) }
			},
			_LV<4>(0x3)
		);
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_mac_out.hit = _LV<1>(1);
		std::cout << "		mac_out.hit = " << _new_mac_out.hit.to_string() << std::endl;
		_new_mac_out.dmac = action_in.dmac;
		std::cout << "		mac_out.dmac = " << _new_mac_out.dmac.to_string() << std::endl;
		std::cout << std::endl;
		// increment_offset
		_new_control.offset = control.offset + _LV<17>(64) ;
		_new_control.virtual_offset = control.virtual_offset + _LV<17>(64) ;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// extract section struct
		(dmac,smac) = extract<96>(_packet, _new_control.offset.to_ulong());
		std::cout << "	extracting 96 bits at offset " << _new_control.offset << std::endl;
		std::cout << "		dmac = " << dmac.to_string() << std::endl;
		std::cout << "		smac = " << smac.to_string() << std::endl;
		std::cout << std::endl;
		// update packet fields
		std::cout << "	method update (packet)" << std::endl;
		dmac = action_in.dmac;
		std::cout << "		 dmac = " << dmac.to_string() << std::endl;
		std::cout << std::endl;
		_LV<96> _update_struct = (dmac,smac);
		// update bytes from struct starting with MSB
		size_t _update_offset = _new_control.offset.to_ulong() / 8;
		std::cout << "	updating " << 12 << " bytes starting with byte " << _update_offset << ':' << std::endl;
		for (int msb = 95; msb >= 7; msb -= 8) {
		    _packet[_update_offset++] = _update_struct.slice(msb, msb-7).to_ulong();
		}
		printPacketSlice(std::cout, _packet, _new_control.offset.to_ulong() / 8, (_new_control.offset.to_ulong() + 96) / 8);
		std::cout << std::endl;
		// increment by the size of the section struct
		std::cout << "	increment offset by the size of the section struct" << std::endl << std::endl;
		_new_control.offset = _new_control.offset + 96 ;
		_new_control.virtual_offset = _new_control.virtual_offset + 96 ;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<4>(types( _LV<4>(action_in.ppp_id) ));
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
		std::cout << "	mac_out = " << _new_mac_out.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	metadata_out = " << _new_metadata_out.to_string()  << std::endl;
		std::cout << "Section set_dmac finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
		mac_out = _new_mac_out;
		metadata_in = _new_metadata_in;
		metadata_out = _new_metadata_out;
	}

	void set_smac_dmac(int _stage, Packet& _packet, CONTROL_STRUCT& control, L3_action_in& action_in, Mac_out& mac_out, L3_metadata_in& metadata_in, L3_metadata_out& metadata_out) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section set_smac_dmac starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section set_smac_dmac is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		L3_action_in _new_action_in = action_in;
		Mac_out _new_mac_out = mac_out;
		L3_metadata_in _new_metadata_in = metadata_in;
		L3_metadata_out _new_metadata_out = metadata_out;
		// declare section struct fields
		_LV<48> dmac;
		_LV<48> smac;
		// maps
		static _MAP<2,4> types(
			{
				{ _LV<2>(0x0), _LV<4>(0x1) },
				{ _LV<2>(0x1), _LV<4>(0xa) },
				{ _LV<2>(0x2), _LV<4>(0x8) }
			},
			_LV<4>(0x3)
		);
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_mac_out.hit = _LV<1>(1);
		std::cout << "		mac_out.hit = " << _new_mac_out.hit.to_string() << std::endl;
		_new_mac_out.dmac = action_in.dmac;
		std::cout << "		mac_out.dmac = " << _new_mac_out.dmac.to_string() << std::endl;
		std::cout << std::endl;
		// increment_offset
		_new_control.offset = control.offset + _LV<17>(64) ;
		_new_control.virtual_offset = control.virtual_offset + _LV<17>(64) ;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// extract section struct
		(dmac,smac) = extract<96>(_packet, _new_control.offset.to_ulong());
		std::cout << "	extracting 96 bits at offset " << _new_control.offset << std::endl;
		std::cout << "		dmac = " << dmac.to_string() << std::endl;
		std::cout << "		smac = " << smac.to_string() << std::endl;
		std::cout << std::endl;
		// update packet fields
		std::cout << "	method update (packet)" << std::endl;
		dmac = action_in.dmac;
		std::cout << "		 dmac = " << dmac.to_string() << std::endl;
		smac = action_in.smac;
		std::cout << "		 smac = " << smac.to_string() << std::endl;
		std::cout << std::endl;
		_LV<96> _update_struct = (dmac,smac);
		// update bytes from struct starting with MSB
		size_t _update_offset = _new_control.offset.to_ulong() / 8;
		std::cout << "	updating " << 12 << " bytes starting with byte " << _update_offset << ':' << std::endl;
		for (int msb = 95; msb >= 7; msb -= 8) {
		    _packet[_update_offset++] = _update_struct.slice(msb, msb-7).to_ulong();
		}
		printPacketSlice(std::cout, _packet, _new_control.offset.to_ulong() / 8, (_new_control.offset.to_ulong() + 96) / 8);
		std::cout << std::endl;
		// increment by the size of the section struct
		std::cout << "	increment offset by the size of the section struct" << std::endl << std::endl;
		_new_control.offset = _new_control.offset + 96 ;
		_new_control.virtual_offset = _new_control.virtual_offset + 96 ;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<4>(types( _LV<4>(action_in.ppp_id) ));
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
		std::cout << "	mac_out = " << _new_mac_out.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	metadata_out = " << _new_metadata_out.to_string()  << std::endl;
		std::cout << "Section set_smac_dmac finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
		mac_out = _new_mac_out;
		metadata_in = _new_metadata_in;
		metadata_out = _new_metadata_out;
	}

	void set_sid(int _stage, Packet& _packet, CONTROL_STRUCT& control, L3_action_in& action_in, Mac_out& mac_out, L3_metadata_in& metadata_in, L3_metadata_out& metadata_out) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section set_sid starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 3 :
				break;
			default:
				std::cout << "section set_sid is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		L3_action_in _new_action_in = action_in;
		Mac_out _new_mac_out = mac_out;
		L3_metadata_in _new_metadata_in = metadata_in;
		L3_metadata_out _new_metadata_out = metadata_out;
		// declare section struct fields
		_LV<16> ethertype;
		_LV<8> version;
		_LV<8> code;
		_LV<16> session_id;
		_LV<16> payload_length;
		_LV<16> ppp_protocol;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_metadata_out.pppL2 = _LV<1>(1);
		std::cout << "		metadata_out.pppL2 = " << _new_metadata_out.pppL2.to_string() << std::endl;
		_new_metadata_out.extL2 = _LV<1>(0);
		std::cout << "		metadata_out.extL2 = " << _new_metadata_out.extL2.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// extract section struct
		(ethertype,version,code,session_id,payload_length,ppp_protocol) = extract<80>(_packet, _new_control.offset.to_ulong());
		std::cout << "	extracting 80 bits at offset " << _new_control.offset << std::endl;
		std::cout << "		ethertype = " << ethertype.to_string() << std::endl;
		std::cout << "		version = " << version.to_string() << std::endl;
		std::cout << "		code = " << code.to_string() << std::endl;
		std::cout << "		session_id = " << session_id.to_string() << std::endl;
		std::cout << "		payload_length = " << payload_length.to_string() << std::endl;
		std::cout << "		ppp_protocol = " << ppp_protocol.to_string() << std::endl;
		std::cout << std::endl;
		// update packet fields
		std::cout << "	method update (packet)" << std::endl;
		session_id = action_in.sid;
		std::cout << "		 session_id = " << session_id.to_string() << std::endl;
		std::cout << std::endl;
		_LV<80> _update_struct = (ethertype,version,code,session_id,payload_length,ppp_protocol);
		// update bytes from struct starting with MSB
		size_t _update_offset = _new_control.offset.to_ulong() / 8;
		std::cout << "	updating " << 10 << " bytes starting with byte " << _update_offset << ':' << std::endl;
		for (int msb = 79; msb >= 7; msb -= 8) {
		    _packet[_update_offset++] = _update_struct.slice(msb, msb-7).to_ulong();
		}
		printPacketSlice(std::cout, _packet, _new_control.offset.to_ulong() / 8, (_new_control.offset.to_ulong() + 80) / 8);
		std::cout << std::endl;
		// increment by the size of the section struct
		std::cout << "	increment offset by the size of the section struct" << std::endl << std::endl;
		_new_control.offset = _new_control.offset + 80 ;
		_new_control.virtual_offset = _new_control.virtual_offset + 80 ;
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
		std::cout << "	mac_out = " << _new_mac_out.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	metadata_out = " << _new_metadata_out.to_string()  << std::endl;
		std::cout << "Section set_sid finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
		mac_out = _new_mac_out;
		metadata_in = _new_metadata_in;
		metadata_out = _new_metadata_out;
	}

	void pop_pppoe(int _stage, Packet& _packet, CONTROL_STRUCT& control, L3_action_in& action_in, Mac_out& mac_out, L3_metadata_in& metadata_in, L3_metadata_out& metadata_out) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section pop_pppoe starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 3 :
				break;
			default:
				std::cout << "section pop_pppoe is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		L3_action_in _new_action_in = action_in;
		Mac_out _new_mac_out = mac_out;
		L3_metadata_in _new_metadata_in = metadata_in;
		L3_metadata_out _new_metadata_out = metadata_out;
		// declare section struct fields
		_LV<16> ethertype;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_metadata_out.pppL2 = _LV<1>(0);
		std::cout << "		metadata_out.pppL2 = " << _new_metadata_out.pppL2.to_string() << std::endl;
		_new_metadata_out.extL2 = _LV<1>(1);
		std::cout << "		metadata_out.extL2 = " << _new_metadata_out.extL2.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// update packet fields
		std::cout << "	method update (packet)" << std::endl;
		ethertype = _LV<16>(2048);
		std::cout << "		 ethertype = " << ethertype.to_string() << std::endl;
		std::cout << std::endl;
		// remove 
		std::cout << "	method remove" << std::endl;
		size_t _remove = (_LV<17>(80)).to_ulong() / 8;
		size_t _remove_offset = _new_control.offset.to_ulong() / 8;
		std::cout << "	removing " << _remove << " bytes at byte " << _remove_offset << ':' << std::endl;
		printPacketSlice(std::cout, _packet, _remove_offset, _remove_offset + _remove);
		_packet.erase( _packet.begin() + _remove_offset, _packet.begin() + _remove_offset + _remove);
		// increment virtual_offset by the amount of remove 
		_new_control.virtual_offset = _new_control.virtual_offset + _remove * 8;
		// insert 
		std::cout << "	method insert" << std::endl;
		size_t _insert = ( _LV<17>(16)).to_ulong() / 8;
		Packet _insert_packet(_insert);
		_LV<16> _insert_struct = (ethertype);
		// insert bytes from struct starting with MSB
		int msb = 15;
		for (int i = 0; i < _insert && msb >= 7; msb -= 8, i++) {
		_insert_packet[i] = _insert_struct.slice(msb, msb-7).to_ulong();
		}
		size_t _insert_offset = _new_control.offset.to_ulong() / 8;
		_packet.insert( _packet.begin() + _insert_offset, _insert_packet.begin(),  _insert_packet.end());
		std::cout << "	inserting " << _insert << " bytes at byte " << _insert_offset << ':' << std::endl;
		printPacketSlice(std::cout, _packet, _insert_offset, _insert_offset + _insert);
		// increment offset by the amount of insert 
		_new_control.offset = _new_control.offset + _insert * 8;
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
		std::cout << "	mac_out = " << _new_mac_out.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	metadata_out = " << _new_metadata_out.to_string()  << std::endl;
		std::cout << "Section pop_pppoe finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
		mac_out = _new_mac_out;
		metadata_in = _new_metadata_in;
		metadata_out = _new_metadata_out;
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
		std::cout << "	metadata_in = " << metadata_in.to_string() << std::endl;
		// clear internal and output-only tuples:
		std::cout << "clear internal and output-only tuples" << std::endl;
		mac_out = 0;
		std::cout << "	mac_out = " << mac_out.to_string() << std::endl;
		metadata_out = 0;
		std::cout << "	metadata_out = " << metadata_out.to_string() << std::endl;
		// section loop
		for (int _stage = 1; _stage <= 3 && control.done.none() && control.error.none(); _stage++) {
			std::cout << "processing section " << _section_names[control.section.to_ulong()] << " in stage " << _stage << std::endl;
			(this->*_sections[control.section.to_ulong()])(_stage, packet_out, control, action_in, mac_out, metadata_in, metadata_out); 
		}
		// inout and output tuples:
		std::cout << "final inout and output tuples:" << std::endl;
		std::cout << "	control = " << control.to_string() << std::endl;
		std::cout << "	mac_out = " << mac_out.to_string() << std::endl;
		std::cout << "	metadata_out = " << metadata_out.to_string() << std::endl;
		// output packet
		std::cout << "output packet (" << packet_out.size() << " bytes)" << std::endl;
		std::cout << packet_out;
		std::cout << "Exiting engine " << _name << std::endl;
		std::cout << "===================================================================" << std::endl;
	}
};

//######################################################
// top-level DPI function
extern "C" void L3_action_DPI(const char*, int, const char*, int, int, int);


} // namespace SDNET

#endif // SDNET_ENGINE_L3_action
