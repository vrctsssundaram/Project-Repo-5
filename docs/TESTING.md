# Test procedure

Run `make test` and confirm `PASS`. The regression drives five contending sources to output 2, holds its ready low, verifies output stability and then checks round-robin grant order.

`make synth` reproduces the generic Yosys RTL synthesis check.
