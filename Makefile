IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_flit_crossbar5 -o build/sim rtl/flit_crossbar5.sv tb/tb_flit_crossbar5.sv
	$(VVP) build/sim

YOSYS ?= yosys
.PHONY: synth
synth:
	mkdir -p build
	$(YOSYS) -Q -T -l build/synthesis.log -p 'read_verilog -sv rtl/flit_crossbar5.sv; hierarchy -check -top flit_crossbar5; synth -top flit_crossbar5; stat'
