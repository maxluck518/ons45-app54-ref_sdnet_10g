#ifndef SDNET_ENGINE_L2_action
#define SDNET_ENGINE_L2_action

#include "sdnet_lib.hpp"

namespace SDNET {

//######################################################
class L2_action { // EditingEngine 
public:

	// tuple types
	struct Action_extL2_in {
		static const size_t _SIZE = 29;
		_LV<3> extL2_tb_list;
		_LV<2> port;
		_LV<12> svid;
		_LV<12> cvid;
		Action_extL2_in& operator=(_LV<29> _x) {
			extL2_tb_list = _x.slice(28,26);
			port = _x.slice(25,24);
			svid = _x.slice(23,12);
			cvid = _x.slice(11,0);
			return *this;
		}
		operator _LV<29>() { return (extL2_tb_list,port,svid,cvid); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\textL2_tb_list = " + extL2_tb_list.to_string() + "\n" + "\t\tport = " + port.to_string() + "\n" + "\t\tsvid = " + svid.to_string() + "\n" + "\t\tcvid = " + cvid.to_string() + "\n" + "\t)";
		}
	};
	struct Action_pppL2_in {
		static const size_t _SIZE = 29;
		_LV<3> pppL2_tb_list;
		_LV<2> port;
		_LV<12> svid;
		_LV<12> cvid;
		Action_pppL2_in& operator=(_LV<29> _x) {
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
	struct L2_metadata_in {
		static const size_t _SIZE = 4;
		_LV<1> drop;
		_LV<1> L3;
		_LV<1> pppL2;
		_LV<1> extL2;
		L2_metadata_in& operator=(_LV<4> _x) {
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
	struct Header_metadata {
		static const size_t _SIZE = 64;
		_LV<16> pkt_len;
		_LV<8> src_port;
		_LV<8> dst_port;
		_LV<32> pad;
		Header_metadata& operator=(_LV<64> _x) {
			pkt_len = _x.slice(63,48);
			src_port = _x.slice(47,40);
			dst_port = _x.slice(39,32);
			pad = _x.slice(31,0);
			return *this;
		}
		operator _LV<64>() { return (pkt_len,src_port,dst_port,pad); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tpkt_len = " + pkt_len.to_string() + "\n" + "\t\tsrc_port = " + src_port.to_string() + "\n" + "\t\tdst_port = " + dst_port.to_string() + "\n" + "\t\tpad = " + pad.to_string() + "\n" + "\t)";
		}
	};
	struct Output_Tuple {
		static const size_t _SIZE = 128;
		_LV<96> pad;
		_LV<8> dst_port;
		_LV<8> src_port;
		_LV<16> pkt_len;
		Output_Tuple& operator=(_LV<128> _x) {
			pad = _x.slice(127,32);
			dst_port = _x.slice(31,24);
			src_port = _x.slice(23,16);
			pkt_len = _x.slice(15,0);
			return *this;
		}
		operator _LV<128>() { return (pad,dst_port,src_port,pkt_len); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tpad = " + pad.to_string() + "\n" + "\t\tdst_port = " + dst_port.to_string() + "\n" + "\t\tsrc_port = " + src_port.to_string() + "\n" + "\t\tpkt_len = " + pkt_len.to_string() + "\n" + "\t)";
		}
	};
	struct L2_tuple {
		static const size_t _SIZE = 30;
		_LV<1> drop;
		_LV<3> L2_tb_list;
		_LV<2> port;
		_LV<12> svid;
		_LV<12> cvid;
		L2_tuple& operator=(_LV<30> _x) {
			drop = _x.slice(29,29);
			L2_tb_list = _x.slice(28,26);
			port = _x.slice(25,24);
			svid = _x.slice(23,12);
			cvid = _x.slice(11,0);
			return *this;
		}
		operator _LV<30>() { return (drop,L2_tb_list,port,svid,cvid); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tdrop = " + drop.to_string() + "\n" + "\t\tL2_tb_list = " + L2_tb_list.to_string() + "\n" + "\t\tport = " + port.to_string() + "\n" + "\t\tsvid = " + svid.to_string() + "\n" + "\t\tcvid = " + cvid.to_string() + "\n" + "\t)";
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
	typedef void (L2_action::*Section) (int _stage, Packet& packet_in, CONTROL_STRUCT& control, Action_extL2_in& extL2_in, Action_pppL2_in& pppL2_in, L2_metadata_in& metadata_in, Header_metadata& header_metadata, Output_Tuple& output_tuple, L2_tuple& l2_tuple);

	// engine members
	static const int _num_stages = 4;
	std::string _name;
	Section     _sections     [7];
	const char* _section_names[7];

	Packet packet_in;
	Packet packet_out;
	CONTROL_STRUCT control;
	Action_extL2_in extL2_in;
	Action_pppL2_in pppL2_in;
	L2_metadata_in metadata_in;
	Header_metadata header_metadata;
	Output_Tuple output_tuple;
	L2_tuple l2_tuple;

	// engine ctor
	L2_action(std::string n) : _name(n) {
		// initial section
		_sections     [0] = &L2_action::nop;
		_section_names[0] = "nop";
		// section encodings
		_sections     [1] = &L2_action::nop;
		_section_names[1] = "nop";
		_sections     [2] = &L2_action::trans;
		_section_names[2] = "trans";
		_sections     [3] = &L2_action::controller;
		_section_names[3] = "controller";
		_sections     [4] = &L2_action::set_port;
		_section_names[4] = "set_port";
		_sections     [5] = &L2_action::push_vlan;
		_section_names[5] = "push_vlan";
		_sections     [6] = &L2_action::push_qinq;
		_section_names[6] = "push_qinq";
	}

	// engine sections
	void nop(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_extL2_in& extL2_in, Action_pppL2_in& pppL2_in, L2_metadata_in& metadata_in, Header_metadata& header_metadata, Output_Tuple& output_tuple, L2_tuple& l2_tuple) { 
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
		Action_extL2_in _new_extL2_in = extL2_in;
		Action_pppL2_in _new_pppL2_in = pppL2_in;
		L2_metadata_in _new_metadata_in = metadata_in;
		Header_metadata _new_header_metadata = header_metadata;
		Output_Tuple _new_output_tuple = output_tuple;
		L2_tuple _new_l2_tuple = l2_tuple;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_l2_tuple.drop = ( metadata_in.drop || ( ( metadata_in.pppL2 == _LV<1>(0) ) && ( metadata_in.extL2 == _LV<1>(0) ) ) );
		std::cout << "		l2_tuple.drop = " << _new_l2_tuple.drop.to_string() << std::endl;
		_new_l2_tuple.L2_tb_list = _IF(( _LV<3>(metadata_in.pppL2) == _LV<3>(1) ),/*then*/ pppL2_in.pppL2_tb_list, /*else*/extL2_in.extL2_tb_list);
		std::cout << "		l2_tuple.L2_tb_list = " << _new_l2_tuple.L2_tb_list.to_string() << std::endl;
		_new_l2_tuple.port = _IF(( _LV<2>(metadata_in.pppL2) == _LV<2>(1) ),/*then*/ pppL2_in.port, /*else*/extL2_in.port);
		std::cout << "		l2_tuple.port = " << _new_l2_tuple.port.to_string() << std::endl;
		_new_l2_tuple.svid = _IF(( _LV<12>(metadata_in.pppL2) == _LV<12>(1) ),/*then*/ pppL2_in.svid, /*else*/extL2_in.svid);
		std::cout << "		l2_tuple.svid = " << _new_l2_tuple.svid.to_string() << std::endl;
		_new_l2_tuple.cvid = _IF(( _LV<12>(metadata_in.pppL2) == _LV<12>(1) ),/*then*/ pppL2_in.cvid, /*else*/extL2_in.cvid);
		std::cout << "		l2_tuple.cvid = " << _new_l2_tuple.cvid.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<3>(4);
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	extL2_in = " << _new_extL2_in.to_string()  << std::endl;
		std::cout << "	pppL2_in = " << _new_pppL2_in.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	output_tuple = " << _new_output_tuple.to_string()  << std::endl;
		std::cout << "	l2_tuple = " << _new_l2_tuple.to_string()  << std::endl;
		std::cout << "Section nop finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		extL2_in = _new_extL2_in;
		pppL2_in = _new_pppL2_in;
		metadata_in = _new_metadata_in;
		header_metadata = _new_header_metadata;
		output_tuple = _new_output_tuple;
		l2_tuple = _new_l2_tuple;
	}

	void trans(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_extL2_in& extL2_in, Action_pppL2_in& pppL2_in, L2_metadata_in& metadata_in, Header_metadata& header_metadata, Output_Tuple& output_tuple, L2_tuple& l2_tuple) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section trans starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section trans is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_extL2_in _new_extL2_in = extL2_in;
		Action_pppL2_in _new_pppL2_in = pppL2_in;
		L2_metadata_in _new_metadata_in = metadata_in;
		Header_metadata _new_header_metadata = header_metadata;
		Output_Tuple _new_output_tuple = output_tuple;
		L2_tuple _new_l2_tuple = l2_tuple;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_output_tuple.pkt_len = header_metadata.pkt_len;
		std::cout << "		output_tuple.pkt_len = " << _new_output_tuple.pkt_len.to_string() << std::endl;
		_new_output_tuple.pad = _LV<96>(header_metadata.pad);
		std::cout << "		output_tuple.pad = " << _new_output_tuple.pad.to_string() << std::endl;
		_new_output_tuple.src_port = header_metadata.src_port;
		std::cout << "		output_tuple.src_port = " << _new_output_tuple.src_port.to_string() << std::endl;
		_new_output_tuple.dst_port = _LV<8>(128);
		std::cout << "		output_tuple.dst_port = " << _new_output_tuple.dst_port.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// move_to_section
		(_new_control.section, _new_control.done) = _IF(( _LV<4>(l2_tuple.drop) == _LV<4>(1) ),/*then*/ _LV<4>(1), /*else*/_IF(( ( _LV<4>(metadata_in.drop) == _LV<4>(0) ) && ( ( _LV<4>(l2_tuple.L2_tb_list) >> _LV<4>(2) ) == _LV<4>(0) ) ),/*then*/ _LV<4>(6), /*else*/_LV<4>(8)));
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	extL2_in = " << _new_extL2_in.to_string()  << std::endl;
		std::cout << "	pppL2_in = " << _new_pppL2_in.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	output_tuple = " << _new_output_tuple.to_string()  << std::endl;
		std::cout << "	l2_tuple = " << _new_l2_tuple.to_string()  << std::endl;
		std::cout << "Section trans finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		extL2_in = _new_extL2_in;
		pppL2_in = _new_pppL2_in;
		metadata_in = _new_metadata_in;
		header_metadata = _new_header_metadata;
		output_tuple = _new_output_tuple;
		l2_tuple = _new_l2_tuple;
	}

	void controller(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_extL2_in& extL2_in, Action_pppL2_in& pppL2_in, L2_metadata_in& metadata_in, Header_metadata& header_metadata, Output_Tuple& output_tuple, L2_tuple& l2_tuple) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section controller starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 3 :
				break;
			default:
				std::cout << "section controller is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_extL2_in _new_extL2_in = extL2_in;
		Action_pppL2_in _new_pppL2_in = pppL2_in;
		L2_metadata_in _new_metadata_in = metadata_in;
		Header_metadata _new_header_metadata = header_metadata;
		Output_Tuple _new_output_tuple = output_tuple;
		L2_tuple _new_l2_tuple = l2_tuple;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_output_tuple.dst_port = _LV<8>(0);
		std::cout << "		output_tuple.dst_port = " << _new_output_tuple.dst_port.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
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
		std::cout << "	extL2_in = " << _new_extL2_in.to_string()  << std::endl;
		std::cout << "	pppL2_in = " << _new_pppL2_in.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	output_tuple = " << _new_output_tuple.to_string()  << std::endl;
		std::cout << "	l2_tuple = " << _new_l2_tuple.to_string()  << std::endl;
		std::cout << "Section controller finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		extL2_in = _new_extL2_in;
		pppL2_in = _new_pppL2_in;
		metadata_in = _new_metadata_in;
		header_metadata = _new_header_metadata;
		output_tuple = _new_output_tuple;
		l2_tuple = _new_l2_tuple;
	}

	void set_port(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_extL2_in& extL2_in, Action_pppL2_in& pppL2_in, L2_metadata_in& metadata_in, Header_metadata& header_metadata, Output_Tuple& output_tuple, L2_tuple& l2_tuple) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section set_port starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 3 :
				break;
			default:
				std::cout << "section set_port is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_extL2_in _new_extL2_in = extL2_in;
		Action_pppL2_in _new_pppL2_in = pppL2_in;
		L2_metadata_in _new_metadata_in = metadata_in;
		Header_metadata _new_header_metadata = header_metadata;
		Output_Tuple _new_output_tuple = output_tuple;
		L2_tuple _new_l2_tuple = l2_tuple;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_output_tuple.dst_port = ( _LV<8>(l2_tuple.port) + _LV<8>(1) );
		std::cout << "		output_tuple.dst_port = " << _new_output_tuple.dst_port.to_string() << std::endl;
		std::cout << std::endl;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
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
		(_new_control.section, _new_control.done) = _IF(( _LV<4>(l2_tuple.L2_tb_list) == _LV<4>(4) ),/*then*/ _LV<4>(1), /*else*/_IF(( _LV<4>(l2_tuple.L2_tb_list) == _LV<4>(5) ),/*then*/ _LV<4>(12), /*else*/_IF(( _LV<4>(l2_tuple.L2_tb_list) == _LV<4>(6) ),/*then*/ _LV<4>(10), /*else*/_LV<4>(3))));
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	extL2_in = " << _new_extL2_in.to_string()  << std::endl;
		std::cout << "	pppL2_in = " << _new_pppL2_in.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	output_tuple = " << _new_output_tuple.to_string()  << std::endl;
		std::cout << "	l2_tuple = " << _new_l2_tuple.to_string()  << std::endl;
		std::cout << "Section set_port finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		extL2_in = _new_extL2_in;
		pppL2_in = _new_pppL2_in;
		metadata_in = _new_metadata_in;
		header_metadata = _new_header_metadata;
		output_tuple = _new_output_tuple;
		l2_tuple = _new_l2_tuple;
	}

	void push_vlan(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_extL2_in& extL2_in, Action_pppL2_in& pppL2_in, L2_metadata_in& metadata_in, Header_metadata& header_metadata, Output_Tuple& output_tuple, L2_tuple& l2_tuple) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section push_vlan starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 4 :
				break;
			default:
				std::cout << "section push_vlan is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_extL2_in _new_extL2_in = extL2_in;
		Action_pppL2_in _new_pppL2_in = pppL2_in;
		L2_metadata_in _new_metadata_in = metadata_in;
		Header_metadata _new_header_metadata = header_metadata;
		Output_Tuple _new_output_tuple = output_tuple;
		L2_tuple _new_l2_tuple = l2_tuple;
		// declare section struct fields
		_LV<16> vlantype;
		_LV<3> pcp;
		_LV<1> vfi;
		_LV<12> vid;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		std::cout << std::endl;
		// increment_offset
		_new_control.offset = control.offset + _LV<17>(96) ;
		_new_control.virtual_offset = control.virtual_offset + _LV<17>(96) ;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// update packet fields
		std::cout << "	method update (packet)" << std::endl;
		vlantype = _LV<16>(33024);
		std::cout << "		 vlantype = " << vlantype.to_string() << std::endl;
		vid = l2_tuple.svid;
		std::cout << "		 vid = " << vid.to_string() << std::endl;
		std::cout << std::endl;
		// insert 
		std::cout << "	method insert" << std::endl;
		size_t _insert = ( _LV<17>(32)).to_ulong() / 8;
		Packet _insert_packet(_insert);
		_LV<32> _insert_struct = (vlantype,pcp,vfi,vid);
		// insert bytes from struct starting with MSB
		int msb = 31;
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
		std::cout << "	extL2_in = " << _new_extL2_in.to_string()  << std::endl;
		std::cout << "	pppL2_in = " << _new_pppL2_in.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	output_tuple = " << _new_output_tuple.to_string()  << std::endl;
		std::cout << "	l2_tuple = " << _new_l2_tuple.to_string()  << std::endl;
		std::cout << "Section push_vlan finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		extL2_in = _new_extL2_in;
		pppL2_in = _new_pppL2_in;
		metadata_in = _new_metadata_in;
		header_metadata = _new_header_metadata;
		output_tuple = _new_output_tuple;
		l2_tuple = _new_l2_tuple;
	}

	void push_qinq(int _stage, Packet& _packet, CONTROL_STRUCT& control, Action_extL2_in& extL2_in, Action_pppL2_in& pppL2_in, L2_metadata_in& metadata_in, Header_metadata& header_metadata, Output_Tuple& output_tuple, L2_tuple& l2_tuple) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section push_qinq starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 4 :
				break;
			default:
				std::cout << "section push_qinq is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Action_extL2_in _new_extL2_in = extL2_in;
		Action_pppL2_in _new_pppL2_in = pppL2_in;
		L2_metadata_in _new_metadata_in = metadata_in;
		Header_metadata _new_header_metadata = header_metadata;
		Output_Tuple _new_output_tuple = output_tuple;
		L2_tuple _new_l2_tuple = l2_tuple;
		// declare section struct fields
		_LV<16> svlantype;
		_LV<3> spcp;
		_LV<1> svfi;
		_LV<12> svid;
		_LV<16> cvlantype;
		_LV<3> cpcp;
		_LV<1> cvfi;
		_LV<12> cvid;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		std::cout << std::endl;
		// increment_offset
		_new_control.offset = control.offset + _LV<17>(96) ;
		_new_control.virtual_offset = control.virtual_offset + _LV<17>(96) ;
		std::cout << std::endl;
		if( (_new_control.offset.to_ulong() & 7) != 0) { std::cerr << "Warning: rounding offset to byte boundary" << std::endl; }
		_new_control.offset = _new_control.offset & ~_LV<17>(7);
		// update packet fields
		std::cout << "	method update (packet)" << std::endl;
		svlantype = _LV<16>(34984);
		std::cout << "		 svlantype = " << svlantype.to_string() << std::endl;
		svid = l2_tuple.svid;
		std::cout << "		 svid = " << svid.to_string() << std::endl;
		cvlantype = _LV<16>(33024);
		std::cout << "		 cvlantype = " << cvlantype.to_string() << std::endl;
		cvid = l2_tuple.cvid;
		std::cout << "		 cvid = " << cvid.to_string() << std::endl;
		std::cout << std::endl;
		// insert 
		std::cout << "	method insert" << std::endl;
		size_t _insert = ( _LV<17>(64)).to_ulong() / 8;
		Packet _insert_packet(_insert);
		_LV<64> _insert_struct = (svlantype,spcp,svfi,svid,cvlantype,cpcp,cvfi,cvid);
		// insert bytes from struct starting with MSB
		int msb = 63;
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
		std::cout << "	extL2_in = " << _new_extL2_in.to_string()  << std::endl;
		std::cout << "	pppL2_in = " << _new_pppL2_in.to_string()  << std::endl;
		std::cout << "	metadata_in = " << _new_metadata_in.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	output_tuple = " << _new_output_tuple.to_string()  << std::endl;
		std::cout << "	l2_tuple = " << _new_l2_tuple.to_string()  << std::endl;
		std::cout << "Section push_qinq finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		extL2_in = _new_extL2_in;
		pppL2_in = _new_pppL2_in;
		metadata_in = _new_metadata_in;
		header_metadata = _new_header_metadata;
		output_tuple = _new_output_tuple;
		l2_tuple = _new_l2_tuple;
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
		std::cout << "	extL2_in = " << extL2_in.to_string() << std::endl;
		std::cout << "	pppL2_in = " << pppL2_in.to_string() << std::endl;
		std::cout << "	metadata_in = " << metadata_in.to_string() << std::endl;
		std::cout << "	header_metadata = " << header_metadata.to_string() << std::endl;
		// clear internal and output-only tuples:
		std::cout << "clear internal and output-only tuples" << std::endl;
		output_tuple = 0;
		std::cout << "	output_tuple = " << output_tuple.to_string() << std::endl;
		l2_tuple = 0;
		std::cout << "	l2_tuple = " << l2_tuple.to_string() << std::endl;
		// section loop
		for (int _stage = 1; _stage <= 4 && control.done.none() && control.error.none(); _stage++) {
			std::cout << "processing section " << _section_names[control.section.to_ulong()] << " in stage " << _stage << std::endl;
			(this->*_sections[control.section.to_ulong()])(_stage, packet_out, control, extL2_in, pppL2_in, metadata_in, header_metadata, output_tuple, l2_tuple); 
		}
		// inout and output tuples:
		std::cout << "final inout and output tuples:" << std::endl;
		std::cout << "	control = " << control.to_string() << std::endl;
		std::cout << "	output_tuple = " << output_tuple.to_string() << std::endl;
		// output packet
		std::cout << "output packet (" << packet_out.size() << " bytes)" << std::endl;
		std::cout << packet_out;
		std::cout << "Exiting engine " << _name << std::endl;
		std::cout << "===================================================================" << std::endl;
	}
};

//######################################################
// top-level DPI function
extern "C" void L2_action_DPI(const char*, int, const char*, int, int, int);


} // namespace SDNET

#endif // SDNET_ENGINE_L2_action
