##############################################
# Part         - xcvu9p
# Package      - fsgd2104
# Speed grade  - -2L
# Xilinx Reference Board is VCU1525
###############################################################################

# General configuration - Do not modify
set_property CFGBVS GND                                [current_design]
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true           [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN {DIV-1} [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES       [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]

#############################################################################################################


set_property -dict {PACKAGE_PIN AY38 IOSTANDARD DIFF_SSTL12} [get_ports {clk_n}]
set_property -dict {PACKAGE_PIN AY37 IOSTANDARD DIFF_SSTL12} [get_ports {clk_p}]
set_property -dict {PACKAGE_PIN BD21 IOSTANDARD LVCMOS18} [get_ports {rst_n}]
set_property -dict {PACKAGE_PIN BC21 IOSTANDARD LVCMOS18} [get_ports {led_0}]
set_property -dict {PACKAGE_PIN BB21 IOSTANDARD LVCMOS18} [get_ports {led_1}]
set_property -dict {PACKAGE_PIN BA20 IOSTANDARD LVCMOS18} [get_ports {led_2}]
set_property -dict {PACKAGE_PIN AL20 IOSTANDARD LVCMOS12} [get_ports {button}]

