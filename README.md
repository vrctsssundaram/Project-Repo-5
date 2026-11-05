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

**Architecture:** Five-port single-flit crossbar with per-output round-robin arbitration and ready/valid flow control.

Project owner: Sundaram S S.
