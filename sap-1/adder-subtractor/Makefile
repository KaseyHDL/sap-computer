compile: 
	iverilog -o alu.o alu_tb.sv alu.sv alu_bh.sv ../../four-bit-adder/fba.sv ../../full-adder/fa.sv ../../half-adder/ha.sv -g2012

sim: 
	vvp alu.o
	gtkwave alu.vcd alu.gtkw

clean:
	rm alu.o alu.vcd

all:
	make compile
	make sim