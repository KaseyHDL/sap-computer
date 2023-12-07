compile: 
	iverilog -o dl.o dl_tb.sv dl.sv dl_bh.sv -g2012

sim: 
	vvp dl.o
	gtkwave dl.vcd dl.gtkw

clean:
	rm dl.o dl.vcd

all:
	make compile
	make sim