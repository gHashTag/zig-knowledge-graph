# zig-knowledge-graph

> Knowledge Graph server + CLI for Trinity. Zig implementation of RDF storage and SPARQL query engine.

Extracted from [Trinity](https://github.com/gHashTag/trinity) monolith for independent development and reuse.

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
zig-out/bin/kg-server

# Query from CLI
./zig-out/bin/kg-cli "SELECT ?s ?p ?o WHERE { ?s ?p ?o }"
```

## Architecture

```
┌─────────────────────────────────────────┐
│         Knowledge Graph Core            │
├─────────────────────────────────────────┤
│  knowledge_graph.zig  (26KB)            │
│  - RDF triples storage                  │
│  - Index management                     │
│  - Pattern matching                     │
├─────────────────────────────────────────┤
│  kg_server.zig  (57KB)                  │
│  - HTTP API                             │
│  - Query processing                     │
│  - Transaction management               │
├─────────────────────────────────────────┤
│  kg_cli.zig  (19KB)                     │
│  - Interactive shell                    │
│  - Batch queries                        │
│  - Import/export                        │
└─────────────────────────────────────────┘
```

## Dependencies

- [zig-golden-float](https://github.com/gHashTag/zig-golden-float) — Numerical kernel

## License

MIT License — see [LICENSE](LICENSE) file.

## Related

- [Trinity](https://github.com/gHashTag/trinity) — Main framework
- [zig-golden-float](https://github.com/gHashTag/zig-golden-float) — Numerical kernel
