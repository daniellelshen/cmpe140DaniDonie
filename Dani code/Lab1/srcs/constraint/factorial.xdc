# Clock signal
set_property -dict {PACKAGE_PIN W5  IOSTANDARD LVCMOS33}           [get_ports {clk}];                 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5}  [get_ports {clk}];

# Buttons
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {rst}];
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports {clock_button}];
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports {go}];

# Switches
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {SW_n[0]}];
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {SW_n[1]}];
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {SW_n[2]}];
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports {SW_n[3]}];
# set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports {op[0]}];
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports {HILO_sel}];

# LED
set_property -dict {PACKAGE_PIN L1  IOSTANDARD LVCMOS33} [get_ports {done_led}];
set_property -dict {PACKAGE_PIN P1  IOSTANDARD LVCMOS33} [get_ports {error}];
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports {cs[1]}];
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {cs[0]}];

# 7 Segment Display
set_property -dict {PACKAGE_PIN W7 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[0]}];
set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[1]}];
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[2]}];
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[3]}];
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[4]}];
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[5]}];
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[6]}];
set_property -dict {PACKAGE_PIN V7 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[7]}];
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[0]}];
set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[1]}];
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[2]}];
set_property -dict {PACKAGE_PIN W4 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[3]}];
