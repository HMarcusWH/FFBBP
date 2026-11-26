# Research status

**26 November 2026 — Batch 6 accepted and merged; structural foundations and evidence reconciled.**

| Area | Status |
| --- | --- |
| Public research repository | Documentation and standalone abstract examples |
| Historical M01–M17 supplementary notes | [14 candidate documents inventoried](archive-index/RESEARCH_INVENTORY.md); not imported or independently reviewed here |
| Publication review | [Scoped content review complete](governance/PUBLICATION_REVIEW.md); originals held, public abstract exposition eligible; rights not independently cleared |
| Public mathematics | [M01–M17 exposition](mathematics/FOUNDATIONS.md) published; twenty-five accepted declarations across fourteen sections; exact fixed-example, finite-count and structural scope |
| Executable examples | [Fifteen test methods](examples/abstract_counterexamples.py) passed hosted CI under Python 3.14.4; Git blob cffe22b3175ba1c5636bd9feb90f86106cf81e70 matches tested merge tree; independent review not performed |
| Lean 4 project | [Toolchain v4.35.0](lean-toolchain) and [Mathlib v4.35.0](lakefile.toml) configured; four source files matched local Git blob hashes and five static checks passed |
| Resolved Lake dependency manifest | [CI-generated manifest](lake-manifest.json) committed; nine exact package revisions; [locked-checkout rerun](https://github.com/HMarcusWH/FFBBP/actions/runs/45699559058) passed both jobs |
| Lean bootstrap smoke test | [Hosted CI passed](https://github.com/HMarcusWH/FFBBP/actions/runs/45699117744); one arithmetic smoke theorem, no axiom dependencies |
| Automated checks | [G07 evidence receipt](verification/G07_BOOTSTRAP_RECEIPT.md): both hosted jobs passed |
| Kernel-checked proofs in this repository | One arithmetic smoke theorem and twenty-five scoped mathematical declarations; [Batch 6 CI](https://github.com/HMarcusWH/FFBBP/actions/runs/45851570214) passed all twenty-six named zero-axiom checks |
| Additional fixed-example proofs | [Batch 2 register](verification/ABSTRACT_BATCH2.md): M02.03, M05.01 and M16.02 passed compilation and automated named axiom checks; downloaded artifact and lockfile verified |
| Batch 3 fixed-example proofs | [Batch 3 register](verification/ABSTRACT_BATCH3.md): M03.02, M04.02, M06.02 and M16.03 passed compilation and twelve-declaration axiom verification; downloaded evidence and lockfile verified |
| Batch 4 candidates | [Batch 4 R1 acceptance](verification/ABSTRACT_BATCH4.md): original gate failed (13/16 axiom-free); repaired statements compiled, 16/16 axiom-free, 10 Python methods passed, downloaded artifact and lockfile verified |
| Batch 4 R1 repair | [R1 native run](https://github.com/HMarcusWH/FFBBP/actions/runs/45841263893) passed; three proof bodies repaired without statement changes or policy relaxation |
| Batch 5 R1 repair | [Batch 5 R1 acceptance](verification/ABSTRACT_BATCH5.md): original gate failed (14/21 axiom-free); repaired 21/21 passed, 15 Python methods passed, evidence verified; [PR #1](https://github.com/HMarcusWH/FFBBP/pull/1) merged at f95e12cec70bed68f15abeb900d66f4feac34715 |
| Batch 6 structural candidates | [Batch 6 acceptance](verification/ABSTRACT_BATCH6.md): five generic structural propositions, 26/26 axiom-free reports, 161 successful build jobs, 15 Python methods passed; downloaded archive and lockfile verified; [PR #2](https://github.com/HMarcusWH/FFBBP/pull/2) merged at 855f9c2f61d62ef0879cf169e6ec7f8a8dc41143; explicit quotient premises retained |
| Abstract formalization scope | [G08 R1 proof register](verification/G08_R1_PROOF_REGISTER.md) and Batches 2–6: fixed examples, parameterized finite-count/rational-grid results and generic structural propositions. Quotient equality premises and pointwise uniqueness are explicit; not full real-valued or measure-theoretic formalization |
| Claim reconciliation | [G11 register](verification/G11_CLAIM_RECONCILIATION.md): historical G11 baseline retained; fourteen sections with Lean evidence, eleven also with Python evidence; three prose/synthesis only |
| Statement-level inventory | [Abstract statement inventory](verification/ABSTRACT_STATEMENT_INVENTORY.md): 40 editorial groups; 16 L+T, 9 L-only, 0 T-only, 15 prose/logical discussion; 25/40 corresponding Lean evidence; partial scopes retained |
| Internal theorem-statement and named-axiom review | [G09 assurance](verification/G09_PROOF_ASSURANCE.md) historical review; all 26 named reports verified in Batch 6; previous 21 declarations preserved; no library-wide audit |
| Reproducibility | [G10 assessment](verification/G10_REPRODUCIBILITY.md) historical baseline; Batch 4/5 R1 evidence archives independently rehashed, CRCs checked, lockfile matched and complete named reports inspected; PR checkout, branch head and actual merge tree identical; [post-merge native replay](https://github.com/HMarcusWH/FFBBP/actions/runs/45844288923) passed 21 named reports and 15 Python tests, downloaded archive rehashed; manifest and compiler report byte-identical to PR run; durable exact compiler reports retained in the Batch 4/5 registers; Batch 6 evidence archive independently rehashed, CRCs and lockfile checked, exact 26-report log preserved, tested PR and merge trees identical |
| Independent third-party reproduction, theorem-statement review and library-wide axiom audit | Not performed |
| Versioned abstract mathematics edition | [0.1.0-rc.1 candidate](editions/ABSTRACT_MATH_0.1.0_RC1.md); 19-file pinned baseline, six executable/build inputs match successful CI; scoped review complete, no GitHub Release or tag created |
| General mathematical and scientific qualification | Not established |
| Operational or full release | Not authorized |

The supplementary series explains established mathematical limitations and does not resolve the original numbered mathematical obligations. Historical regression results and archival checks are not proof or independent empirical qualification. This acceptance is limited to the exact named public mathematical declarations and corresponding executed examples. It does not grant acceptance of original project-specific obligations, independent scientific qualification or deployment.
