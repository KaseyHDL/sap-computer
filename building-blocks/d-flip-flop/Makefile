compile: 
	iverilog -o dff.o dff_tb.sv dff.sv dff_bh.sv -g2012

sim: 
	vvp dff.o
	gtkwave dff.vcd dff.gtkw

clean:
	rm dff.o dff.vcd

all:
	make compile
	make sim