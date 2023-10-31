compile: 
	iverilog -o fba.o fba_tb.sv fba.sv fba_bh.sv ./../full-adder/fa.sv ./../half-adder/ha.sv -g2012

sim: 
	vvp fba.o
	gtkwave fba.vcd fba.gtkw

clean:
	rm fba.o fba.vcd

all:
	make compile
	make sim