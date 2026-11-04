# Technical design

Five inputs compete for five outputs. Each input requests exactly one output based on the high three bits of its flit. Each output maintains a rotating starting priority and grants at most one input. The output's ready signal is returned only to the granted source.

There is no internal flit buffering, routing-table lookup, virtual channel or multi-hop arbitration. A stalled destination can backpressure the requesting source. Arbitration priority advances only after a valid output handshake.

Integration into a deadlock-free NoC requires input buffering, destination routing policy, link protocol, traffic isolation and network-level liveness analysis.
