# Research status

**25 November 2026 — G07 initial continuous-integration run.**

| Area | Status |
| --- | --- |
| Public research repository | Documentation and standalone abstract examples |
| Historical M01–M17 supplementary notes | [14 candidate documents inventoried](archive-index/RESEARCH_INVENTORY.md); not imported or independently reviewed here |
| Publication review | [Scoped content review complete](governance/PUBLICATION_REVIEW.md); originals held, public abstract exposition eligible; rights not independently cleared |
| Public mathematics | [M01–M17 exposition](mathematics/FOUNDATIONS.md) published; not kernel checked |
| Executable examples | [Six fixed counterexamples](examples/abstract_counterexamples.py), six local tests passed under Python 3.13.5; Git blob 58d2fb52adae863b5cdcb16f7428f31493670d4a matched tested file; six hosted CI tests also passed under Python 3.14.4; independent review not performed |
| Lean 4 project | [Toolchain v4.35.0](lean-toolchain) and [Mathlib v4.35.0](lakefile.toml) configured; four source files matched local Git blob hashes and five static checks passed |
| Resolved Lake dependency manifest | Initial resolution in progress; no generated lockfile accepted yet |
| Lean bootstrap smoke test | [CI run](https://github.com/HMarcusWH/FFBBP/actions/runs/45699117744) started; toolchain installation completed; compilation and axiom-report acceptance pending |
| Automated checks | [Workflow](.github/workflows/mathematics.yml) committed; hosted Python job passed (6/6); Lean job in progress at this observation |
| Kernel-checked proofs in this repository | None |
| Independent theorem-statement and axiom review | Not performed |
| General mathematical and scientific qualification | Not established |
| Operational or full release | Not authorized |

The supplementary series explains established mathematical limitations and does not resolve the original numbered mathematical obligations. Historical regression results and archival checks are not proof or independent empirical qualification. No new acceptance is granted by this bootstrap.
