#==============================================================================#
# Half-Adder Makefile
#------------------------------------------------------------------------------#
# Engineer: Kasey Hill
# Filename: Makefile
# Modeling: compilation
# Textbook: figure 6-2
#==============================================================================#
# compile files into output 	
compile: 
	iverilog -o fa.o fa_tb.sv fa.sv fa_bh.sv -g2012

# convert output to vcd format and plot waveforms
sim: 
	vvp fa.o
	gtkwave fa.vcd fa.gtkw

# clean files
clean:
	rm fa.o fa.vcd

# compile and simulate
all:
	make compile
	make sim