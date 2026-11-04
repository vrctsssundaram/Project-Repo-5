# Interface summary

| Signal | Meaning |
|---|---|
| `DATA_W` | Flit width, minimum 3, default 32 |
| `s_data[5*DATA_W-1:0]` | Five packed input flits |
| `s_valid[4:0], s_ready[4:0]` | Per-input transfer handshake |
| `m_data[5*DATA_W-1:0]` | Five packed output flits |
| `m_valid[4:0], m_ready[4:0]` | Per-output transfer handshake |
| `flit[DATA_W-1 -:3]` | Destination output ID, valid 0–4 |

No NoC throughput, latency, deadlock-freedom or area metric is claimed without multi-hop implementation and tests.
