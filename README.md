# zig-knowledge-graph

> Knowledge Graph server + CLI for Trinity. Part of the **[Trinity Ecosystem](https://github.com/gHashTag/trinity)** — independent Zig libraries for modular development.

## Overview

| # | Repository | Status | Description |
|---|---|---|---|
| 1 | [zig-olden-float](https://github.com/gHashTag/zig-olden-float) | 🟢 Live | Numerical core: GF16, TF3, VSA, JIT |
| 2 | [trinity-training](https://github.com/gHashTag/trinity-training) | 🟢 Live | ML training: HSLM, benchmarks, datasets |
| 3 | [zig-hdc](https://github.com/gHashTag/zig-hdc) | 🟡 Plan | VSA, HRR, hyperdimensional computing |
| 4 | [zig-sacred-geometry](https://github.com/gHashTag/zig-sacred-geometry) | 🟡 Plan | φ-attention, Beal algebras, sacred constants |
| 5 | [zig-physics](https://github.com/gHashTag/zig-physics) | 🟢 Live | Quantum, QCD, gravity, dark matter, baryogenesis |
| 6 | [zig-knowledge-graph](https://github.com/gHashTag/zig-knowledge-graph) | 🟢 Live | **← THIS REPO** | KG server + CLI |
| 7 | [zig-crypto-mining](https://github.com/gHashTag/zig-crypto-mining) | 🟢 Live | BTC mining + DePIN protocol |
| 8 | [zig-agents](https://github.com/gHashTag/zig-agents) | 🟡 Plan | MCP, autonomous agents, orchestration |
| 9 | [trinity](https://github.com/gHashTag/trinity) | 🟢 Live | Orchestrator, API, MCP server |

## Features

- **RDF Storage** — Triple-based knowledge representation (subject-predicate-object)
- **SPARQL Query Engine** — Pattern matching, joins, filters
- **HTTP Server** — REST API for KG operations
- **CLI** — Command-line interface for management

## Quick Start

```bash
# Build
zig build

# Run server
./zig-out/bin/kg-server

# Query from CLI
./zig-out/bin/kg-cli "SELECT ?s ?p ?o WHERE { ?s ?p ?o }"
```

## Architecture

```
┌─────────────────────────────────┐
│         Knowledge Graph Core            │
├─────────────────────────────────┤
│  knowledge_graph.zig  (26KB)            │
│  - RDF triples storage                  │
│  - Index management                     │
│  - Pattern matching                     │
├─────────────────────────────────┤
│  kg_server.zig  (57KB)                  │
│  - HTTP API                             │
│  - Query processing                     │
│  - Transaction management               │
├─────────────────────────────────┤
│  kg_cli.zig  (19KB)                     │
│  - Interactive shell                    │
│  - Batch queries                        │
│  - Import/export                        │
└─────────────────────────────────┘
```

## Dependencies

- [zig-olden-float](https://github.com/gHashTag/zig-olden-float) — Numerical kernel (v2.0.0 legacy)
- [Trinity](https://github.com/gHashTag/trinity) — Main framework

## License

MIT License — see [LICENSE](LICENSE) file.

## Related

- [Trinity](https://github.com/gHashTag/trinity) — Main framework
- [zig-olden-float](https://github.com/gHashTag/zig-olden-float) — Numerical kernel
