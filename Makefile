IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_flit_crossbar5 -o build/sim rtl/flit_crossbar5.sv tb/tb_flit_crossbar5.sv
	$(VVP) build/sim
