create_project PPPOE PPPOE_vivado/PPPOE -part xcvu095-ffva2104-2-e
add_files -scan_for_includes ./
import_files -force
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1
set_property top PPPOE [current_fileset]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
ipx::package_project -root_dir PPPOE_vivado/PPPOE/PPPOE.srcs/sources_1/imports/PPPOE -vendor xilinx.com -library user -taxonomy /UserIP
set_property library sdnet [ipx::current_core]
set_property name PPPOE [ipx::current_core]
set_property display_name PPPOE_v1_0 [ipx::current_core]
set_property description PPPOE_v1_0 [ipx::current_core]
set_property supported_families {{virtex7} {Production} {qvirtex7} {Production} {kinex7} {Production} {kintex7l} {Production} {qkintex7} {Production} {qkintex7l} {Production} {artix7} {Production} {artix7l} {Production} {aartix7} {Production} {qartix7} {Production} {zynq} {Production} {qzynq} {Production} {azynq} {Production} {virtexu} {Production} {kintexu} {Production}} [ipx::current_core]
set_property taxonomy {/Communication_&_Networking /UserIP} [ipx::current_core]


ipx::infer_bus_interface {packet_in_instream_TVALID packet_in_instream_TREADY packet_in_instream_TDATA packet_in_instream_TKEEP packet_in_instream_TLAST } xilinx.com:interface:axis_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface {packet_out_outstream_TVALID packet_out_outstream_TREADY packet_out_outstream_TDATA packet_out_outstream_TKEEP packet_out_outstream_TLAST } xilinx.com:interface:axis_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface {control_qinq_tb_S_AXI_AWADDR control_qinq_tb_S_AXI_AWVALID control_qinq_tb_S_AXI_AWREADY control_qinq_tb_S_AXI_WDATA control_qinq_tb_S_AXI_WSTRB control_qinq_tb_S_AXI_WVALID control_qinq_tb_S_AXI_WREADY control_qinq_tb_S_AXI_BRESP control_qinq_tb_S_AXI_BVALID control_qinq_tb_S_AXI_BREADY control_qinq_tb_S_AXI_ARADDR control_qinq_tb_S_AXI_ARVALID control_qinq_tb_S_AXI_ARREADY control_qinq_tb_S_AXI_RDATA control_qinq_tb_S_AXI_RRESP control_qinq_tb_S_AXI_RVALID control_qinq_tb_S_AXI_RREADY } xilinx.com:interface:aximm_rtl:1.0 [ipx::current_core]

ipx::add_memory_map control_qinq_tb_S_AXI [ipx::current_core]
set_property slave_memory_map_ref control_qinq_tb_S_AXI [ipx::get_bus_interfaces control_qinq_tb_S_AXI -of_objects [ipx::current_core]]
ipx::infer_bus_interface {control_domain_tb_S_AXI_AWADDR control_domain_tb_S_AXI_AWVALID control_domain_tb_S_AXI_AWREADY control_domain_tb_S_AXI_WDATA control_domain_tb_S_AXI_WSTRB control_domain_tb_S_AXI_WVALID control_domain_tb_S_AXI_WREADY control_domain_tb_S_AXI_BRESP control_domain_tb_S_AXI_BVALID control_domain_tb_S_AXI_BREADY control_domain_tb_S_AXI_ARADDR control_domain_tb_S_AXI_ARVALID control_domain_tb_S_AXI_ARREADY control_domain_tb_S_AXI_RDATA control_domain_tb_S_AXI_RRESP control_domain_tb_S_AXI_RVALID control_domain_tb_S_AXI_RREADY } xilinx.com:interface:aximm_rtl:1.0 [ipx::current_core]

ipx::add_memory_map control_domain_tb_S_AXI [ipx::current_core]
set_property slave_memory_map_ref control_domain_tb_S_AXI [ipx::get_bus_interfaces control_domain_tb_S_AXI -of_objects [ipx::current_core]]
ipx::infer_bus_interface {control_l3_tb_S_AXI_AWADDR control_l3_tb_S_AXI_AWVALID control_l3_tb_S_AXI_AWREADY control_l3_tb_S_AXI_WDATA control_l3_tb_S_AXI_WSTRB control_l3_tb_S_AXI_WVALID control_l3_tb_S_AXI_WREADY control_l3_tb_S_AXI_BRESP control_l3_tb_S_AXI_BVALID control_l3_tb_S_AXI_BREADY control_l3_tb_S_AXI_ARADDR control_l3_tb_S_AXI_ARVALID control_l3_tb_S_AXI_ARREADY control_l3_tb_S_AXI_RDATA control_l3_tb_S_AXI_RRESP control_l3_tb_S_AXI_RVALID control_l3_tb_S_AXI_RREADY } xilinx.com:interface:aximm_rtl:1.0 [ipx::current_core]

ipx::add_memory_map control_l3_tb_S_AXI [ipx::current_core]
set_property slave_memory_map_ref control_l3_tb_S_AXI [ipx::get_bus_interfaces control_l3_tb_S_AXI -of_objects [ipx::current_core]]
ipx::infer_bus_interface {control_pppL2_tb_S_AXI_AWADDR control_pppL2_tb_S_AXI_AWVALID control_pppL2_tb_S_AXI_AWREADY control_pppL2_tb_S_AXI_WDATA control_pppL2_tb_S_AXI_WSTRB control_pppL2_tb_S_AXI_WVALID control_pppL2_tb_S_AXI_WREADY control_pppL2_tb_S_AXI_BRESP control_pppL2_tb_S_AXI_BVALID control_pppL2_tb_S_AXI_BREADY control_pppL2_tb_S_AXI_ARADDR control_pppL2_tb_S_AXI_ARVALID control_pppL2_tb_S_AXI_ARREADY control_pppL2_tb_S_AXI_RDATA control_pppL2_tb_S_AXI_RRESP control_pppL2_tb_S_AXI_RVALID control_pppL2_tb_S_AXI_RREADY } xilinx.com:interface:aximm_rtl:1.0 [ipx::current_core]

ipx::add_memory_map control_pppL2_tb_S_AXI [ipx::current_core]
set_property slave_memory_map_ref control_pppL2_tb_S_AXI [ipx::get_bus_interfaces control_pppL2_tb_S_AXI -of_objects [ipx::current_core]]
ipx::infer_bus_interface {control_extL2_tb_S_AXI_AWADDR control_extL2_tb_S_AXI_AWVALID control_extL2_tb_S_AXI_AWREADY control_extL2_tb_S_AXI_WDATA control_extL2_tb_S_AXI_WSTRB control_extL2_tb_S_AXI_WVALID control_extL2_tb_S_AXI_WREADY control_extL2_tb_S_AXI_BRESP control_extL2_tb_S_AXI_BVALID control_extL2_tb_S_AXI_BREADY control_extL2_tb_S_AXI_ARADDR control_extL2_tb_S_AXI_ARVALID control_extL2_tb_S_AXI_ARREADY control_extL2_tb_S_AXI_RDATA control_extL2_tb_S_AXI_RRESP control_extL2_tb_S_AXI_RVALID control_extL2_tb_S_AXI_RREADY } xilinx.com:interface:aximm_rtl:1.0 [ipx::current_core]

ipx::add_memory_map control_extL2_tb_S_AXI [ipx::current_core]
set_property slave_memory_map_ref control_extL2_tb_S_AXI [ipx::get_bus_interfaces control_extL2_tb_S_AXI -of_objects [ipx::current_core]]

# user defined ,set clock mapping
ipx::infer_bus_interface clk_line xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface clk_packet xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface clk_control xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]

ipx::associate_bus_interfaces -busif packet_in_instream -clock clk_line [ipx::current_core]
ipx::associate_bus_interfaces -busif packet_out_outstream -clock clk_line [ipx::current_core]
ipx::associate_bus_interfaces -busif control_domain_tb_S_AXI -clock clk_control [ipx::current_core]
ipx::associate_bus_interfaces -busif control_extL2_tb_S_AXI -clock clk_control [ipx::current_core]
ipx::associate_bus_interfaces -busif control_l3_tb_S_AXI -clock clk_control [ipx::current_core]
ipx::associate_bus_interfaces -busif control_pppL2_tb_S_AXI -clock clk_control [ipx::current_core]
ipx::associate_bus_interfaces -busif control_qinq_tb_S_AXI -clock clk_control [ipx::current_core]


set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]

ipx::archive_core PPPOE.zip [ipx::current_core]
set_property  ip_repo_paths  PPPOE_vivado/PPPOE/PPPOE.srcs/sources_1/imports/PPPOE [current_project]
update_ip_catalog

set_property core_revision 3 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog -rebuild -repo_path PPPOE_vivado/PPPOE/PPPOE.srcs/sources_1/imports/PPPOE
close_project

