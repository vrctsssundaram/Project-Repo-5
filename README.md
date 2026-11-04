# FlitMesh-5

Five-input/five-output single-flit crossbar with destination routing.

## Features

- Packed destination address in each flit
- Per-output round-robin arbitration
- Ready/valid backpressure

## Run

```sh
make test
make synth
```

Design sources are in `rtl/`, directed tests in `tb/`, and interface, architecture, testing and measured results in `docs/`.

**Scope:** No buffering, virtual channels, retry, routing tables or credit-based network protocol.

Project owner: Sundaram S S.
