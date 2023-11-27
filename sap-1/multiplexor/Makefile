compile: 
	iverilog -o mux.o mux_tb.sv mux.sv mux_bh.sv -g2012

sim: 
	vvp mux.o
	gtkwave mux.vcd mux.gtkw

clean:
	rm mux.o mux.vcd

all:
	make compile
	make sim