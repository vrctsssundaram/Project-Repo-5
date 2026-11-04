# Verification record

Date: 04 November 2026
Source revision tested: `4b639f48ad23fdf81ab4cc7665860ea3e6270736`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-5/actions/runs/41870099993

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | five-port flit arbitration, round-robin order and backpressure |
| FPGA synthesis / utilization | **Not run** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.
