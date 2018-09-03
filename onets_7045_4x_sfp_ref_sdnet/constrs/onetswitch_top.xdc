set_false_path -from [get_clocks refclk_p] -to [get_clocks clk_fpga_1]
set_false_path -from [get_clocks clk_fpga_1] -to [get_clocks refclk_p]
set_false_path -from [get_clocks refclk_p] -to [get_clocks refclk_p]

