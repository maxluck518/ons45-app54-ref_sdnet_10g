set ip_proj_root [pwd]
set ip_proj_name "packet_pipeline_output"
set ip_proj_part "xc7z045ffg676-2"

create_project $ip_proj_name $ip_proj_root -part $ip_proj_part -force

add_files ./src/axis_converter_rx.v
add_files ./src/axis_converter_tx.v
add_files ./src/axis_convert_tx
add_files ./src/axis_convert_tx/fallthrough_small_fifo_v2.v
add_files ./src/axis_convert_tx/small_fifo_v3.v
add_files ./src/onet_output_core.v
add_files ./src/output_schedule.v
add_files ./src/packet_pipeline_output.v
add_files ./sim/tb_pipeline.v

set_property top packet_pipeline_output [current_fileset]
set_property top tb_pipeline [get_filesets sim_1]

cd $ip_proj_root

update_compile_order -fileset sources_1
ipx::package_project -root_dir $ip_proj_root -vendor xilinx.com -library user -taxonomy /UserIP
ipx::associate_bus_interfaces -busif s_axi_lite -clock s_axi_lite_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif m_axis_s2mm_0 -clock s_axis_rxd_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif m_axis_s2mm_1 -clock s_axis_rxd_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif m_axis_s2mm_2 -clock s_axis_rxd_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif m_axis_s2mm_3 -clock s_axis_rxd_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif m_axis_txd_0 -clock s_axis_rxd_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif m_axis_txd_1 -clock s_axis_rxd_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif m_axis_txd_2 -clock s_axis_rxd_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif m_axis_txd_3 -clock s_axis_rxd_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif s_axis_rxd_0 -clock s_axis_rxd_aclk [ipx::current_core]
set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::archive_core $ip_proj_name.zip [ipx::current_core]
set_property  ip_repo_paths  $ip_proj_root [current_project]
update_ip_catalog

close_project
