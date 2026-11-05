# Verification record

Date: 05 November 2026
Source revision tested: `c31386e23e39ebf2450af9d81e14d48083280d7a`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-5/actions/runs/41902467062
Hosted generic synthesis: https://github.com/vrctsssundaram/Project-Repo-5/actions/runs/41902467055

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | five-port flit arbitration, round-robin order and backpressure |
| Generic Yosys synthesis | **PASS**; 13,177 technology-independent cells |

**Evidence:** Tool-reported Icarus Verilog regression and Yosys synthesis results for the source revision cited above.
