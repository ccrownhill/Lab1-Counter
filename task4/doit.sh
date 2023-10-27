#!/bin/sh

rm -rf obj_dir
rm -f counter.vcd

verilator -Wall --cc --trace counter.sv top.sv bin2bcd.sv --exe top_tb.cpp
#verilator -Wall --cc --trace top.sv --exe top_tb.cpp
#verilator -Wall --cc --trace bin2bcd.sv --exe bin2bcd.sv.cpp

make -j -C obj_dir/ -f Vcounter.mk Vcounter

obj_dir/Vcounter