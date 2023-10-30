compile: 
	iverilog -o ha.o ha_tb.sv ha.sv ha_bh.sv -g2012

sim: 
	vvp ha.o
	gtkwave ha.vcd ha.gtkw

clean:
	rm ha.o ha.vcd

all:
	make compile
	make sim