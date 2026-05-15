vsim CNT16_TB +access+r -dbg
vcd file dump.vcd
vcd add -r sim:/*
run -all

# compile
vlib work
vcom -93 -work work CNT16_TB.vhd

# simulate
vsim CNT16
view -undock wave
radix hex 

# display input waves
add wave -divider -height 32 Inputs
add wave -height 32 -radix default ARESETN
add wave -height 32 -radix default CLK
add wave -height 32 -radix default LOAD
add wave -height 32 -radix default PRE
add wave -height 32 -radix default TCEN
add wave -height 32 -radix default CNTEN
add wave -height 32 -radix default DIR

# display output waves
add wave -divider -height 32 Outputs
add wave -height 32 -radix default TC
add wave -height 32 -radix default CNT

# generate input stimuli
# CLK f = 25Mhz; ARESETN, TCEN, CNTEN - active low
# Initialize values
force CLK     0 0ns, 1 20ns -r 40ns
force LOAD    0 0ns
force PRE     0 0ns
force TCEN    1 0ns
force CNTEN   1 0ns
force DIR     0 0ns

# Test case 1: reset
force ARESETN 1 0ns, 0 5ns   

# Test case 4: load
force ARESETN 1 10ns
force LOAD 1 10ns
force PRE  A 10ns
# Test case 2: load + reset
force ARESETN 0 30ns

# Test case 6: count up one full cycle + wrap
force LOAD 0 40ns
force ARESETN 1 40ns
force CNTEN 0 40ns
force TCEN 0 40ns
force DIR 1 40ns

# Test case 5: count + load
force LOAD 1 690ns
force PRE F 690ns
# Test case 6: count down one full cycle + wrap
force LOAD 0 730ns
force DIR 0 730ns
# Test case 3: count + reset
force ARESETN 0 1400ns

# Test case 10: TC = f(TCEN)
force ARESETN 1 1450ns
force CNTEN 0 1450ns

# TC shall be one
force DIR 1 1450ns
force LOAD 1 1450ns
force PRE F 1450ns

# TC shall be zero
force TCEN 1 1520ns

# TC shall be one
force TCEN 0 1560ns
force DIR 0 1560ns
force LOAD 1 1560ns
force PRE 0 1560ns

# TC shall be zero
force TCEN 1 1640ns

# Test case 9: CNT = f(CNTEN)
force LOAD 0 1680ns
force DIR 1 1680ns
force CNTEN 0 1680ns

force CNTEN 1 1760ns

force CNTEN 0 1840ns

# Test case 8: CNT = f(DIR)
force DIR 0 1960ns, 1 2080ns

run 2200ns
wave zoom full
