# FlitMesh-5

Five-port unicast flit crossbar with per-destination round-robin arbitration.

Every 32-bit input flit carries a three-bit destination in its most significant bits (0–4). Valid/ready handshakes route eligible flits to independent output ports. Requests to the same output are served round-robin.

This is the combinational switching and arbitration building block of a network-on-chip, not a complete multi-hop mesh router. Run `make test` for the self-checking regression.

Project owner: Sundaram S S.
