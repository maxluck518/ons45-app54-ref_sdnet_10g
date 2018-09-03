##
#ten gig Ethernet
##
set_property PACKAGE_PIN AA6 [get_ports refclk_p]
set_property PACKAGE_PIN AA5 [get_ports refclk_n]

create_clock -period 6.400 [get_ports refclk_p]

# the port0
set_property PACKAGE_PIN AD7 [get_ports {rxn[0]}]
set_property PACKAGE_PIN AD8 [get_ports {rxp[0]}]
set_property PACKAGE_PIN AF7 [get_ports {txn[0]}]
set_property PACKAGE_PIN AF8 [get_ports {txp[0]}]

# the port1
set_property PACKAGE_PIN AE5 [get_ports {rxn[1]}]
set_property PACKAGE_PIN AE6 [get_ports {rxp[1]}]
set_property PACKAGE_PIN AF3 [get_ports {txn[1]}]
set_property PACKAGE_PIN AF4 [get_ports {txp[1]}]

# the port2
set_property PACKAGE_PIN AC5 [get_ports {rxn[2]}]
set_property PACKAGE_PIN AC6 [get_ports {rxp[2]}]
set_property PACKAGE_PIN AE1 [get_ports {txn[2]}]
set_property PACKAGE_PIN AE2 [get_ports {txp[2]}]

# the port3
set_property PACKAGE_PIN AD3 [get_ports {rxn[3]}]
set_property PACKAGE_PIN AD4 [get_ports {rxp[3]}]
set_property PACKAGE_PIN AC1 [get_ports {txn[3]}]
set_property PACKAGE_PIN AC2 [get_ports {txp[3]}]

#reset: SW5 button_A
set_property PACKAGE_PIN A13 [get_ports reset]
set_property IOSTANDARD LVCMOS15 [get_ports reset]

############################################################
## LED + PMOD + BUTTON + SWITCH
############################################################
set_property PACKAGE_PIN AB24 [get_ports {pl_led[0]}]
set_property PACKAGE_PIN AA24 [get_ports {pl_led[1]}]
set_property PACKAGE_PIN AF24 [get_ports {pl_pmod[0]}]
set_property PACKAGE_PIN AD24 [get_ports {pl_pmod[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pl_led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pl_led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pl_pmod[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pl_pmod[1]}]

