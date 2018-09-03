set ip_proj_root [pwd]
set ip_proj_name "dma_eth"
set ip_proj_part "xc7z045ffg676-2"

create_project $ip_proj_name $ip_proj_root -part $ip_proj_part -force

add_files ./src/axis_converter_rx.v
add_files ./src/axis_converter_tx.v
add_files ./src/fallthrough_small_fifo_v2.v
add_files ./src/input_arbiter.v
add_files ./src/onet_core_logic.v
add_files ./src/dma_eth.v
add_files ./src/small_fifo_v3.v
add_files ./src/user_data_path_mon.v
add_files ./sim/tb_pipeline.v

set_property top dma_eth [current_fileset]
set_property top tb_pipeline [get_filesets sim_1]

cd $ip_proj_root

ipx::package_project -root_dir $ip_proj_root -vendor xilinx.com -library user -taxonomy /UserIP

ipx::associate_bus_interfaces -busif m_axis_txd_0 -clock s_axis_rxd_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif s_axis_rxd_0 -clock s_axis_rxd_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif s_axis_rxd_1 -clock s_axis_rxd_aclk [ipx::current_core]

set_property core_revision 1 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::archive_core $ip_proj_name.zip [ipx::current_core]
set_property  ip_repo_paths  $ip_proj_root [current_project]
update_ip_catalog

close_project
