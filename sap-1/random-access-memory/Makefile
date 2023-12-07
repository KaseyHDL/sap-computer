compile: 
	iverilog -o ram.o ram_tb.sv ram.sv ram_bh.sv dl.sv -g2012

sim: 
	vvp ram.o
	gtkwave ram.vcd ram.gtkw

clean:
	rm ram.o ram.vcd

all:
	make compile
	make sim