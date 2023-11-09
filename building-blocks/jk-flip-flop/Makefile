compile: 
	iverilog -o jkff.o jkff_tb.sv jkff.sv jkff_bh.sv -g2012

sim: 
	vvp jkff.o
	gtkwave jkff.vcd jkff.gtkw

clean:
	rm jkff.o jkff.vcd

all:
	make compile
	make sim
