compile: 
	iverilog -o fa.o fa_tb.sv fa.sv fa_bh.sv ./../half-adder/ha.sv -g2012

sim: 
	vvp fa.o
	gtkwave fa.vcd fa.gtkw

clean:
	rm fa.o fa.vcd

all:
	make compile
	make sim