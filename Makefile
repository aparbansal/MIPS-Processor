#Makefile for EDA processes

#Tools used
SIM_TOOL    = iverilog					#https://iverilog.fandom.com/wiki/Installation_Guide
SYNTH_TOOL  = yosys						#https://github.com/YosysHQ/yosys#setup
PNR_TOOL    = nextpnr-ice40
TIMING_TOOL = icetime					#http://www.clifford.at/icestorm/

# List of files
DESIGN = rtl/processor.v
VERIF  = tb/testbench.sv
SYNTH  = syn/synth.ys

 
#################################
# Needed to make the following work
.PHONY: rtl syn clean

# Outputs simulation and waveform
rtl:
	$(SIM_TOOL) $(VERIF) $(DESIGN) -o tb/result.out
	./tb/result.out

# Outputs netlist and area
syn:
	$(SYNTH_TOOL) syn/synth.ys

# Outputs timing details
time:
	$(SYNTH_TOOL)  -p 'synth_ice40 -json syn/synth.json' rtl/processor.v
	$(PNR_TOOL)    --json syn/synth.json --asc syn/synth.asc --package tq144  --pcf-allow-unconstrained
	$(TIMING_TOOL) -tmd hx1k syn/synth.asc

# type "make clean" to remove following files
clean:
	rm -f tb/*.out tb/waveform.vcd
	rm -f waveform.vcd
	rm -f syn/synth.v syn/*.json syn/*.blif syn/*.asc syn/*.json
