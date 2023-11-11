compile: 
	iverilog -o buf_reg.o buf_reg_tb.sv buf_reg.sv buf_reg_bh.sv dff.sv -g2012

sim: 
	vvp buf_reg.o
	gtkwave buf_reg.vcd buf_reg.gtkw

clean:
	rm buf_reg.o buf_reg.vcd

all:
	make compile
	make sim