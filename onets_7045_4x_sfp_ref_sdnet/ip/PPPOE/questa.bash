#!/bin/bash
set -euo pipefail
set -x
vlib work
find -name "*.v" -o -name "*.vp" | xargs vlog -lint +acc 
find -name "*.sv" -o -name "*.c" | xargs vlog 
vlog -ccflags -std=c++0x -ccflags -IPPPOE.TB $(find -name '*.cpp')
vsim -gui PPPOE_tb -do 'add wave -r /*; run -all'

