compile: 
	iverilog -o add_sub.o add_sub_tb.sv add_sub.sv add_sub_bh.sv ../../four-bit-adder/fba.sv ../../full-adder/fa.sv ../../half-adder/ha.sv -g2012

sim: 
	vvp add_sub.o
	gtkwave add_sub.vcd add_sub.gtkw

clean:
	rm add_sub.o add_sub.vcd

all:
	make compile
	make sim