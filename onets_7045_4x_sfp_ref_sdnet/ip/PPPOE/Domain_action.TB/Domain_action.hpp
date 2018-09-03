#ifndef SDNET_ENGINE_Domain_action
#define SDNET_ENGINE_Domain_action

#include "sdnet_lib.hpp"

namespace SDNET {

//######################################################
class Domain_action { // EditingEngine 
public:

	// tuple types
	struct Action_in {
		static const size_t _SIZE = 3;
		_LV<3> domain_tb_list;
		Action_in& operator=(_LV<3> _x) {
			domain_tb_list = _x.slice(2,0);
			return *this;
		}
		operator _LV<3>() { return (domain_tb_list); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tdomain_tb_list = " + domain_tb_list.to_string() + "\n" + "\t)";
		}
	};
	struct Parser_metadata_in {
		static const size_t _SIZE = 200;
		_LV<48> eth_smac;
		_LV<48> eth_dmac;
		_LV<16> eth_type;
		_LV<32> sa;
		_LV<32> da;
		_LV<8> proto;
		_LV<16> ipv4_length;
		Parser_metadata_in& operator=(_LV<200> _x) {
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
	struct Domain_metadata_in {
		static const size_t _SIZE = 4;
		_LV<1> drop;
		_LV<1> L3;
		_LV<1> pppL2;
		_LV<1> extL2;
		Domain_metadata_in& operator=(_LV<4> _x) {
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
	struct Domain_metadata_out {
		static const size_t _SIZE = 4;
		_LV<1> drop;
		_LV<1> L3;
		_LV<1> pppL2;
		_LV<1> extL2;
		Domain_metadata_out& operator=(_LV<4> _x) {
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
	typedef void (Domain_action::*Section) (int _stage, Packet& packet_in, CONTROL_STRUCT& control, Action_in& action_in, Parser_metadata_in& metadata, Domain_metadata_in& metadata_in, Domain_metadata_out& metadata_out);

	// engine members
	static const int _num_stages = 2;
	std::string _name;
	Section     _sections     [7];
	const char* _section_names[7];

	Packet packet_in;
	Packet packet_out;
	CONTROL_STRUCT control;
	Action_in action_in;
	Parser_metadata_in metadata;
	Domain_metadata_in metadata_in;
	Domain_metadata_out metadata_out;

	// engine ctor
	Domain_action(std::string n) : _name(n) {
		// initial section
		_sections     [0] = &Domain_action::drop;
		_section_names[0] = "drop";
		// section encodings
		_sections     [1] = &Domain_action::drop;
		_section_names[1] = "drop";
		_sections     [2] = &Domain_action::nop;
		_section_names[2] = "nop";
		_sections     [3] = &Domain_action::L3;
		_section_names[3] = "L3";
		_sections     [4] = &Domain_action::pppL2;
		_section_names[4] = "pppL2";
		_sections     [5] = &Domain_action::extL2;
		_section_names[5] = "extL2";
		_sections     [6] = &Domain_action::L3_push_pppoe;
		_section_names[6] = "L3_push_pppoe";
	}

	// engine sections
	void drop(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_in& action_in, Parser_metadata_in& metadata, Domain_metadata_in& metadata_in, Domain_metadata_out& metadata_out) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section drop starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 1 :
				break;
			default:
				std::cout << "section drop is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_in _new_action_in = action_in;
		Parser_metadata_in _new_metadata = metadata;
		Domain_metadata_in _new_metadata_in = metadata_in;
		Domain_metadata_out _new_metadata_out = metadata_out;
		// maps
		static _MAP<3,4> types(
			{
				{ _LV<3>(0x0), _LV<4>(0x4) },
				{ _LV<3>(0x1), _LV<4>(0x6) },
				{ _LV<3>(0x2), _LV<4>(0x8) },
				{ _LV<3>(0x3), _LV<4>(0xa) },
				{ _LV<3>(0x4), _LV<4>(0xc) }
			},
			_LV<4>(0x3)
		);
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_metadata_out.drop = _IF(( action_in.domain_tb_list == _LV<3>(0) ),/*then*/ _LV<3>(1), /*else*/_LV<3>(0));
		std::cout << "		metadata_out.drop = " << _new_metadata_out.drop.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<4>(types( _LV<4>(action_in.domain_tb_list) ));
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
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	metadata_out = " << _new_metadata_out.to_string()  << std::endl;
		std::cout << "Section drop finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
		metadata = _new_metadata;
		metadata_in = _new_metadata_in;
		metadata_out = _new_metadata_out;
	}

	void nop(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_in& action_in, Parser_metadata_in& metadata, Domain_metadata_in& metadata_in, Domain_metadata_out& metadata_out) { 
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
		Parser_metadata_in _new_metadata = metadata;
		Domain_metadata_in _new_metadata_in = metadata_in;
		Domain_metadata_out _new_metadata_out = metadata_out;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_metadata_out.L3 = _LV<1>(0);
		std::cout << "		metadata_out.L3 = " << _new_metadata_out.L3.to_string() << std::endl;
		_new_metadata_out.pppL2 = _LV<1>(0);
		std::cout << "		metadata_out.pppL2 = " << _new_metadata_out.pppL2.to_string() << std::endl;
		_new_metadata_out.extL2 = _LV<1>(0);
		std::cout << "		metadata_out.extL2 = " << _new_metadata_out.extL2.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
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
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	metadata_out = " << _new_metadata_out.to_string()  << std::endl;
		std::cout << "Section nop finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
		metadata = _new_metadata;
		metadata_in = _new_metadata_in;
		metadata_out = _new_metadata_out;
	}

	void L3(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_in& action_in, Parser_metadata_in& metadata, Domain_metadata_in& metadata_in, Domain_metadata_out& metadata_out) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section L3 starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section L3 is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_in _new_action_in = action_in;
		Parser_metadata_in _new_metadata = metadata;
		Domain_metadata_in _new_metadata_in = metadata_in;
		Domain_metadata_out _new_metadata_out = metadata_out;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_metadata_out.L3 = _LV<1>(1);
		std::cout << "		metadata_out.L3 = " << _new_metadata_out.L3.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
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
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	metadata_out = " << _new_metadata_out.to_string()  << std::endl;
		std::cout << "Section L3 finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
		metadata = _new_metadata;
		metadata_in = _new_metadata_in;
		metadata_out = _new_metadata_out;
	}

	void pppL2(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_in& action_in, Parser_metadata_in& metadata, Domain_metadata_in& metadata_in, Domain_metadata_out& metadata_out) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section pppL2 starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section pppL2 is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_in _new_action_in = action_in;
		Parser_metadata_in _new_metadata = metadata;
		Domain_metadata_in _new_metadata_in = metadata_in;
		Domain_metadata_out _new_metadata_out = metadata_out;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_metadata_out.pppL2 = _LV<1>(1);
		std::cout << "		metadata_out.pppL2 = " << _new_metadata_out.pppL2.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
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
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	metadata_out = " << _new_metadata_out.to_string()  << std::endl;
		std::cout << "Section pppL2 finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
		metadata = _new_metadata;
		metadata_in = _new_metadata_in;
		metadata_out = _new_metadata_out;
	}

	void extL2(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_in& action_in, Parser_metadata_in& metadata, Domain_metadata_in& metadata_in, Domain_metadata_out& metadata_out) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section extL2 starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section extL2 is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_in _new_action_in = action_in;
		Parser_metadata_in _new_metadata = metadata;
		Domain_metadata_in _new_metadata_in = metadata_in;
		Domain_metadata_out _new_metadata_out = metadata_out;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_metadata_out.extL2 = _LV<1>(1);
		std::cout << "		metadata_out.extL2 = " << _new_metadata_out.extL2.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
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
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	metadata_out = " << _new_metadata_out.to_string()  << std::endl;
		std::cout << "Section extL2 finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
		metadata = _new_metadata;
		metadata_in = _new_metadata_in;
		metadata_out = _new_metadata_out;
	}

	void L3_push_pppoe(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_in& action_in, Parser_metadata_in& metadata, Domain_metadata_in& metadata_in, Domain_metadata_out& metadata_out) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section L3_push_pppoe starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section L3_push_pppoe is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_in _new_action_in = action_in;
		Parser_metadata_in _new_metadata = metadata;
		Domain_metadata_in _new_metadata_in = metadata_in;
		Domain_metadata_out _new_metadata_out = metadata_out;
		// declare section struct fields
		_LV<16> ethertype;
		_LV<8> version;
		_LV<8> code;
		_LV<16> session_id;
		_LV<16> payload_length;
		_LV<16> ppp_protocol;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_metadata_out.L3 = _LV<1>(1);
		std::cout << "		metadata_out.L3 = " << _new_metadata_out.L3.to_string() << std::endl;
		_new_metadata_out.pppL2 = _LV<1>(1);
		std::cout << "		metadata_out.pppL2 = " << _new_metadata_out.pppL2.to_string() << std::endl;
		_new_metadata_out.extL2 = _LV<1>(0);
		std::cout << "		metadata_out.extL2 = " << _new_metadata_out.extL2.to_string() << std::endl;
		std::cout << std::endl;
		// increment_offset
		_new_control.offset = control.offset + _LV<17>(160) ;
		_new_control.virtual_offset = control.virtual_offset + _LV<17>(160) ;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// update packet fields
		std::cout << "	method update (packet)" << std::endl;
		ethertype = _LV<16>(34916);
		std::cout << "		 ethertype = " << ethertype.to_string() << std::endl;
		version = _LV<8>(17);
		std::cout << "		 version = " << version.to_string() << std::endl;
		code = _LV<8>(0);
		std::cout << "		 code = " << code.to_string() << std::endl;
		session_id = _LV<16>(0);
		std::cout << "		 session_id = " << session_id.to_string() << std::endl;
		payload_length = ( metadata.ipv4_length + _LV<16>(2) );
		std::cout << "		 payload_length = " << payload_length.to_string() << std::endl;
		ppp_protocol = _LV<16>(33);
		std::cout << "		 ppp_protocol = " << ppp_protocol.to_string() << std::endl;
		std::cout << std::endl;
		// remove 
		std::cout << "	method remove" << std::endl;
		size_t _remove = (_LV<17>(16)).to_ulong() / 8;
		size_t _remove_offset = _new_control.offset.to_ulong() / 8;
		std::cout << "	removing " << _remove << " bytes at byte " << _remove_offset << ':' << std::endl;
		printPacketSlice(std::cout, _packet, _remove_offset, _remove_offset + _remove);
		_packet.erase( _packet.begin() + _remove_offset, _packet.begin() + _remove_offset + _remove);
		// increment virtual_offset by the amount of remove 
		_new_control.virtual_offset = _new_control.virtual_offset + _remove * 8;
		// insert 
		std::cout << "	method insert" << std::endl;
		size_t _insert = ( _LV<17>(80)).to_ulong() / 8;
		Packet _insert_packet(_insert);
		_LV<80> _insert_struct = (ethertype,version,code,session_id,payload_length,ppp_protocol);
		// insert bytes from struct starting with MSB
		int msb = 79;
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
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	metadata_out = " << _new_metadata_out.to_string()  << std::endl;
		std::cout << "Section L3_push_pppoe finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		action_in = _new_action_in;
		metadata = _new_metadata;
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
		std::cout << "	metadata = " << metadata.to_string() << std::endl;
		std::cout << "	metadata_in = " << metadata_in.to_string() << std::endl;
		// clear internal and output-only tuples:
		std::cout << "clear internal and output-only tuples" << std::endl;
		metadata_out = 0;
		std::cout << "	metadata_out = " << metadata_out.to_string() << std::endl;
		// section loop
		for (int _stage = 1; _stage <= 2 && control.done.none() && control.error.none(); _stage++) {
			std::cout << "processing section " << _section_names[control.section.to_ulong()] << " in stage " << _stage << std::endl;
			(this->*_sections[control.section.to_ulong()])(_stage, packet_out, control, action_in, metadata, metadata_in, metadata_out); 
		}
		// inout and output tuples:
		std::cout << "final inout and output tuples:" << std::endl;
		std::cout << "	control = " << control.to_string() << std::endl;
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
extern "C" void Domain_action_DPI(const char*, int, const char*, int, int, int);


} // namespace SDNET

#endif // SDNET_ENGINE_Domain_action
