#ifndef SDNET_ENGINE_Parser
#define SDNET_ENGINE_Parser

#include "sdnet_lib.hpp"

namespace SDNET {

//######################################################
class Parser { // ParsingEngine 
public:

	// tuple types
	struct Metadata {
		static const size_t _SIZE = 200;
		_LV<48> eth_smac;
		_LV<48> eth_dmac;
		_LV<16> eth_type;
		_LV<32> sa;
		_LV<32> da;
		_LV<8> proto;
		_LV<16> ipv4_length;
		Metadata& operator=(_LV<200> _x) {
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
	struct Parser_domain_metadata_out {
		static const size_t _SIZE = 4;
		_LV<1> drop;
		_LV<1> L3;
		_LV<1> pppL2;
		_LV<1> extL2;
		Parser_domain_metadata_out& operator=(_LV<4> _x) {
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
	struct Qinq_tb_in {
		static const size_t _SIZE = 24;
		_LV<16> eth_type;
		_LV<8> pppoe_dis_code;
		Qinq_tb_in& operator=(_LV<24> _x) {
			eth_type = _x.slice(23,8);
			pppoe_dis_code = _x.slice(7,0);
			return *this;
		}
		operator _LV<24>() { return (eth_type,pppoe_dis_code); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\teth_type = " + eth_type.to_string() + "\n" + "\t\tpppoe_dis_code = " + pppoe_dis_code.to_string() + "\n" + "\t)";
		}
	};
	struct Domain_tb_in {
		static const size_t _SIZE = 32;
		_LV<16> eth_type;
		_LV<16> ppp_protocol;
		Domain_tb_in& operator=(_LV<32> _x) {
			eth_type = _x.slice(31,16);
			ppp_protocol = _x.slice(15,0);
			return *this;
		}
		operator _LV<32>() { return (eth_type,ppp_protocol); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\teth_type = " + eth_type.to_string() + "\n" + "\t\tppp_protocol = " + ppp_protocol.to_string() + "\n" + "\t)";
		}
	};
	struct L3_tb_in {
		static const size_t _SIZE = 32;
		_LV<32> dst_ip;
		L3_tb_in& operator=(_LV<32> _x) {
			dst_ip = _x.slice(31,0);
			return *this;
		}
		operator _LV<32>() { return (dst_ip); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\tdst_ip = " + dst_ip.to_string() + "\n" + "\t)";
		}
	};
	struct CONTROL_STRUCT {
		static const size_t _SIZE = 43;
		_LV<17> offset;
		_LV<17> virtual_offset;
		_LV<4> section;
		_LV<1> activeBank;
		_LV<1> done;
		_LV<3> error;
		CONTROL_STRUCT& operator=(_LV<43> _x) {
			offset = _x.slice(42,26);
			virtual_offset = _x.slice(25,9);
			section = _x.slice(8,5);
			activeBank = _x.slice(4,4);
			done = _x.slice(3,3);
			error = _x.slice(2,0);
			return *this;
		}
		operator _LV<43>() { return (offset,virtual_offset,section,activeBank,done,error); }
		std::string to_string() const {
			return std::string("(\n")  + "\t\toffset = " + offset.to_string() + "\n" + "\t\tvirtual_offset = " + virtual_offset.to_string() + "\n" + "\t\tsection = " + section.to_string() + "\n" + "\t\tactiveBank = " + activeBank.to_string() + "\n" + "\t\tdone = " + done.to_string() + "\n" + "\t\terror = " + error.to_string() + "\n" + "\t)";
		}
	};

	// section function pointer signature
	typedef void (Parser::*Section) (int _stage, Packet& packet_in, CONTROL_STRUCT& control, Metadata& metadata, Header_metadata& header_metadata, Parser_domain_metadata_out& domain_metadata_out, Qinq_tb_in& qinq_tb_in, Domain_tb_in& domain_tb_in, L3_tb_in& l3_tb_in);

	// engine members
	static const int _num_stages = 5;
	std::string _name;
	Section     _sections     [11];
	const char* _section_names[11];

	Packet packet_in;
	Packet packet_out;
	CONTROL_STRUCT control;
	Metadata metadata;
	Header_metadata header_metadata;
	Parser_domain_metadata_out domain_metadata_out;
	Qinq_tb_in qinq_tb_in;
	Domain_tb_in domain_tb_in;
	L3_tb_in l3_tb_in;

	// engine ctor
	Parser(std::string n) : _name(n) {
		// initial section
		_sections     [0] = &Parser::Ethernet;
		_section_names[0] = "Ethernet";
		// section encodings
		_sections     [1] = &Parser::Ethernet;
		_section_names[1] = "Ethernet";
		_sections     [2] = &Parser::VLAN;
		_section_names[2] = "VLAN";
		_sections     [3] = &Parser::QINQ;
		_section_names[3] = "QINQ";
		_sections     [4] = &Parser::PPPOE_DIS;
		_section_names[4] = "PPPOE_DIS";
		_sections     [5] = &Parser::PPPOE_SES;
		_section_names[5] = "PPPOE_SES";
		_sections     [6] = &Parser::ARP;
		_section_names[6] = "ARP";
		_sections     [7] = &Parser::IPv4;
		_section_names[7] = "IPv4";
		_sections     [8] = &Parser::TCP;
		_section_names[8] = "TCP";
		_sections     [9] = &Parser::UDP;
		_section_names[9] = "UDP";
		_sections     [10] = &Parser::ICMP;
		_section_names[10] = "ICMP";
	}

	// engine sections
	void Ethernet(int _stage, Packet& _packet, CONTROL_STRUCT& control, Metadata& metadata, Header_metadata& header_metadata, Parser_domain_metadata_out& domain_metadata_out, Qinq_tb_in& qinq_tb_in, Domain_tb_in& domain_tb_in, L3_tb_in& l3_tb_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section Ethernet starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 1 :
				break;
			default:
				std::cout << "section Ethernet is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Metadata _new_metadata = metadata;
		Header_metadata _new_header_metadata = header_metadata;
		Parser_domain_metadata_out _new_domain_metadata_out = domain_metadata_out;
		Qinq_tb_in _new_qinq_tb_in = qinq_tb_in;
		Domain_tb_in _new_domain_tb_in = domain_tb_in;
		L3_tb_in _new_l3_tb_in = l3_tb_in;
		// declare section struct fields
		_LV<16> pkt_len;
		_LV<8> src_port;
		_LV<8> dst_port;
		_LV<32> pad;
		_LV<48> dmac;
		_LV<48> smac;
		_LV<16> ethertype;
		std::cout << "	extracting 176 bits at offset " << control.offset << std::endl;
		// check for parsing past EOP
		if (control.offset.to_ulong() + 176 > _packet.size()*8) {
			std::cout << "ERROR: attempting to parse past the end of packet" << std::endl;
			control.error = 2;
			return;
		}
		// extract section struct
		(pkt_len,src_port,dst_port,pad,dmac,smac,ethertype) = extract<176>(_packet, control.offset.to_ulong());
		std::cout << "		pkt_len = " << pkt_len.to_string() << std::endl;
		std::cout << "		src_port = " << src_port.to_string() << std::endl;
		std::cout << "		dst_port = " << dst_port.to_string() << std::endl;
		std::cout << "		pad = " << pad.to_string() << std::endl;
		std::cout << "		dmac = " << dmac.to_string() << std::endl;
		std::cout << "		smac = " << smac.to_string() << std::endl;
		std::cout << "		ethertype = " << ethertype.to_string() << std::endl;
		std::cout << std::endl;
		// maps
		static _MAP<16,4> types(
			{
				{ _LV<16>(0x8100), _LV<4>(0x4) },
				{ _LV<16>(0x800), _LV<4>(0xe) },
				{ _LV<16>(0x88a8), _LV<4>(0x6) },
				{ _LV<16>(0x806), _LV<4>(0xc) },
				{ _LV<16>(0x8863), _LV<4>(0x8) },
				{ _LV<16>(0x8864), _LV<4>(0xa) }
			},
			_LV<4>(0x3)
		);
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_qinq_tb_in.eth_type = ethertype;
		std::cout << "		qinq_tb_in.eth_type = " << _new_qinq_tb_in.eth_type.to_string() << std::endl;
		_new_domain_tb_in.eth_type = ethertype;
		std::cout << "		domain_tb_in.eth_type = " << _new_domain_tb_in.eth_type.to_string() << std::endl;
		_new_header_metadata.pkt_len = pkt_len;
		std::cout << "		header_metadata.pkt_len = " << _new_header_metadata.pkt_len.to_string() << std::endl;
		_new_header_metadata.src_port = src_port;
		std::cout << "		header_metadata.src_port = " << _new_header_metadata.src_port.to_string() << std::endl;
		_new_header_metadata.dst_port = dst_port;
		std::cout << "		header_metadata.dst_port = " << _new_header_metadata.dst_port.to_string() << std::endl;
		_new_header_metadata.pad = pad;
		std::cout << "		header_metadata.pad = " << _new_header_metadata.pad.to_string() << std::endl;
		_new_metadata.eth_type = ethertype;
		std::cout << "		metadata.eth_type = " << _new_metadata.eth_type.to_string() << std::endl;
		_new_metadata.eth_dmac = dmac;
		std::cout << "		metadata.eth_dmac = " << _new_metadata.eth_dmac.to_string() << std::endl;
		_new_metadata.eth_smac = smac;
		std::cout << "		metadata.eth_smac = " << _new_metadata.eth_smac.to_string() << std::endl;
		_new_domain_metadata_out.L3 = _LV<1>(0);
		std::cout << "		domain_metadata_out.L3 = " << _new_domain_metadata_out.L3.to_string() << std::endl;
		_new_domain_metadata_out.pppL2 = _LV<1>(0);
		std::cout << "		domain_metadata_out.pppL2 = " << _new_domain_metadata_out.pppL2.to_string() << std::endl;
		_new_domain_metadata_out.extL2 = _LV<1>(0);
		std::cout << "		domain_metadata_out.extL2 = " << _new_domain_metadata_out.extL2.to_string() << std::endl;
		_new_domain_metadata_out.drop = _LV<1>(0);
		std::cout << "		domain_metadata_out.drop = " << _new_domain_metadata_out.drop.to_string() << std::endl;
		std::cout << std::endl;
		// default increment by the size of the section struct
		std::cout << "\tincrementing offset by the size of the struct: 176 bits " << std::endl;
		_new_control.offset = control.offset + 176 ;
		_new_control.virtual_offset = control.virtual_offset + 176 ;
		std::cout << std::endl;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<16>(types( ethertype ));
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	domain_metadata_out = " << _new_domain_metadata_out.to_string()  << std::endl;
		std::cout << "	qinq_tb_in = " << _new_qinq_tb_in.to_string()  << std::endl;
		std::cout << "	domain_tb_in = " << _new_domain_tb_in.to_string()  << std::endl;
		std::cout << "	l3_tb_in = " << _new_l3_tb_in.to_string()  << std::endl;
		std::cout << "Section Ethernet finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		metadata = _new_metadata;
		header_metadata = _new_header_metadata;
		domain_metadata_out = _new_domain_metadata_out;
		qinq_tb_in = _new_qinq_tb_in;
		domain_tb_in = _new_domain_tb_in;
		l3_tb_in = _new_l3_tb_in;
	}

	void VLAN(int _stage, Packet& _packet, CONTROL_STRUCT& control, Metadata& metadata, Header_metadata& header_metadata, Parser_domain_metadata_out& domain_metadata_out, Qinq_tb_in& qinq_tb_in, Domain_tb_in& domain_tb_in, L3_tb_in& l3_tb_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section VLAN starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section VLAN is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Metadata _new_metadata = metadata;
		Header_metadata _new_header_metadata = header_metadata;
		Parser_domain_metadata_out _new_domain_metadata_out = domain_metadata_out;
		Qinq_tb_in _new_qinq_tb_in = qinq_tb_in;
		Domain_tb_in _new_domain_tb_in = domain_tb_in;
		L3_tb_in _new_l3_tb_in = l3_tb_in;
		// declare section struct fields
		_LV<3> pcp;
		_LV<1> vfi;
		_LV<12> vid;
		_LV<16> ethertype;
		std::cout << "	extracting 32 bits at offset " << control.offset << std::endl;
		// check for parsing past EOP
		if (control.offset.to_ulong() + 32 > _packet.size()*8) {
			std::cout << "ERROR: attempting to parse past the end of packet" << std::endl;
			control.error = 2;
			return;
		}
		// extract section struct
		(pcp,vfi,vid,ethertype) = extract<32>(_packet, control.offset.to_ulong());
		std::cout << "		pcp = " << pcp.to_string() << std::endl;
		std::cout << "		vfi = " << vfi.to_string() << std::endl;
		std::cout << "		vid = " << vid.to_string() << std::endl;
		std::cout << "		ethertype = " << ethertype.to_string() << std::endl;
		std::cout << std::endl;
		// maps
		static _MAP<16,4> types(
			{
				{ _LV<16>(0x800), _LV<4>(0xe) },
				{ _LV<16>(0x8863), _LV<4>(0x8) },
				{ _LV<16>(0x8864), _LV<4>(0xa) }
			},
			_LV<4>(0x5)
		);
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_domain_tb_in.eth_type = ethertype;
		std::cout << "		domain_tb_in.eth_type = " << _new_domain_tb_in.eth_type.to_string() << std::endl;
		std::cout << std::endl;
		// default increment by the size of the section struct
		std::cout << "\tincrementing offset by the size of the struct: 32 bits " << std::endl;
		_new_control.offset = control.offset + 32 ;
		_new_control.virtual_offset = control.virtual_offset + 32 ;
		std::cout << std::endl;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<16>(types( ethertype ));
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	domain_metadata_out = " << _new_domain_metadata_out.to_string()  << std::endl;
		std::cout << "	qinq_tb_in = " << _new_qinq_tb_in.to_string()  << std::endl;
		std::cout << "	domain_tb_in = " << _new_domain_tb_in.to_string()  << std::endl;
		std::cout << "	l3_tb_in = " << _new_l3_tb_in.to_string()  << std::endl;
		std::cout << "Section VLAN finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		metadata = _new_metadata;
		header_metadata = _new_header_metadata;
		domain_metadata_out = _new_domain_metadata_out;
		qinq_tb_in = _new_qinq_tb_in;
		domain_tb_in = _new_domain_tb_in;
		l3_tb_in = _new_l3_tb_in;
	}

	void QINQ(int _stage, Packet& _packet, CONTROL_STRUCT& control, Metadata& metadata, Header_metadata& header_metadata, Parser_domain_metadata_out& domain_metadata_out, Qinq_tb_in& qinq_tb_in, Domain_tb_in& domain_tb_in, L3_tb_in& l3_tb_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section QINQ starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section QINQ is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Metadata _new_metadata = metadata;
		Header_metadata _new_header_metadata = header_metadata;
		Parser_domain_metadata_out _new_domain_metadata_out = domain_metadata_out;
		Qinq_tb_in _new_qinq_tb_in = qinq_tb_in;
		Domain_tb_in _new_domain_tb_in = domain_tb_in;
		L3_tb_in _new_l3_tb_in = l3_tb_in;
		// declare section struct fields
		_LV<3> spcp;
		_LV<1> svfi;
		_LV<12> svid;
		_LV<16> svlantype;
		_LV<3> cpcp;
		_LV<1> cvfi;
		_LV<12> cvid;
		_LV<16> cvlantype;
		std::cout << "	extracting 64 bits at offset " << control.offset << std::endl;
		// check for parsing past EOP
		if (control.offset.to_ulong() + 64 > _packet.size()*8) {
			std::cout << "ERROR: attempting to parse past the end of packet" << std::endl;
			control.error = 2;
			return;
		}
		// extract section struct
		(spcp,svfi,svid,svlantype,cpcp,cvfi,cvid,cvlantype) = extract<64>(_packet, control.offset.to_ulong());
		std::cout << "		spcp = " << spcp.to_string() << std::endl;
		std::cout << "		svfi = " << svfi.to_string() << std::endl;
		std::cout << "		svid = " << svid.to_string() << std::endl;
		std::cout << "		svlantype = " << svlantype.to_string() << std::endl;
		std::cout << "		cpcp = " << cpcp.to_string() << std::endl;
		std::cout << "		cvfi = " << cvfi.to_string() << std::endl;
		std::cout << "		cvid = " << cvid.to_string() << std::endl;
		std::cout << "		cvlantype = " << cvlantype.to_string() << std::endl;
		std::cout << std::endl;
		// maps
		static _MAP<16,4> types(
			{
				{ _LV<16>(0x800), _LV<4>(0xe) },
				{ _LV<16>(0x8863), _LV<4>(0x8) },
				{ _LV<16>(0x8864), _LV<4>(0xa) }
			},
			_LV<4>(0x7)
		);
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_domain_tb_in.eth_type = cvlantype;
		std::cout << "		domain_tb_in.eth_type = " << _new_domain_tb_in.eth_type.to_string() << std::endl;
		std::cout << std::endl;
		// default increment by the size of the section struct
		std::cout << "\tincrementing offset by the size of the struct: 64 bits " << std::endl;
		_new_control.offset = control.offset + 64 ;
		_new_control.virtual_offset = control.virtual_offset + 64 ;
		std::cout << std::endl;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<16>(types( cvlantype ));
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	domain_metadata_out = " << _new_domain_metadata_out.to_string()  << std::endl;
		std::cout << "	qinq_tb_in = " << _new_qinq_tb_in.to_string()  << std::endl;
		std::cout << "	domain_tb_in = " << _new_domain_tb_in.to_string()  << std::endl;
		std::cout << "	l3_tb_in = " << _new_l3_tb_in.to_string()  << std::endl;
		std::cout << "Section QINQ finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		metadata = _new_metadata;
		header_metadata = _new_header_metadata;
		domain_metadata_out = _new_domain_metadata_out;
		qinq_tb_in = _new_qinq_tb_in;
		domain_tb_in = _new_domain_tb_in;
		l3_tb_in = _new_l3_tb_in;
	}

	void PPPOE_DIS(int _stage, Packet& _packet, CONTROL_STRUCT& control, Metadata& metadata, Header_metadata& header_metadata, Parser_domain_metadata_out& domain_metadata_out, Qinq_tb_in& qinq_tb_in, Domain_tb_in& domain_tb_in, L3_tb_in& l3_tb_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section PPPOE_DIS starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
			case 3 :
				break;
			default:
				std::cout << "section PPPOE_DIS is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Metadata _new_metadata = metadata;
		Header_metadata _new_header_metadata = header_metadata;
		Parser_domain_metadata_out _new_domain_metadata_out = domain_metadata_out;
		Qinq_tb_in _new_qinq_tb_in = qinq_tb_in;
		Domain_tb_in _new_domain_tb_in = domain_tb_in;
		L3_tb_in _new_l3_tb_in = l3_tb_in;
		// declare section struct fields
		_LV<8> version;
		_LV<8> code;
		_LV<16> session_id;
		_LV<16> payload_length;
		std::cout << "	extracting 48 bits at offset " << control.offset << std::endl;
		// check for parsing past EOP
		if (control.offset.to_ulong() + 48 > _packet.size()*8) {
			std::cout << "ERROR: attempting to parse past the end of packet" << std::endl;
			control.error = 2;
			return;
		}
		// extract section struct
		(version,code,session_id,payload_length) = extract<48>(_packet, control.offset.to_ulong());
		std::cout << "		version = " << version.to_string() << std::endl;
		std::cout << "		code = " << code.to_string() << std::endl;
		std::cout << "		session_id = " << session_id.to_string() << std::endl;
		std::cout << "		payload_length = " << payload_length.to_string() << std::endl;
		std::cout << std::endl;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_qinq_tb_in.pppoe_dis_code = code;
		std::cout << "		qinq_tb_in.pppoe_dis_code = " << _new_qinq_tb_in.pppoe_dis_code.to_string() << std::endl;
		std::cout << std::endl;
		// default increment by the size of the section struct
		std::cout << "\tincrementing offset by the size of the struct: 48 bits " << std::endl;
		_new_control.offset = control.offset + 48 ;
		_new_control.virtual_offset = control.virtual_offset + 48 ;
		std::cout << std::endl;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<4>(1);
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	domain_metadata_out = " << _new_domain_metadata_out.to_string()  << std::endl;
		std::cout << "	qinq_tb_in = " << _new_qinq_tb_in.to_string()  << std::endl;
		std::cout << "	domain_tb_in = " << _new_domain_tb_in.to_string()  << std::endl;
		std::cout << "	l3_tb_in = " << _new_l3_tb_in.to_string()  << std::endl;
		std::cout << "Section PPPOE_DIS finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		metadata = _new_metadata;
		header_metadata = _new_header_metadata;
		domain_metadata_out = _new_domain_metadata_out;
		qinq_tb_in = _new_qinq_tb_in;
		domain_tb_in = _new_domain_tb_in;
		l3_tb_in = _new_l3_tb_in;
	}

	void PPPOE_SES(int _stage, Packet& _packet, CONTROL_STRUCT& control, Metadata& metadata, Header_metadata& header_metadata, Parser_domain_metadata_out& domain_metadata_out, Qinq_tb_in& qinq_tb_in, Domain_tb_in& domain_tb_in, L3_tb_in& l3_tb_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section PPPOE_SES starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
			case 3 :
				break;
			default:
				std::cout << "section PPPOE_SES is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Metadata _new_metadata = metadata;
		Header_metadata _new_header_metadata = header_metadata;
		Parser_domain_metadata_out _new_domain_metadata_out = domain_metadata_out;
		Qinq_tb_in _new_qinq_tb_in = qinq_tb_in;
		Domain_tb_in _new_domain_tb_in = domain_tb_in;
		L3_tb_in _new_l3_tb_in = l3_tb_in;
		// declare section struct fields
		_LV<8> version;
		_LV<8> code;
		_LV<16> session_id;
		_LV<16> payload_length;
		_LV<16> ppp_protocol;
		std::cout << "	extracting 64 bits at offset " << control.offset << std::endl;
		// check for parsing past EOP
		if (control.offset.to_ulong() + 64 > _packet.size()*8) {
			std::cout << "ERROR: attempting to parse past the end of packet" << std::endl;
			control.error = 2;
			return;
		}
		// extract section struct
		(version,code,session_id,payload_length,ppp_protocol) = extract<64>(_packet, control.offset.to_ulong());
		std::cout << "		version = " << version.to_string() << std::endl;
		std::cout << "		code = " << code.to_string() << std::endl;
		std::cout << "		session_id = " << session_id.to_string() << std::endl;
		std::cout << "		payload_length = " << payload_length.to_string() << std::endl;
		std::cout << "		ppp_protocol = " << ppp_protocol.to_string() << std::endl;
		std::cout << std::endl;
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_domain_tb_in.ppp_protocol = ppp_protocol;
		std::cout << "		domain_tb_in.ppp_protocol = " << _new_domain_tb_in.ppp_protocol.to_string() << std::endl;
		std::cout << std::endl;
		// default increment by the size of the section struct
		std::cout << "\tincrementing offset by the size of the struct: 64 bits " << std::endl;
		_new_control.offset = control.offset + 64 ;
		_new_control.virtual_offset = control.virtual_offset + 64 ;
		std::cout << std::endl;
		// move_to_section
		(_new_control.section, _new_control.done) = _IF(( ppp_protocol == _LV<16>(33) ),/*then*/ _LV<16>(14), /*else*/_LV<16>(1));
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	domain_metadata_out = " << _new_domain_metadata_out.to_string()  << std::endl;
		std::cout << "	qinq_tb_in = " << _new_qinq_tb_in.to_string()  << std::endl;
		std::cout << "	domain_tb_in = " << _new_domain_tb_in.to_string()  << std::endl;
		std::cout << "	l3_tb_in = " << _new_l3_tb_in.to_string()  << std::endl;
		std::cout << "Section PPPOE_SES finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		metadata = _new_metadata;
		header_metadata = _new_header_metadata;
		domain_metadata_out = _new_domain_metadata_out;
		qinq_tb_in = _new_qinq_tb_in;
		domain_tb_in = _new_domain_tb_in;
		l3_tb_in = _new_l3_tb_in;
	}

	void ARP(int _stage, Packet& _packet, CONTROL_STRUCT& control, Metadata& metadata, Header_metadata& header_metadata, Parser_domain_metadata_out& domain_metadata_out, Qinq_tb_in& qinq_tb_in, Domain_tb_in& domain_tb_in, L3_tb_in& l3_tb_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section ARP starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
				break;
			default:
				std::cout << "section ARP is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Metadata _new_metadata = metadata;
		Header_metadata _new_header_metadata = header_metadata;
		Parser_domain_metadata_out _new_domain_metadata_out = domain_metadata_out;
		Qinq_tb_in _new_qinq_tb_in = qinq_tb_in;
		Domain_tb_in _new_domain_tb_in = domain_tb_in;
		L3_tb_in _new_l3_tb_in = l3_tb_in;
		// declare section struct fields
		_LV<16> hardwareype;
		_LV<16> protocolype;
		_LV<8> hardware_size;
		_LV<8> protocol_size;
		_LV<16> op_code;
		_LV<48> src_mac;
		_LV<32> src_ip;
		_LV<48> dst_mac;
		_LV<32> dst_ip;
		std::cout << "	extracting 224 bits at offset " << control.offset << std::endl;
		// check for parsing past EOP
		if (control.offset.to_ulong() + 224 > _packet.size()*8) {
			std::cout << "ERROR: attempting to parse past the end of packet" << std::endl;
			control.error = 2;
			return;
		}
		// extract section struct
		(hardwareype,protocolype,hardware_size,protocol_size,op_code,src_mac,src_ip,dst_mac,dst_ip) = extract<224>(_packet, control.offset.to_ulong());
		std::cout << "		hardwareype = " << hardwareype.to_string() << std::endl;
		std::cout << "		protocolype = " << protocolype.to_string() << std::endl;
		std::cout << "		hardware_size = " << hardware_size.to_string() << std::endl;
		std::cout << "		protocol_size = " << protocol_size.to_string() << std::endl;
		std::cout << "		op_code = " << op_code.to_string() << std::endl;
		std::cout << "		src_mac = " << src_mac.to_string() << std::endl;
		std::cout << "		src_ip = " << src_ip.to_string() << std::endl;
		std::cout << "		dst_mac = " << dst_mac.to_string() << std::endl;
		std::cout << "		dst_ip = " << dst_ip.to_string() << std::endl;
		std::cout << std::endl;
		// default increment by the size of the section struct
		std::cout << "\tincrementing offset by the size of the struct: 224 bits " << std::endl;
		_new_control.offset = control.offset + 224 ;
		_new_control.virtual_offset = control.virtual_offset + 224 ;
		std::cout << std::endl;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<4>(1);
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	domain_metadata_out = " << _new_domain_metadata_out.to_string()  << std::endl;
		std::cout << "	qinq_tb_in = " << _new_qinq_tb_in.to_string()  << std::endl;
		std::cout << "	domain_tb_in = " << _new_domain_tb_in.to_string()  << std::endl;
		std::cout << "	l3_tb_in = " << _new_l3_tb_in.to_string()  << std::endl;
		std::cout << "Section ARP finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		metadata = _new_metadata;
		header_metadata = _new_header_metadata;
		domain_metadata_out = _new_domain_metadata_out;
		qinq_tb_in = _new_qinq_tb_in;
		domain_tb_in = _new_domain_tb_in;
		l3_tb_in = _new_l3_tb_in;
	}

	void IPv4(int _stage, Packet& _packet, CONTROL_STRUCT& control, Metadata& metadata, Header_metadata& header_metadata, Parser_domain_metadata_out& domain_metadata_out, Qinq_tb_in& qinq_tb_in, Domain_tb_in& domain_tb_in, L3_tb_in& l3_tb_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section IPv4 starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 2 :
			case 3 :
			case 4 :
				break;
			default:
				std::cout << "section IPv4 is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Metadata _new_metadata = metadata;
		Header_metadata _new_header_metadata = header_metadata;
		Parser_domain_metadata_out _new_domain_metadata_out = domain_metadata_out;
		Qinq_tb_in _new_qinq_tb_in = qinq_tb_in;
		Domain_tb_in _new_domain_tb_in = domain_tb_in;
		L3_tb_in _new_l3_tb_in = l3_tb_in;
		// declare section struct fields
		_LV<4> version;
		_LV<4> hdr_len;
		_LV<6> dscp;
		_LV<2> cu;
		_LV<16> length;
		_LV<16> id;
		_LV<3> flags;
		_LV<13> offset;
		_LV<8> ttl;
		_LV<8> protocol;
		_LV<16> hdr_crc;
		_LV<32> src_addr;
		_LV<32> dst_addr;
		std::cout << "	extracting 160 bits at offset " << control.offset << std::endl;
		// check for parsing past EOP
		if (control.offset.to_ulong() + 160 > _packet.size()*8) {
			std::cout << "ERROR: attempting to parse past the end of packet" << std::endl;
			control.error = 2;
			return;
		}
		// extract section struct
		(version,hdr_len,dscp,cu,length,id,flags,offset,ttl,protocol,hdr_crc,src_addr,dst_addr) = extract<160>(_packet, control.offset.to_ulong());
		std::cout << "		version = " << version.to_string() << std::endl;
		std::cout << "		hdr_len = " << hdr_len.to_string() << std::endl;
		std::cout << "		dscp = " << dscp.to_string() << std::endl;
		std::cout << "		cu = " << cu.to_string() << std::endl;
		std::cout << "		length = " << length.to_string() << std::endl;
		std::cout << "		id = " << id.to_string() << std::endl;
		std::cout << "		flags = " << flags.to_string() << std::endl;
		std::cout << "		offset = " << offset.to_string() << std::endl;
		std::cout << "		ttl = " << ttl.to_string() << std::endl;
		std::cout << "		protocol = " << protocol.to_string() << std::endl;
		std::cout << "		hdr_crc = " << hdr_crc.to_string() << std::endl;
		std::cout << "		src_addr = " << src_addr.to_string() << std::endl;
		std::cout << "		dst_addr = " << dst_addr.to_string() << std::endl;
		std::cout << std::endl;
		// maps
		static _MAP<5,5> types(
			{
				{ _LV<5>(0x6), _LV<5>(0x10) },
				{ _LV<5>(0x11), _LV<5>(0x12) },
				{ _LV<5>(0x1), _LV<5>(0x14) }
			},
			_LV<5>(0x9)
		);
		// update tuples
		std::cout << "	method update (tuples)" << std::endl;
		_new_metadata.sa = src_addr;
		std::cout << "		metadata.sa = " << _new_metadata.sa.to_string() << std::endl;
		_new_metadata.da = dst_addr;
		std::cout << "		metadata.da = " << _new_metadata.da.to_string() << std::endl;
		_new_l3_tb_in.dst_ip = dst_addr;
		std::cout << "		l3_tb_in.dst_ip = " << _new_l3_tb_in.dst_ip.to_string() << std::endl;
		_new_metadata.proto = protocol;
		std::cout << "		metadata.proto = " << _new_metadata.proto.to_string() << std::endl;
		_new_metadata.ipv4_length = length;
		std::cout << "		metadata.ipv4_length = " << _new_metadata.ipv4_length.to_string() << std::endl;
		std::cout << std::endl;
		// increment_offset
		_new_control.offset = control.offset + ( _LV<17>(hdr_len) * _LV<17>(32) ) ;
		_new_control.virtual_offset = control.virtual_offset + ( _LV<17>(hdr_len) * _LV<17>(32) ) ;
		std::cout << std::endl;
		// move_to_section
		(_new_control.section, _new_control.done) = _IF(( _LV<5>(hdr_len) < _LV<5>(5) ),/*then*/ _LV<5>(9), /*else*/_LV<5>(types( _LV<5>(protocol) )));
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	domain_metadata_out = " << _new_domain_metadata_out.to_string()  << std::endl;
		std::cout << "	qinq_tb_in = " << _new_qinq_tb_in.to_string()  << std::endl;
		std::cout << "	domain_tb_in = " << _new_domain_tb_in.to_string()  << std::endl;
		std::cout << "	l3_tb_in = " << _new_l3_tb_in.to_string()  << std::endl;
		std::cout << "Section IPv4 finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		metadata = _new_metadata;
		header_metadata = _new_header_metadata;
		domain_metadata_out = _new_domain_metadata_out;
		qinq_tb_in = _new_qinq_tb_in;
		domain_tb_in = _new_domain_tb_in;
		l3_tb_in = _new_l3_tb_in;
	}

	void TCP(int _stage, Packet& _packet, CONTROL_STRUCT& control, Metadata& metadata, Header_metadata& header_metadata, Parser_domain_metadata_out& domain_metadata_out, Qinq_tb_in& qinq_tb_in, Domain_tb_in& domain_tb_in, L3_tb_in& l3_tb_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section TCP starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 3 :
			case 4 :
			case 5 :
				break;
			default:
				std::cout << "section TCP is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Metadata _new_metadata = metadata;
		Header_metadata _new_header_metadata = header_metadata;
		Parser_domain_metadata_out _new_domain_metadata_out = domain_metadata_out;
		Qinq_tb_in _new_qinq_tb_in = qinq_tb_in;
		Domain_tb_in _new_domain_tb_in = domain_tb_in;
		L3_tb_in _new_l3_tb_in = l3_tb_in;
		// declare section struct fields
		_LV<16> src_port;
		_LV<16> dst_port;
		_LV<32> seq_num;
		_LV<32> ack_num;
		_LV<4> offset;
		_LV<3> reserved;
		_LV<9> flags;
		_LV<16> window;
		_LV<16> checksum;
		_LV<16> urgent;
		std::cout << "	extracting 160 bits at offset " << control.offset << std::endl;
		// check for parsing past EOP
		if (control.offset.to_ulong() + 160 > _packet.size()*8) {
			std::cout << "ERROR: attempting to parse past the end of packet" << std::endl;
			control.error = 2;
			return;
		}
		// extract section struct
		(src_port,dst_port,seq_num,ack_num,offset,reserved,flags,window,checksum,urgent) = extract<160>(_packet, control.offset.to_ulong());
		std::cout << "		src_port = " << src_port.to_string() << std::endl;
		std::cout << "		dst_port = " << dst_port.to_string() << std::endl;
		std::cout << "		seq_num = " << seq_num.to_string() << std::endl;
		std::cout << "		ack_num = " << ack_num.to_string() << std::endl;
		std::cout << "		offset = " << offset.to_string() << std::endl;
		std::cout << "		reserved = " << reserved.to_string() << std::endl;
		std::cout << "		flags = " << flags.to_string() << std::endl;
		std::cout << "		window = " << window.to_string() << std::endl;
		std::cout << "		checksum = " << checksum.to_string() << std::endl;
		std::cout << "		urgent = " << urgent.to_string() << std::endl;
		std::cout << std::endl;
		// increment_offset
		_new_control.offset = control.offset + ( _LV<17>(offset) * _LV<17>(32) ) ;
		_new_control.virtual_offset = control.virtual_offset + ( _LV<17>(offset) * _LV<17>(32) ) ;
		std::cout << std::endl;
		// move_to_section
		(_new_control.section, _new_control.done) = _IF(( offset < _LV<4>(5) ),/*then*/ _LV<4>(11), /*else*/_LV<4>(1));
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	domain_metadata_out = " << _new_domain_metadata_out.to_string()  << std::endl;
		std::cout << "	qinq_tb_in = " << _new_qinq_tb_in.to_string()  << std::endl;
		std::cout << "	domain_tb_in = " << _new_domain_tb_in.to_string()  << std::endl;
		std::cout << "	l3_tb_in = " << _new_l3_tb_in.to_string()  << std::endl;
		std::cout << "Section TCP finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		metadata = _new_metadata;
		header_metadata = _new_header_metadata;
		domain_metadata_out = _new_domain_metadata_out;
		qinq_tb_in = _new_qinq_tb_in;
		domain_tb_in = _new_domain_tb_in;
		l3_tb_in = _new_l3_tb_in;
	}

	void UDP(int _stage, Packet& _packet, CONTROL_STRUCT& control, Metadata& metadata, Header_metadata& header_metadata, Parser_domain_metadata_out& domain_metadata_out, Qinq_tb_in& qinq_tb_in, Domain_tb_in& domain_tb_in, L3_tb_in& l3_tb_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section UDP starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 3 :
			case 4 :
			case 5 :
				break;
			default:
				std::cout << "section UDP is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Metadata _new_metadata = metadata;
		Header_metadata _new_header_metadata = header_metadata;
		Parser_domain_metadata_out _new_domain_metadata_out = domain_metadata_out;
		Qinq_tb_in _new_qinq_tb_in = qinq_tb_in;
		Domain_tb_in _new_domain_tb_in = domain_tb_in;
		L3_tb_in _new_l3_tb_in = l3_tb_in;
		// declare section struct fields
		_LV<16> src_port;
		_LV<16> dst_port;
		_LV<16> length;
		_LV<16> checksum;
		std::cout << "	extracting 64 bits at offset " << control.offset << std::endl;
		// check for parsing past EOP
		if (control.offset.to_ulong() + 64 > _packet.size()*8) {
			std::cout << "ERROR: attempting to parse past the end of packet" << std::endl;
			control.error = 2;
			return;
		}
		// extract section struct
		(src_port,dst_port,length,checksum) = extract<64>(_packet, control.offset.to_ulong());
		std::cout << "		src_port = " << src_port.to_string() << std::endl;
		std::cout << "		dst_port = " << dst_port.to_string() << std::endl;
		std::cout << "		length = " << length.to_string() << std::endl;
		std::cout << "		checksum = " << checksum.to_string() << std::endl;
		std::cout << std::endl;
		// default increment by the size of the section struct
		std::cout << "\tincrementing offset by the size of the struct: 64 bits " << std::endl;
		_new_control.offset = control.offset + 64 ;
		_new_control.virtual_offset = control.virtual_offset + 64 ;
		std::cout << std::endl;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<4>(1);
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	domain_metadata_out = " << _new_domain_metadata_out.to_string()  << std::endl;
		std::cout << "	qinq_tb_in = " << _new_qinq_tb_in.to_string()  << std::endl;
		std::cout << "	domain_tb_in = " << _new_domain_tb_in.to_string()  << std::endl;
		std::cout << "	l3_tb_in = " << _new_l3_tb_in.to_string()  << std::endl;
		std::cout << "Section UDP finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		metadata = _new_metadata;
		header_metadata = _new_header_metadata;
		domain_metadata_out = _new_domain_metadata_out;
		qinq_tb_in = _new_qinq_tb_in;
		domain_tb_in = _new_domain_tb_in;
		l3_tb_in = _new_l3_tb_in;
	}

	void ICMP(int _stage, Packet& _packet, CONTROL_STRUCT& control, Metadata& metadata, Header_metadata& header_metadata, Parser_domain_metadata_out& domain_metadata_out, Qinq_tb_in& qinq_tb_in, Domain_tb_in& domain_tb_in, L3_tb_in& l3_tb_in) { 
		std::cout << "-------------------------------------------------------------------" << std::endl;
		std::cout << "Section ICMP starting" << std::endl;
		// check whether this section is implemented in the current stage
		switch (_stage) {
			case 3 :
			case 4 :
			case 5 :
				break;
			default:
				std::cout << "section ICMP is not implemented in stage " << _stage << ", skipping this stage" <<std::endl;
				std::cout << "-------------------------------------------------------------------" << std::endl;
				return;
		}
		std::cout << std::endl;
		// declare updated tuples with copied values
		CONTROL_STRUCT _new_control = control;
		Metadata _new_metadata = metadata;
		Header_metadata _new_header_metadata = header_metadata;
		Parser_domain_metadata_out _new_domain_metadata_out = domain_metadata_out;
		Qinq_tb_in _new_qinq_tb_in = qinq_tb_in;
		Domain_tb_in _new_domain_tb_in = domain_tb_in;
		L3_tb_in _new_l3_tb_in = l3_tb_in;
		std::cout << std::endl;
		// move_to_section
		(_new_control.section, _new_control.done) = _LV<4>(1);
		std::cout << "	method move_to_section = ";
		if ( _new_control.done.any() )
			std::cout << "done(" << _new_control.section.to_ulong() << ")" << std::endl;
		else
			std::cout << _section_names[_new_control.section.to_ulong()] << std::endl;
		std::cout << std::endl;
		// print updated tuple values
		std::cout << "updated tuples:" << std::endl;
		std::cout << "	control = " << _new_control.to_string()  << std::endl;
		std::cout << "	metadata = " << _new_metadata.to_string()  << std::endl;
		std::cout << "	header_metadata = " << _new_header_metadata.to_string()  << std::endl;
		std::cout << "	domain_metadata_out = " << _new_domain_metadata_out.to_string()  << std::endl;
		std::cout << "	qinq_tb_in = " << _new_qinq_tb_in.to_string()  << std::endl;
		std::cout << "	domain_tb_in = " << _new_domain_tb_in.to_string()  << std::endl;
		std::cout << "	l3_tb_in = " << _new_l3_tb_in.to_string()  << std::endl;
		std::cout << "Section ICMP finished" << std::endl;
		std::cout << "-------------------------------------------------------------------" << std::endl;
		// output updated tuples
		control = _new_control;
		metadata = _new_metadata;
		header_metadata = _new_header_metadata;
		domain_metadata_out = _new_domain_metadata_out;
		qinq_tb_in = _new_qinq_tb_in;
		domain_tb_in = _new_domain_tb_in;
		l3_tb_in = _new_l3_tb_in;
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
		// clear internal and output-only tuples:
		std::cout << "clear internal and output-only tuples" << std::endl;
		metadata = 0;
		std::cout << "	metadata = " << metadata.to_string() << std::endl;
		header_metadata = 0;
		std::cout << "	header_metadata = " << header_metadata.to_string() << std::endl;
		domain_metadata_out = 0;
		std::cout << "	domain_metadata_out = " << domain_metadata_out.to_string() << std::endl;
		qinq_tb_in = 0;
		std::cout << "	qinq_tb_in = " << qinq_tb_in.to_string() << std::endl;
		domain_tb_in = 0;
		std::cout << "	domain_tb_in = " << domain_tb_in.to_string() << std::endl;
		l3_tb_in = 0;
		std::cout << "	l3_tb_in = " << l3_tb_in.to_string() << std::endl;
		// section loop
		for (int _stage = 1; _stage <= 5 && control.done.none() && control.error.none(); _stage++) {
			std::cout << "processing section " << _section_names[control.section.to_ulong()] << " in stage " << _stage << std::endl;
			(this->*_sections[control.section.to_ulong()])(_stage, packet_out, control, metadata, header_metadata, domain_metadata_out, qinq_tb_in, domain_tb_in, l3_tb_in); 
		}
		// inout and output tuples:
		std::cout << "final inout and output tuples:" << std::endl;
		std::cout << "	control = " << control.to_string() << std::endl;
		std::cout << "	metadata = " << metadata.to_string() << std::endl;
		std::cout << "	header_metadata = " << header_metadata.to_string() << std::endl;
		std::cout << "	domain_metadata_out = " << domain_metadata_out.to_string() << std::endl;
		std::cout << "	qinq_tb_in = " << qinq_tb_in.to_string() << std::endl;
		std::cout << "	domain_tb_in = " << domain_tb_in.to_string() << std::endl;
		std::cout << "	l3_tb_in = " << l3_tb_in.to_string() << std::endl;
		std::cout << "Exiting engine " << _name << std::endl;
		std::cout << "===================================================================" << std::endl;
	}
};

//######################################################
// top-level DPI function
extern "C" void Parser_DPI(const char*, int, const char*, int, int, int);


} // namespace SDNET

#endif // SDNET_ENGINE_Parser
