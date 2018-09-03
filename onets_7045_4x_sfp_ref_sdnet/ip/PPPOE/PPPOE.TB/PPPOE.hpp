#ifndef SDNET_ENGINE_PPPOE
#define SDNET_ENGINE_PPPOE

#include "../Parser.TB/Parser.hpp"

#include "../Qinq_table.TB/Qinq_table.hpp"

#include "../Qinq_action.TB/Qinq_action.hpp"

#include "../Domain_table.TB/Domain_table.hpp"

#include "../Domain_action.TB/Domain_action.hpp"

#include "../L3_table.TB/L3_table.hpp"

#include "../L3_action.TB/L3_action.hpp"

#include "../Get_MAC.TB/Get_MAC.hpp"

#include "../pppL2_table.TB/pppL2_table.hpp"

#include "../extL2_table.TB/extL2_table.hpp"

#include "../L2_action.TB/L2_action.hpp"

#include "sdnet_lib.hpp"

namespace SDNET {

//######################################################
class PPPOE { // System
public:

	// tuple types
	struct Tuple_output {
		static const size_t _SIZE = 128;
		_LV<96> pad;
		_LV<8> dst_port;
		_LV<8> src_port;
		_LV<16> pkt_len;
		Tuple_output& operator=(_LV<128> _x) {
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

	// system members
	std::string _name;
	Packet instream;
	Packet outstream;
	Tuple_output flowstream;


	// system engines
	Parser parser;
	Qinq_table qinq_tb;
	Qinq_action qinq_ac;
	Domain_table domain_tb;
	Domain_action domain_ac;
	L3_table l3_tb;
	L3_action l3_ac;
	Get_MAC get_mac;
	pppL2_table pppL2_tb;
	extL2_table extL2_tb;
	L2_action l2_ac;

	// system ctor
	PPPOE(std::string n) : _name(n),
		parser("parser"),
		qinq_tb("qinq_tb"),
		qinq_ac("qinq_ac"),
		domain_tb("domain_tb"),
		domain_ac("domain_ac"),
		l3_tb("l3_tb"),
		l3_ac("l3_ac"),
		get_mac("get_mac"),
		pppL2_tb("pppL2_tb"),
		extL2_tb("extL2_tb"),
		l2_ac("l2_ac") { }

	// system function
	void operator()() {
		std::cout << "===================================================================" << std::endl;
		std::cout << "Entering system " << _name << std::endl;
		// input packet
		std::cout << "input packet (" << instream.size() << " bytes)" << std::endl;
		std::cout << instream;
		// input and inout tuples:
		std::cout << "initial input and inout tuples:" << std::endl;
		// clear internal and output-only tuples:
		std::cout << "clear internal and output-only tuples" << std::endl;
		flowstream = 0;
		std::cout << "	flowstream = " << flowstream.to_string() << std::endl;

		// evaluate engines in topologically-sorted order

		parser.packet_in = instream;
		parser.control = 0;
		parser();

		qinq_tb.request = parser.qinq_tb_in;
		qinq_tb();

		domain_tb.request = parser.domain_tb_in;
		domain_tb();

		l3_tb.request = parser.l3_tb_in;
		l3_tb();

		qinq_ac.action_in = qinq_tb.response;
		qinq_ac.packet_in = parser.packet_out;
		qinq_ac.control = 0;
		qinq_ac.control.error = parser.control.error.any() || parser.control.done.none() || parser.control.section.any();
		qinq_ac();

		domain_ac.packet_in = qinq_ac.packet_out;
		domain_ac.control = 0;
		domain_ac.control.error = qinq_ac.control.error.any() || qinq_ac.control.done.none() || qinq_ac.control.section.any();
		domain_ac.action_in = domain_tb.response;
		domain_ac.metadata_in = parser.domain_metadata_out;
		domain_ac.metadata = parser.metadata;
		domain_ac();

		l3_ac.packet_in = domain_ac.packet_out;
		l3_ac.control = 0;
		l3_ac.control.error = domain_ac.control.error.any() || domain_ac.control.done.none() || domain_ac.control.section.any();
		l3_ac.metadata_in = domain_ac.metadata_out;
		l3_ac.action_in = l3_tb.response;
		l3_ac();

		get_mac.l3_mac = l3_ac.mac_out;
		get_mac.origin_mac = parser.metadata;
		get_mac();

		pppL2_tb.request = get_mac.mac_out;
		pppL2_tb();

		extL2_tb.request = get_mac.mac_out;
		extL2_tb();

		l2_ac.pppL2_in = pppL2_tb.response;
		l2_ac.extL2_in = extL2_tb.response;
		l2_ac.metadata_in = l3_ac.metadata_out;
		l2_ac.header_metadata = parser.header_metadata;
		l2_ac.packet_in = l3_ac.packet_out;
		l2_ac.control = 0;
		l2_ac.control.error = l3_ac.control.error.any() || l3_ac.control.done.none() || l3_ac.control.section.any();
		l2_ac();

		// assign system outputs
		flowstream = l2_ac.output_tuple;
		outstream = l2_ac.packet_out;

		// inout and output tuples:
		std::cout << "final inout and output tuples:" << std::endl;
		std::cout << "	flowstream = " << flowstream.to_string() << std::endl;
		// output packet
		std::cout << "output packet (" << outstream.size() << " bytes)" << std::endl;
		std::cout << outstream;
		std::cout << "Exiting system " << _name << std::endl;
		std::cout << "===================================================================" << std::endl;
	}
};
//######################################################
// top-level DPI function
extern "C" void PPPOE_DPI(const char*, int, const char*, int, int, int);


} // namespace SDNET

#endif // SDNET_ENGINE_PPPOE
