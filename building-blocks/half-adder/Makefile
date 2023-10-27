#==============================================================================#
# Half-Adder Makefile
#------------------------------------------------------------------------------#
# Engineer: Kasey Hill
# Filename: Makefile
# Modeling: compilation
# Textbook: figure 6-1
#==============================================================================#
# compile files into output 	
compile: 
	iverilog -o ha.o ha_tb.sv ha.sv ha_bh.sv -g2012

# convert output to vcd format and plot waveforms
sim: 
	vvp ha.o
	gtkwave ha.vcd ha.gtkw --script=wave.do

# clean files
clean:
	rm ha.o ha.vcd

# compile and simulate
all:
	make compile
	make sim