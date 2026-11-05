# Technical design

Five inputs compete for five outputs. Each input requests exactly one output based on the high three bits of its flit. Each output maintains a rotating starting priority and grants at most one input. The output's ready signal is returned only to the granted source.

The crossbar provides destination selection with per-output round-robin arbitration and propagating ready/valid backpressure. Arbitration advances on accepted output handshakes.

Network integration uses destination routing, link flow control and multi-hop traffic management around the crossbar.
