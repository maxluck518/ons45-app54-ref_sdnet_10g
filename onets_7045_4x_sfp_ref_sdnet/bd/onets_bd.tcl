create_bd_design "onets_bd"

# Create interface ports
set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
set ext_reset_in [ create_bd_port -dir I ext_reset_in ]
set rxp_0 [ create_bd_port -dir I rxp_0 ]
set rxp_1 [ create_bd_port -dir I rxp_1 ]
set rxp_2 [ create_bd_port -dir I rxp_2 ]
set rxp_3 [ create_bd_port -dir I rxp_3 ]
set txp_0 [ create_bd_port -dir O txp_0 ]
set txp_1 [ create_bd_port -dir O txp_1 ]
set txp_2 [ create_bd_port -dir O txp_2 ]
set txp_3 [ create_bd_port -dir O txp_3 ]
set rxn_0 [ create_bd_port -dir I rxn_0 ]
set rxn_1 [ create_bd_port -dir I rxn_1 ]
set rxn_2 [ create_bd_port -dir I rxn_2 ]
set rxn_3 [ create_bd_port -dir I rxn_3 ]
set txn_0 [ create_bd_port -dir O txn_0 ]
set txn_1 [ create_bd_port -dir O txn_1 ]
set txn_2 [ create_bd_port -dir O txn_2 ]
set txn_3 [ create_bd_port -dir O txn_3 ]
set refclk_p [ create_bd_port -dir I refclk_p ]
set refclk_n [ create_bd_port -dir I refclk_n ]

set core_status_0 [ create_bd_port -dir O -from 7 -to 0 core_status_0 ]
set core_status_1 [ create_bd_port -dir O -from 7 -to 0 core_status_1 ]
set core_status_2 [ create_bd_port -dir O -from 7 -to 0 core_status_2 ]
set core_status_3 [ create_bd_port -dir O -from 7 -to 0 core_status_3 ]

# Create ports
set bd_fclk0_125m [ create_bd_port -dir O -type clk bd_fclk0_125m ]
set bd_fclk1_75m [ create_bd_port -dir O -type clk bd_fclk1_75m ]
set bd_fclk2_200m [ create_bd_port -dir O -type clk bd_fclk2_200m ]

# zynq
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
set_property -dict [list CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {125} CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {76.923080} CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {200} CONFIG.PCW_EN_CLK1_PORT {1} CONFIG.PCW_EN_CLK2_PORT {1}] [get_bd_cells processing_system7_0]
set_property -dict [list CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1}] [get_bd_cells processing_system7_0]
set_property -dict [list CONFIG.PCW_USE_S_AXI_HP0 {1}] [get_bd_cells processing_system7_0]

# 10g ethernet subsystem
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_10g_ethernet:3.1 axi_10g_ethernet_0
set_property -dict [list CONFIG.SupportLevel {1}] [get_bd_cells axi_10g_ethernet_0]
make_bd_intf_pins_external  [get_bd_intf_pins axi_10g_ethernet_0/rx_statistics]
make_bd_intf_pins_external  [get_bd_intf_pins axi_10g_ethernet_0/tx_statistics]
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_10g_ethernet:3.1 axi_10g_ethernet_1
make_bd_intf_pins_external  [get_bd_intf_pins axi_10g_ethernet_1/rx_statistics]
make_bd_intf_pins_external  [get_bd_intf_pins axi_10g_ethernet_1/tx_statistics]
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_10g_ethernet:3.1 axi_10g_ethernet_2
make_bd_intf_pins_external  [get_bd_intf_pins axi_10g_ethernet_2/rx_statistics]
make_bd_intf_pins_external  [get_bd_intf_pins axi_10g_ethernet_2/tx_statistics]
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_10g_ethernet:3.1 axi_10g_ethernet_3
make_bd_intf_pins_external  [get_bd_intf_pins axi_10g_ethernet_3/rx_statistics]
make_bd_intf_pins_external  [get_bd_intf_pins axi_10g_ethernet_3/tx_statistics]

# rst_ps7_0_156M
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_156M

# rst_ps7_0_75M
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_75M

# axi_ic_hp
set axi_ic_hp [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_hp ]
set_property -dict [ list CONFIG.NUM_MI {1} CONFIG.NUM_SI {12}  ] $axi_ic_hp
# axi_ic_gp
set axi_ic_gp [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_gp ]
set_property -dict [ list CONFIG.NUM_MI {14} CONFIG.NUM_SI {1}  ] $axi_ic_gp

# Create instance: axi_dma_0, and set properties
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0
set_property -dict [list CONFIG.c_m_axi_mm2s_data_width {64} CONFIG.c_m_axis_mm2s_tdata_width {64} CONFIG.c_mm2s_burst_size {8} CONFIG.c_sg_include_stscntrl_strm {0}] [get_bd_cells axi_dma_0]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_1
set_property -dict [list CONFIG.c_m_axi_mm2s_data_width {64} CONFIG.c_m_axis_mm2s_tdata_width {64} CONFIG.c_mm2s_burst_size {8} CONFIG.c_sg_include_stscntrl_strm {0}] [get_bd_cells axi_dma_1]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_2
set_property -dict [list CONFIG.c_m_axi_mm2s_data_width {64} CONFIG.c_m_axis_mm2s_tdata_width {64} CONFIG.c_mm2s_burst_size {8} CONFIG.c_sg_include_stscntrl_strm {0}] [get_bd_cells axi_dma_2]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_3
set_property -dict [list CONFIG.c_m_axi_mm2s_data_width {64} CONFIG.c_m_axis_mm2s_tdata_width {64} CONFIG.c_mm2s_burst_size {8} CONFIG.c_sg_include_stscntrl_strm {0}] [get_bd_cells axi_dma_3]

# Create instance: xlconcat, and set properties
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
set_property -dict [list CONFIG.NUM_PORTS {12}] [get_bd_cells xlconcat_0]

# Create instance: gnd, and set properties
set gnd [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 gnd]
set_property -dict [list CONFIG.CONST_VAL {0}] [get_bd_cells gnd]

# Create instance: vcc, and set properties
set vcc [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 vcc]
set_property -dict [list CONFIG.CONST_VAL {1}] [get_bd_cells vcc]

set pause_val [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 pause_val ]
set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {0}] [get_bd_cells pause_val]

set tx_ifg_delay [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 tx_ifg_delay ]
set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells tx_ifg_delay]

# Create instance: packet_pipeline, and set properties
set packet_pipeline_input  [ create_bd_cell -type ip -vlnv xilinx.com:user:packet_pipeline_input:1.0 packet_pipeline_input ]
set packet_pipeline_output [ create_bd_cell -type ip -vlnv xilinx.com:user:packet_pipeline_output:1.0 packet_pipeline_output ]
set dma_eth_0              [ create_bd_cell -type ip -vlnv xilinx.com:user:dma_eth:1.0 dma_eth_0 ]
set dma_eth_1              [ create_bd_cell -type ip -vlnv xilinx.com:user:dma_eth:1.0 dma_eth_1 ]
set dma_eth_2              [ create_bd_cell -type ip -vlnv xilinx.com:user:dma_eth:1.0 dma_eth_2 ]
set dma_eth_3              [ create_bd_cell -type ip -vlnv xilinx.com:user:dma_eth:1.0 dma_eth_3 ]
set PPPOE                  [ create_bd_cell -type ip -vlnv xilinx.com:sdnet:PPPOE:1.0 PPPOE ]

# 10g ethernet connection
connect_bd_net [ get_bd_ports refclk_p]                        [ get_bd_pins axi_10g_ethernet_0/refclk_p]
connect_bd_net [ get_bd_ports refclk_n]                        [ get_bd_pins axi_10g_ethernet_0/refclk_n]
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/s_axi_aresetn] [ get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/s_axi_aclk]    [ get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [ get_bd_pins axi_10g_ethernet_1/s_axi_aresetn] [ get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [ get_bd_pins axi_10g_ethernet_1/s_axi_aclk]    [ get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [ get_bd_pins axi_10g_ethernet_2/s_axi_aresetn] [ get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [ get_bd_pins axi_10g_ethernet_2/s_axi_aclk]    [ get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [ get_bd_pins axi_10g_ethernet_3/s_axi_aresetn] [ get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [ get_bd_pins axi_10g_ethernet_3/s_axi_aclk]    [ get_bd_pins processing_system7_0/FCLK_CLK1]

connect_bd_net [get_bd_ports rxp_0] [get_bd_pins axi_10g_ethernet_0/rxp]
connect_bd_net [get_bd_ports rxn_0] [get_bd_pins axi_10g_ethernet_0/rxn]
connect_bd_net [get_bd_ports rxp_1] [get_bd_pins axi_10g_ethernet_1/rxp]
connect_bd_net [get_bd_ports rxn_1] [get_bd_pins axi_10g_ethernet_1/rxn]
connect_bd_net [get_bd_ports rxp_2] [get_bd_pins axi_10g_ethernet_2/rxp]
connect_bd_net [get_bd_ports rxn_2] [get_bd_pins axi_10g_ethernet_2/rxn]
connect_bd_net [get_bd_ports rxp_3] [get_bd_pins axi_10g_ethernet_3/rxp]
connect_bd_net [get_bd_ports rxn_3] [get_bd_pins axi_10g_ethernet_3/rxn]
connect_bd_net [get_bd_ports txp_0] [get_bd_pins axi_10g_ethernet_0/txp]
connect_bd_net [get_bd_ports txn_0] [get_bd_pins axi_10g_ethernet_0/txn]
connect_bd_net [get_bd_ports txp_1] [get_bd_pins axi_10g_ethernet_1/txp]
connect_bd_net [get_bd_ports txn_1] [get_bd_pins axi_10g_ethernet_1/txn]
connect_bd_net [get_bd_ports txp_2] [get_bd_pins axi_10g_ethernet_2/txp]
connect_bd_net [get_bd_ports txn_2] [get_bd_pins axi_10g_ethernet_2/txn]
connect_bd_net [get_bd_ports txp_3] [get_bd_pins axi_10g_ethernet_3/txp]
connect_bd_net [get_bd_ports txn_3] [get_bd_pins axi_10g_ethernet_3/txn]

connect_bd_net [get_bd_ports core_status_0] [get_bd_pins axi_10g_ethernet_0/pcspma_status]
connect_bd_net [get_bd_ports core_status_1] [get_bd_pins axi_10g_ethernet_1/pcspma_status]
connect_bd_net [get_bd_ports core_status_2] [get_bd_pins axi_10g_ethernet_2/pcspma_status]
connect_bd_net [get_bd_ports core_status_3] [get_bd_pins axi_10g_ethernet_3/pcspma_status]

connect_bd_net [get_bd_ports bd_fclk0_125m] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_ports bd_fclk1_75m] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_ports bd_fclk2_200m] [get_bd_pins processing_system7_0/FCLK_CLK2]

connect_bd_net [get_bd_pins axi_10g_ethernet_0/s_axis_pause_tdata] [get_bd_pins pause_val/dout]
connect_bd_net [get_bd_pins axi_10g_ethernet_1/s_axis_pause_tdata] [get_bd_pins pause_val/dout]
connect_bd_net [get_bd_pins axi_10g_ethernet_2/s_axis_pause_tdata] [get_bd_pins pause_val/dout]
connect_bd_net [get_bd_pins axi_10g_ethernet_3/s_axis_pause_tdata] [get_bd_pins pause_val/dout]
connect_bd_net [get_bd_pins axi_10g_ethernet_0/s_axis_pause_tvalid] [get_bd_pins gnd/dout]
connect_bd_net [get_bd_pins axi_10g_ethernet_1/s_axis_pause_tvalid] [get_bd_pins gnd/dout]
connect_bd_net [get_bd_pins axi_10g_ethernet_2/s_axis_pause_tvalid] [get_bd_pins gnd/dout]
connect_bd_net [get_bd_pins axi_10g_ethernet_3/s_axis_pause_tvalid] [get_bd_pins gnd/dout]
connect_bd_net [get_bd_pins axi_10g_ethernet_0/tx_ifg_delay] [get_bd_pins tx_ifg_delay/dout] 
connect_bd_net [get_bd_pins axi_10g_ethernet_1/tx_ifg_delay] [get_bd_pins tx_ifg_delay/dout] 
connect_bd_net [get_bd_pins axi_10g_ethernet_2/tx_ifg_delay] [get_bd_pins tx_ifg_delay/dout] 
connect_bd_net [get_bd_pins axi_10g_ethernet_3/tx_ifg_delay] [get_bd_pins tx_ifg_delay/dout] 

connect_bd_net [get_bd_pins axi_10g_ethernet_0/tx_fault] [get_bd_pins gnd/dout] 
connect_bd_net [get_bd_pins axi_10g_ethernet_1/tx_fault] [get_bd_pins gnd/dout] 
connect_bd_net [get_bd_pins axi_10g_ethernet_2/tx_fault] [get_bd_pins gnd/dout] 
connect_bd_net [get_bd_pins axi_10g_ethernet_3/tx_fault] [get_bd_pins gnd/dout] 
connect_bd_net [get_bd_pins axi_10g_ethernet_0/sim_speedup_control] [get_bd_pins gnd/dout] 
connect_bd_net [get_bd_pins axi_10g_ethernet_1/sim_speedup_control] [get_bd_pins gnd/dout] 
connect_bd_net [get_bd_pins axi_10g_ethernet_2/sim_speedup_control] [get_bd_pins gnd/dout] 
connect_bd_net [get_bd_pins axi_10g_ethernet_3/sim_speedup_control] [get_bd_pins gnd/dout] 

connect_bd_net [get_bd_pins axi_10g_ethernet_0/signal_detect] [get_bd_pins vcc/dout]
connect_bd_net [get_bd_pins axi_10g_ethernet_1/signal_detect] [get_bd_pins vcc/dout]
connect_bd_net [get_bd_pins axi_10g_ethernet_2/signal_detect] [get_bd_pins vcc/dout]
connect_bd_net [get_bd_pins axi_10g_ethernet_3/signal_detect] [get_bd_pins vcc/dout]

connect_bd_net [get_bd_pins axi_10g_ethernet_0/dclk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins axi_10g_ethernet_1/dclk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins axi_10g_ethernet_2/dclk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins axi_10g_ethernet_3/dclk] [get_bd_pins processing_system7_0/FCLK_CLK0]

connect_bd_net [get_bd_pins axi_10g_ethernet_0/xgmacint] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins axi_10g_ethernet_1/xgmacint] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins axi_10g_ethernet_2/xgmacint] [get_bd_pins xlconcat_0/In2]
connect_bd_net [get_bd_pins axi_10g_ethernet_3/xgmacint] [get_bd_pins xlconcat_0/In3]

connect_bd_net [ get_bd_pins axi_10g_ethernet_0/areset_datapathclk_out] [ get_bd_pins axi_10g_ethernet_3/areset_coreclk]     [ get_bd_pins axi_10g_ethernet_2/areset_coreclk]     [ get_bd_pins axi_10g_ethernet_1/areset_coreclk]     
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/txusrclk_out]           [ get_bd_pins axi_10g_ethernet_3/txusrclk]           [ get_bd_pins axi_10g_ethernet_2/txusrclk]           [ get_bd_pins axi_10g_ethernet_1/txusrclk]
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/txusrclk2_out]          [ get_bd_pins axi_10g_ethernet_3/txusrclk2]          [ get_bd_pins axi_10g_ethernet_2/txusrclk2]          [ get_bd_pins axi_10g_ethernet_1/txusrclk2]
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/txuserrdy_out]          [ get_bd_pins axi_10g_ethernet_3/txuserrdy]          [ get_bd_pins axi_10g_ethernet_2/txuserrdy]          [ get_bd_pins axi_10g_ethernet_1/txuserrdy]
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/coreclk_out]            [ get_bd_pins axi_10g_ethernet_3/coreclk]            [ get_bd_pins axi_10g_ethernet_2/coreclk]            [ get_bd_pins axi_10g_ethernet_1/coreclk]
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/gttxreset_out]          [ get_bd_pins axi_10g_ethernet_3/gttxreset]          [ get_bd_pins axi_10g_ethernet_2/gttxreset]          [ get_bd_pins axi_10g_ethernet_1/gttxreset]
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/gtrxreset_out]          [ get_bd_pins axi_10g_ethernet_3/gtrxreset]          [ get_bd_pins axi_10g_ethernet_2/gtrxreset]          [ get_bd_pins axi_10g_ethernet_1/gtrxreset]
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/qplllock_out]           [ get_bd_pins axi_10g_ethernet_3/qplllock]           [ get_bd_pins axi_10g_ethernet_2/qplllock]           [ get_bd_pins axi_10g_ethernet_1/qplllock]
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/qplloutclk_out]         [ get_bd_pins axi_10g_ethernet_3/qplloutclk]         [ get_bd_pins axi_10g_ethernet_2/qplloutclk]         [ get_bd_pins axi_10g_ethernet_1/qplloutclk]
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/qplloutrefclk_out]      [ get_bd_pins axi_10g_ethernet_3/qplloutrefclk]      [ get_bd_pins axi_10g_ethernet_2/qplloutrefclk]      [ get_bd_pins axi_10g_ethernet_1/qplloutrefclk]
connect_bd_net [ get_bd_pins axi_10g_ethernet_0/reset_counter_done_out] [ get_bd_pins axi_10g_ethernet_3/reset_counter_done] [ get_bd_pins axi_10g_ethernet_2/reset_counter_done] [ get_bd_pins axi_10g_ethernet_1/reset_counter_done]

# system reset connection
connect_bd_net [get_bd_ports ext_reset_in] [get_bd_pins rst_ps7_0_156M/ext_reset_in]
connect_bd_net [get_bd_ports ext_reset_in] [get_bd_pins rst_ps7_0_75M/ext_reset_in]
connect_bd_net [get_bd_pins rst_ps7_0_156M/mb_debug_sys_rst] [get_bd_pins gnd/dout]
connect_bd_net [get_bd_pins rst_ps7_0_75M/mb_debug_sys_rst] [get_bd_pins gnd/dout]
connect_bd_net [get_bd_pins rst_ps7_0_75M/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins rst_ps7_0_156M/slowest_sync_clk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]

connect_bd_net [get_bd_pins rst_ps7_0_156M/aux_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
connect_bd_net [get_bd_pins rst_ps7_0_75M/aux_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]

connect_bd_net [get_bd_pins rst_ps7_0_75M/peripheral_reset] [get_bd_pins axi_10g_ethernet_0/reset]
connect_bd_net [get_bd_pins rst_ps7_0_75M/peripheral_reset] [get_bd_pins axi_10g_ethernet_1/areset]
connect_bd_net [get_bd_pins rst_ps7_0_75M/peripheral_reset] [get_bd_pins axi_10g_ethernet_2/areset]
connect_bd_net [get_bd_pins rst_ps7_0_75M/peripheral_reset] [get_bd_pins axi_10g_ethernet_3/areset]

connect_bd_net [get_bd_pins rst_ps7_0_156M/peripheral_aresetn] [get_bd_pins axi_10g_ethernet_0/rx_axis_aresetn]
connect_bd_net [get_bd_pins rst_ps7_0_156M/peripheral_aresetn] [get_bd_pins axi_10g_ethernet_0/tx_axis_aresetn]
connect_bd_net [get_bd_pins rst_ps7_0_156M/peripheral_aresetn] [get_bd_pins axi_10g_ethernet_1/rx_axis_aresetn]
connect_bd_net [get_bd_pins rst_ps7_0_156M/peripheral_aresetn] [get_bd_pins axi_10g_ethernet_1/tx_axis_aresetn]
connect_bd_net [get_bd_pins rst_ps7_0_156M/peripheral_aresetn] [get_bd_pins axi_10g_ethernet_2/rx_axis_aresetn]
connect_bd_net [get_bd_pins rst_ps7_0_156M/peripheral_aresetn] [get_bd_pins axi_10g_ethernet_2/tx_axis_aresetn]
connect_bd_net [get_bd_pins rst_ps7_0_156M/peripheral_aresetn] [get_bd_pins axi_10g_ethernet_3/rx_axis_aresetn]
connect_bd_net [get_bd_pins rst_ps7_0_156M/peripheral_aresetn] [get_bd_pins axi_10g_ethernet_3/tx_axis_aresetn]

connect_bd_net [get_bd_pins axi_dma_0/s_axi_lite_aclk] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_dma_0/axi_resetn] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_dma_0/m_axi_sg_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_dma_0/m_axi_mm2s_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]

connect_bd_net [get_bd_pins axi_dma_1/s_axi_lite_aclk] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_dma_1/axi_resetn] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_dma_1/m_axi_sg_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_dma_1/m_axi_mm2s_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_dma_1/m_axi_s2mm_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]

connect_bd_net [get_bd_pins axi_dma_2/s_axi_lite_aclk] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_dma_2/axi_resetn] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_dma_2/m_axi_sg_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_dma_2/m_axi_mm2s_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_dma_2/m_axi_s2mm_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]

connect_bd_net [get_bd_pins axi_dma_3/s_axi_lite_aclk] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_dma_3/axi_resetn] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_dma_3/m_axi_sg_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_dma_3/m_axi_mm2s_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_dma_3/m_axi_s2mm_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]

connect_bd_net [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins xlconcat_0/In4]
connect_bd_net [get_bd_pins axi_dma_0/s2mm_introut] [get_bd_pins xlconcat_0/In5]
connect_bd_net [get_bd_pins axi_dma_1/mm2s_introut] [get_bd_pins xlconcat_0/In6]
connect_bd_net [get_bd_pins axi_dma_1/s2mm_introut] [get_bd_pins xlconcat_0/In7]
connect_bd_net [get_bd_pins axi_dma_2/mm2s_introut] [get_bd_pins xlconcat_0/In8]
connect_bd_net [get_bd_pins axi_dma_2/s2mm_introut] [get_bd_pins xlconcat_0/In9]
connect_bd_net [get_bd_pins axi_dma_3/mm2s_introut] [get_bd_pins xlconcat_0/In10]
connect_bd_net [get_bd_pins axi_dma_3/s2mm_introut] [get_bd_pins xlconcat_0/In11]

# axi_ic_gp connection
connect_bd_net [get_bd_pins axi_ic_gp/ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/S00_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M00_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M01_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M02_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M03_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M04_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M05_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M06_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M07_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M08_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M09_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M10_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M11_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M12_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins axi_ic_gp/M13_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]

connect_bd_net [get_bd_pins axi_ic_gp/ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/S00_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M00_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M01_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M02_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M03_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M04_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M05_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M06_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M07_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M08_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M09_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M10_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M11_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M12_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_gp/M13_ARESETN] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]

connect_bd_intf_net [ get_bd_intf_pins axi_10g_ethernet_0/s_axi] -boundary_type upper          [ get_bd_intf_pins axi_ic_gp/M00_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_10g_ethernet_1/s_axi] -boundary_type upper          [ get_bd_intf_pins axi_ic_gp/M01_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_10g_ethernet_2/s_axi] -boundary_type upper          [ get_bd_intf_pins axi_ic_gp/M02_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_10g_ethernet_3/s_axi] -boundary_type upper          [ get_bd_intf_pins axi_ic_gp/M03_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_0/S_AXI_LITE] -boundary_type upper              [ get_bd_intf_pins axi_ic_gp/M04_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_1/S_AXI_LITE] -boundary_type upper              [ get_bd_intf_pins axi_ic_gp/M05_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_2/S_AXI_LITE] -boundary_type upper              [ get_bd_intf_pins axi_ic_gp/M06_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_3/S_AXI_LITE] -boundary_type upper              [ get_bd_intf_pins axi_ic_gp/M07_AXI]
connect_bd_intf_net [ get_bd_intf_pins packet_pipeline_output/s_axi_lite] -boundary_type upper [ get_bd_intf_pins axi_ic_gp/M08_AXI]
connect_bd_intf_net [ get_bd_intf_pins PPPOE/control_domain_tb_S_AXI] -boundary_type upper   [ get_bd_intf_pins axi_ic_gp/M09_AXI]
connect_bd_intf_net [ get_bd_intf_pins PPPOE/control_extL2_tb_S_AXI] -boundary_type upper    [ get_bd_intf_pins axi_ic_gp/M10_AXI]
connect_bd_intf_net [ get_bd_intf_pins PPPOE/control_l3_tb_S_AXI] -boundary_type upper       [ get_bd_intf_pins axi_ic_gp/M11_AXI]
connect_bd_intf_net [ get_bd_intf_pins PPPOE/control_pppL2_tb_S_AXI] -boundary_type upper    [ get_bd_intf_pins axi_ic_gp/M12_AXI]
connect_bd_intf_net [ get_bd_intf_pins PPPOE/control_qinq_tb_S_AXI] -boundary_type upper     [ get_bd_intf_pins axi_ic_gp/M13_AXI]

# axi_ic_hp connection
connect_bd_net [get_bd_pins axi_ic_hp/ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/M00_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S00_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S01_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S02_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S03_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S04_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S05_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S06_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S07_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S08_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S09_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S10_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins axi_ic_hp/S11_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]

connect_bd_net [get_bd_pins axi_ic_hp/ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/M00_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S00_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S01_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S02_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S03_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S04_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S05_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S06_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S07_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S08_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S09_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S10_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_ic_hp/S11_ARESETN] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]

connect_bd_intf_net [ get_bd_intf_pins axi_dma_0/M_AXI_SG] -boundary_type upper   [ get_bd_intf_pins axi_ic_hp/S00_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_0/M_AXI_MM2S] -boundary_type upper [ get_bd_intf_pins axi_ic_hp/S01_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_0/M_AXI_S2MM] -boundary_type upper [ get_bd_intf_pins axi_ic_hp/S02_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_1/M_AXI_SG] -boundary_type upper   [ get_bd_intf_pins axi_ic_hp/S03_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_1/M_AXI_MM2S] -boundary_type upper [ get_bd_intf_pins axi_ic_hp/S04_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_1/M_AXI_S2MM] -boundary_type upper [ get_bd_intf_pins axi_ic_hp/S05_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_2/M_AXI_SG] -boundary_type upper   [ get_bd_intf_pins axi_ic_hp/S06_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_2/M_AXI_MM2S] -boundary_type upper [ get_bd_intf_pins axi_ic_hp/S07_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_2/M_AXI_S2MM] -boundary_type upper [ get_bd_intf_pins axi_ic_hp/S08_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_3/M_AXI_SG] -boundary_type upper   [ get_bd_intf_pins axi_ic_hp/S09_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_3/M_AXI_MM2S] -boundary_type upper [ get_bd_intf_pins axi_ic_hp/S10_AXI]
connect_bd_intf_net [ get_bd_intf_pins axi_dma_3/M_AXI_S2MM] -boundary_type upper [ get_bd_intf_pins axi_ic_hp/S11_AXI]

# zynq connection
connect_bd_intf_net [get_bd_intf_pins processing_system7_0/S_AXI_HP0] -boundary_type upper [get_bd_intf_pins axi_ic_hp/M00_AXI] 
connect_bd_intf_net [get_bd_intf_pins processing_system7_0/M_AXI_GP0] -boundary_type upper [get_bd_intf_pins axi_ic_gp/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins processing_system7_0/FIXED_IO] [get_bd_intf_ports FIXED_IO]
connect_bd_intf_net [get_bd_intf_pins processing_system7_0/DDR] [get_bd_intf_ports DDR]
connect_bd_net [get_bd_pins processing_system7_0/IRQ_F2P] [get_bd_pins xlconcat_0/dout]
connect_bd_net [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins axi_10g_ethernet_0/coreclk_out]

# dma_eth connection
connect_bd_intf_net [get_bd_intf_pins dma_eth_0/s_axis_rxd_0] [get_bd_intf_pins axi_10g_ethernet_0/m_axis_rx] 
connect_bd_intf_net [get_bd_intf_pins dma_eth_0/s_axis_rxd_1] [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] 
connect_bd_net [get_bd_pins dma_eth_0/s_axis_rxd_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins dma_eth_0/s_axis_rxd_aresetn] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]

connect_bd_intf_net [get_bd_intf_pins dma_eth_1/s_axis_rxd_0] [get_bd_intf_pins axi_10g_ethernet_1/m_axis_rx] 
connect_bd_intf_net [get_bd_intf_pins dma_eth_1/s_axis_rxd_1] [get_bd_intf_pins axi_dma_1/M_AXIS_MM2S] 
connect_bd_net [get_bd_pins dma_eth_1/s_axis_rxd_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins dma_eth_1/s_axis_rxd_aresetn] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]

connect_bd_intf_net [get_bd_intf_pins dma_eth_2/s_axis_rxd_0] [get_bd_intf_pins axi_10g_ethernet_2/m_axis_rx] 
connect_bd_intf_net [get_bd_intf_pins dma_eth_2/s_axis_rxd_1] [get_bd_intf_pins axi_dma_2/M_AXIS_MM2S] 
connect_bd_net [get_bd_pins dma_eth_2/s_axis_rxd_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins dma_eth_2/s_axis_rxd_aresetn] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]

connect_bd_intf_net [get_bd_intf_pins dma_eth_3/s_axis_rxd_0] [get_bd_intf_pins axi_10g_ethernet_3/m_axis_rx] 
connect_bd_intf_net [get_bd_intf_pins dma_eth_3/s_axis_rxd_1] [get_bd_intf_pins axi_dma_3/M_AXIS_MM2S] 
connect_bd_net [get_bd_pins dma_eth_3/s_axis_rxd_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins dma_eth_3/s_axis_rxd_aresetn] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
# packet_pipeline_input connection
connect_bd_intf_net [get_bd_intf_pins packet_pipeline_input/s_axis_rxd_0] [get_bd_intf_pins dma_eth_0/m_axis_txd_0] 
connect_bd_intf_net [get_bd_intf_pins packet_pipeline_input/s_axis_rxd_1] [get_bd_intf_pins dma_eth_1/m_axis_txd_0] 
connect_bd_intf_net [get_bd_intf_pins packet_pipeline_input/s_axis_rxd_2] [get_bd_intf_pins dma_eth_2/m_axis_txd_0] 
connect_bd_intf_net [get_bd_intf_pins packet_pipeline_input/s_axis_rxd_3] [get_bd_intf_pins dma_eth_3/m_axis_txd_0] 
connect_bd_net [get_bd_pins packet_pipeline_input/s_axis_rxd_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins packet_pipeline_input/s_axis_rxd_aresetn] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]

# packet_pipeline_output connection
connect_bd_net [get_bd_pins packet_pipeline_output/s_axis_rxd_aclk] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins packet_pipeline_output/s_axis_rxd_aresetn] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins packet_pipeline_output/s_axi_lite_aclk] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins packet_pipeline_output/s_axi_lite_aresetn] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]

connect_bd_intf_net [get_bd_intf_pins packet_pipeline_output/m_axis_s2mm_0] [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM]
connect_bd_intf_net [get_bd_intf_pins packet_pipeline_output/m_axis_s2mm_1] [get_bd_intf_pins axi_dma_1/S_AXIS_S2MM]
connect_bd_intf_net [get_bd_intf_pins packet_pipeline_output/m_axis_s2mm_2] [get_bd_intf_pins axi_dma_2/S_AXIS_S2MM]
connect_bd_intf_net [get_bd_intf_pins packet_pipeline_output/m_axis_s2mm_3] [get_bd_intf_pins axi_dma_3/S_AXIS_S2MM]
connect_bd_intf_net [get_bd_intf_pins packet_pipeline_output/m_axis_txd_0] [get_bd_intf_pins axi_10g_ethernet_0/s_axis_tx]
connect_bd_intf_net [get_bd_intf_pins packet_pipeline_output/m_axis_txd_1] [get_bd_intf_pins axi_10g_ethernet_1/s_axis_tx]
connect_bd_intf_net [get_bd_intf_pins packet_pipeline_output/m_axis_txd_2] [get_bd_intf_pins axi_10g_ethernet_2/s_axis_tx]
connect_bd_intf_net [get_bd_intf_pins packet_pipeline_output/m_axis_txd_3] [get_bd_intf_pins axi_10g_ethernet_3/s_axis_tx]

# PPPOE connection

connect_bd_intf_net [get_bd_intf_pins PPPOE/packet_in_instream] [get_bd_intf_pins packet_pipeline_input/m_axis_txd_0]
connect_bd_intf_net [get_bd_intf_pins PPPOE/packet_out_outstream] [get_bd_intf_pins packet_pipeline_output/s_axis_rxd_0]
connect_bd_net [get_bd_pins PPPOE/enable_processing] [get_bd_pins vcc/dout]
connect_bd_net [get_bd_pins PPPOE/tuple_out_flowstream_VALID] [get_bd_pins packet_pipeline_output/tuple_in_flowstream_valid]
connect_bd_net [get_bd_pins PPPOE/tuple_out_flowstream_DATA] [get_bd_pins packet_pipeline_output/tuple_in_flowstream_data]
connect_bd_net [get_bd_pins PPPOE/clk_line] [get_bd_pins axi_10g_ethernet_0/coreclk_out]
connect_bd_net [get_bd_pins PPPOE/clk_packet] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins PPPOE/clk_control] [get_bd_pins processing_system7_0/FCLK_CLK1]
connect_bd_net [get_bd_pins PPPOE/clk_line_rst] [get_bd_pins rst_ps7_0_156M/peripheral_aresetn]
connect_bd_net [get_bd_pins PPPOE/clk_packet_rst] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]
connect_bd_net [get_bd_pins PPPOE/clk_control_rst] [get_bd_pins rst_ps7_0_75M/peripheral_aresetn]


# Create address segments
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_1/Data_SG] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_1/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_1/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_2/Data_SG] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_2/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_2/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_3/Data_SG] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_3/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_3/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM

create_bd_addr_seg -range 0x10000 -offset 0x40400000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] SEG_axi_dma_0_Reg
create_bd_addr_seg -range 0x10000 -offset 0x40410000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_1/S_AXI_LITE/Reg] SEG_axi_dma_1_Reg
create_bd_addr_seg -range 0x10000 -offset 0x40420000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_2/S_AXI_LITE/Reg] SEG_axi_dma_2_Reg
create_bd_addr_seg -range 0x10000 -offset 0x40430000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_3/S_AXI_LITE/Reg] SEG_axi_dma_3_Reg
create_bd_addr_seg -range 0x40000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_10g_ethernet_0/s_axi/REG0] SEG_eth_buf_REG
create_bd_addr_seg -range 0x40000 -offset 0x43C40000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_10g_ethernet_1/s_axi/REG0] SEG_eth_buf_REG2
create_bd_addr_seg -range 0x40000 -offset 0x43C80000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_10g_ethernet_2/s_axi/REG0] SEG_eth_buf_REG4
create_bd_addr_seg -range 0x40000 -offset 0x43CC0000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_10g_ethernet_3/s_axi/REG0] SEG_eth_buf_REG6
create_bd_addr_seg -range 0x10000 -offset 0x43D00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs PPPOE/control_domain_tb_S_AXI/reg0] SEG_eth_buf_REG8
create_bd_addr_seg -range 0x10000 -offset 0x43D10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs PPPOE/control_extL2_tb_S_AXI/reg0] SEG_eth_buf_REG10
create_bd_addr_seg -range 0x10000 -offset 0x43D20000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs PPPOE/control_l3_tb_S_AXI/reg0] SEG_eth_buf_REG12
create_bd_addr_seg -range 0x10000 -offset 0x43D30000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs PPPOE/control_pppL2_tb_S_AXI/reg0] SEG_eth_buf_REG14
create_bd_addr_seg -range 0x10000 -offset 0x43D40000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs PPPOE/control_qinq_tb_S_AXI/reg0] SEG_eth_buf_REG16
create_bd_addr_seg -range 0x8000000 -offset 0x48000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs packet_pipeline_output/s_axi_lite/reg0] SEG_eth_buf_REG18

save_bd_design
