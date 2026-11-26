# Research status

**26 November 2026 — Post-edition Batch 4 submitted; Batch 3 remains the accepted baseline.**

| Area | Status |
| --- | --- |
| Public research repository | Documentation and standalone abstract examples |
| Historical M01–M17 supplementary notes | [14 candidate documents inventoried](archive-index/RESEARCH_INVENTORY.md); not imported or independently reviewed here |
| Publication review | [Scoped content review complete](governance/PUBLICATION_REVIEW.md); originals held, public abstract exposition eligible; rights not independently cleared |
| Public mathematics | [M01–M17 exposition](mathematics/FOUNDATIONS.md) published; eleven fixed-example declarations kernel checked across eight sections; general results remain outside this check |
| Executable examples | [Six fixed counterexamples](examples/abstract_counterexamples.py), six local tests passed under Python 3.13.5; Git blob 58d2fb52adae863b5cdcb16f7428f31493670d4a matched tested file; six hosted CI tests also passed under Python 3.14.4; independent review not performed |
| Lean 4 project | [Toolchain v4.35.0](lean-toolchain) and [Mathlib v4.35.0](lakefile.toml) configured; four source files matched local Git blob hashes and five static checks passed |
| Resolved Lake dependency manifest | [CI-generated manifest](lake-manifest.json) committed; nine exact package revisions; [locked-checkout rerun](https://github.com/HMarcusWH/FFBBP/actions/runs/45699559058) passed both jobs |
| Lean bootstrap smoke test | [Hosted CI passed](https://github.com/HMarcusWH/FFBBP/actions/runs/45699117744); one arithmetic smoke theorem, no axiom dependencies |
| Automated checks | [G07 evidence receipt](verification/G07_BOOTSTRAP_RECEIPT.md): both hosted jobs passed |
| Kernel-checked proofs in this repository | One arithmetic smoke theorem and eleven fixed-example declarations accepted by [Batch 3 CI](https://github.com/HMarcusWH/FFBBP/actions/runs/45723822800); all twelve individually reported axiom-free |
| Additional fixed-example proofs | [Batch 2 register](verification/ABSTRACT_BATCH2.md): M02.03, M05.01 and M16.02 passed compilation and automated named axiom checks; downloaded artifact and lockfile verified |
| Batch 3 fixed-example proofs | [Batch 3 register](verification/ABSTRACT_BATCH3.md): M03.02, M04.02, M06.02 and M16.03 passed compilation and twelve-declaration axiom verification; downloaded evidence and lockfile verified |
| Batch 4 candidates | [Batch 4 register](verification/ABSTRACT_BATCH4.md): M09.01, M09.02, M05.03 and M11.01 submitted; compilation and sixteen named axiom-free reports pending. Ten Python test methods passed local Python 3.13.5 on the Git-blob-matched source; [hosted Batch 4 run](https://github.com/HMarcusWH/FFBBP/actions/runs/45818203518) observed queued. Accepted counts remain at Batch 3. |
| Abstract formalization scope | [G08 R1 proof register](verification/G08_R1_PROOF_REGISTER.md); initial fixed examples M04, M08, M14, M16; Batch 2 adds M02, M05 and an additional M16 example; Batch 3 adds examples in M03, M04, M06 and M16 |
| Claim reconciliation | [G11 register](verification/G11_CLAIM_RECONCILIATION.md): historical G11 coverage retained; current coverage is eight sections with Lean-checked fixed examples, six of which also have Python checks; nine prose/synthesis only |
| Statement-level inventory | [Abstract statement inventory](verification/ABSTRACT_STATEMENT_INVENTORY.md): 40 editorially grouped public claims/examples; 7 with Lean and Python evidence, 4 with Lean evidence only, 0 with Python evidence only, 29 prose/logical discussion; exact grouped-claim scope retained |
| Internal theorem-statement and named-axiom review | [G09 assurance](verification/G09_PROOF_ASSURANCE.md): initial five named reports and evidence archive verified; Batch 3 automated verification covers twelve named declarations |
| Reproducibility | [G10 assessment](verification/G10_REPRODUCIBILITY.md): two hosted builds passed, five source/configuration blobs matched across both runs and main, both evidence members byte-identical |
| Independent third-party reproduction, theorem-statement review and library-wide axiom audit | Not performed |
| Versioned abstract mathematics edition | [0.1.0-rc.1 candidate](editions/ABSTRACT_MATH_0.1.0_RC1.md); 19-file pinned baseline, six executable/build inputs match successful CI; scoped review complete, no GitHub Release or tag created |
| General mathematical and scientific qualification | Not established |
| Operational or full release | Not authorized |

The supplementary series explains established mathematical limitations and does not resolve the original numbered mathematical obligations. Historical regression results and archival checks are not proof or independent empirical qualification. No new acceptance is granted by this bootstrap.
