compile: 
	iverilog -o pc.o pc_tb.sv pc.sv pc_bh.sv jkff.sv -g2012

sim: 
	vvp pc.o
	gtkwave pc.vcd pc.gtkw

clean:
	rm pc.o pc.vcd

all:
	make compile
	make sim