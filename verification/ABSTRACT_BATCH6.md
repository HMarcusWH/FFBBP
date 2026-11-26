# Abstract mathematics — sixth formalization batch

Date: 2026-11-26 (Europe/Stockholm). Development branch only, based on [accepted Batch 5 reconciliation](https://github.com/HMarcusWH/FFBBP/commit/0685d17b47ea50aa6680900e87e9d250414d9426). The frozen 0.1.0-rc.1 edition remains unchanged.

## Scope and design

This batch introduces the reusable, dependency-light `FFBBP/Foundations/Structural.lean` module. It treats an observation law as an arbitrary value of a law type and an observation map as an arbitrary function. No measure-space construction, group-action implementation, stochastic-matrix semantics, private source or operational system is imported. All previous source statements and proof bodies are retained. The original Python suite is unchanged; the new universal logical propositions do not need artificial numerical-test coverage.

| Group | Candidate declaration in FFBBP.StructuralFoundations | Exact checked target and limitation |
| --- | --- | --- |
| M01.01 | m01_observationLawFactorization | Fiber constancy implies a factor through the primitive observation quotient, unique pointwise. The reverse implication is proved with an explicit premise that equal-law representatives have equal quotient classes. Function equality by extensionality, and discharge of the quotient-soundness premise using Lean's quotient axiom, are not asserted. |
| M03.01 | m03_orbitQuotientMap | For a law-preserving indexed family of transformations, orbit-related pairs have equal laws. Given observation-quotient soundness, construct a map from the primitive orbit quotient to the observation quotient and prove surjectivity. Given orbit-quotient soundness and exactness as additional explicit premises, prove injectivity iff all equal-law pairs are orbit-related. An actual group action is a specialization; group-action laws and discharge of the quotient premises are outside this check. |
| M08.03 | m08_logicalAlternatives | Exhaustivity and rejection of one proposition imply the other. Exclusivity alone does not suffice, and exclusive/exhaustive labels can coexist with overlapping propositions. No probabilistic or empirical claim is asserted. |
| M13.01 | m13_identifiedSetCharacterization | For arbitrary model, law and value types, characterize singleton membership predicates by compatibility plus fiber constancy, ambiguity by two compatible models with distinct values, and emptiness by incompatibility. Identified sets are not finite-sample confidence sets. |
| M14.03 | m14_coarseningInclusion | A common law transformation preserves compatibility and enlarges or preserves the identified set, for arbitrary types. This is not the distinct M14.01 total-variation contraction inequality. |

## Verification policy

Lean primitive quotient lifting and induction are used without invoking the global quotient-equality axiom. Where mathematical quotient equality is essential, the required soundness/exactness is a visible theorem hypothesis, not a hidden assumption or a claimed independently proved foundational result. This is deliberately conditional formalization of those quotient portions, not unconditional proof of all M01/M03 prose.

The strict zero-axiom policy remains in force for all 26 named declarations, with complete failure reporting and retained build/compiler evidence. The 21 previously accepted named statements, 15 Python methods, six previous executable/configuration inputs except for the root import/audit and workflow extension, dependency lockfile and frozen edition are preserved within the stated scope. No foundational allowlist or incomplete proof placeholder is introduced.

## Disposition

SUBMITTED; native compilation and named axiom verification pending. Current accepted inventory remains 20/40 groups (16 L+T, 4 L-only, 20 prose), 21 named declarations including the smoke theorem, and 15 Python tests. If all five candidates pass and are reconciled, 25/40 groups will have corresponding Lean evidence (16 L+T, 9 L-only, 15 prose); M01 adds one section with Lean evidence, for 14/17. Quotient premises and partial evidence scope must remain explicit when promoting these rows. No independent mathematical review, general probability-measure qualification, license decision or release authorization is granted.

## Observed acceptance and merge — 2026-11-26

**ACCEPTED — exact scoped propositions; strict zero-axiom gate passed.** [Hosted run 45851570214](https://github.com/HMarcusWH/FFBBP/actions/runs/45851570214) completed both jobs successfully on [candidate 0d1fe127f7163b480fe0afd9cd86364640e9b76f](https://github.com/HMarcusWH/FFBBP/commit/0d1fe127f7163b480fe0afd9cd86364640e9b76f). Lean job 140018992167: Lean 4.35.0 (eb6cafb7290e8bd5f2937522d8d804f58f02bafc), 161 successful build jobs, all 26 named reports explicitly axiom-free. Python job 140018992336: 15/15 methods passed under Python 3.14.4. No nonempty axiom report; no relaxation of the strict policy.

| Tested input | Git blob SHA |
| --- | --- |
| FFBBP.lean | 14790aefd832b7ccf4489d63c6768cef2335cc20 |
| FFBBP/Foundations/Structural.lean | eea2612c1545242c695249d6da2b517e42672f99 |
| .github/workflows/mathematics.yml | 6084f737e729ce507860a3557ce5de5649179196 |
| examples/abstract_counterexamples.py | cffe22b3175ba1c5636bd9feb90f86106cf81e70 |
| lake-manifest.json | d0d5afd6f802f8159255011089485e0806a64fc1 |
| lean-toolchain | a6aff065db2882c535684f8c5bcd4f16e9a23915 |
| lakefile.toml | 327357be180e0cfa63b36fe6e78ad8b1f45f7eb5 |

[Evidence artifact 15133427801](https://github.com/HMarcusWH/FFBBP/actions/runs/45851570214/artifacts/15133427801) was downloaded and independently rehashed: 2192 bytes; SHA-256 `127c960741e5e45e6017407d3f1b91213af93bdb354488fdada507dad7e98aa1` matches the provider digest. ZIP CRCs passed; exactly three expected members. The extracted manifest has nine package revisions and its Git blob matches the pinned lockfile. The compiler report has exactly 26 distinct expected axiom-free lines.

| Member | Bytes | SHA-256 |
| --- | ---: | --- |
| lake-manifest.json | 3123 | 4cf42be720e442c8476af0d94dccd7c9228e4abb569b64cd51d5edbd2dc2c79a |
| lean-smoke.log | 2022 | 30ee79f03ac81248efaeb657ed4f26d0819e64312bd7f3de827d2422eeef8f9e |
| lean-build.log | 2957 | 7638ffe2e03315443fefe934aa6b9944af141e6c9104e5b5b9bf375a654ce806 |

The exact extracted report is preserved at [BATCH6_AXIOM_REPORT.txt](evidence/BATCH6_AXIOM_REPORT.txt), Git blob `56f5ab4b96f09425234155d5aba1910181c692fc`, verified against the extracted bytes. The actual PR checkout 63b0c2a0df5bbe042c31c4918789727bcd09ea45, branch head 0d1fe127f7163b480fe0afd9cd86364640e9b76f, and [main merge 855f9c2f61d62ef0879cf169e6ec7f8a8dc41143](https://github.com/HMarcusWH/FFBBP/commit/855f9c2f61d62ef0879cf169e6ec7f8a8dc41143) all have identical Git tree `15366e6d8b300a26332abc101a263c53ab189f94`. [PR #2](https://github.com/HMarcusWH/FFBBP/pull/2) is merged. The seven tested source/configuration inputs and frozen RC1 edition are unchanged at merge.

Accepted inventory: 25/40 groups (16 L+T, 9 L-only, 15 prose); 14/17 sections with Lean evidence (11 also with Python evidence); 25 mathematical declarations plus smoke theorem. The quotient hypotheses are explicit and are not independently discharged. Independent mathematical review, general measure-theoretic formalization, library-wide auditing, and release authorization remain outside scope. Module-system and Node.js action-runtime migration warnings persist.


## Post-merge native replay — 2026-11-26

[Main push run 45855927304](https://github.com/HMarcusWH/FFBBP/actions/runs/45855927304), on merge commit 855f9c2f61d62ef0879cf169e6ec7f8a8dc41143, completed both jobs successfully. Lean job 140034156980: Lean 4.35.0, 161 successful build jobs and all 26 distinct expected named axiom-free reports, with no nonempty axiom reports. Python job 140034156582: 15/15 tests passed under Python 3.14.4.

[Evidence artifact 15137305186](https://github.com/HMarcusWH/FFBBP/actions/runs/45855927304/artifacts/15137305186) was downloaded and independently rehashed: 2192 bytes, SHA-256 `4d5f80a1b440ee1452ab6884d0ce8f330be08812e2cdc5f2280bac0fab6b9244` matches the provider digest. ZIP CRC verification passed; the three expected members are present. The manifest has nine pinned revisions, Git blob d0d5afd6f802f8159255011089485e0806a64fc1, and is byte-identical to the earlier Batch 6 archive's manifest. The compiler report is byte-identical to the retained [BATCH6_AXIOM_REPORT.txt](evidence/BATCH6_AXIOM_REPORT.txt), Git blob 56f5ab4b96f09425234155d5aba1910181c692fc. The build log records successful completion of 161 jobs.

| Member | Bytes | SHA-256 |
| --- | ---: | --- |
| lake-manifest.json | 3123 | 4cf42be720e442c8476af0d94dccd7c9228e4abb569b64cd51d5edbd2dc2c79a |
| lean-smoke.log | 2022 | 30ee79f03ac81248efaeb657ed4f26d0819e64312bd7f3de827d2422eeef8f9e |
| lean-build.log | 2956 | 9b7ad94f981d113afa214c189dd8948f2f3a224b4c25771aa32455d2decd5073 |

This closes the outstanding Batch 6 main replay. It is repeat hosted verification, not independent third-party reproduction. No theorem, executable input, lockfile, frozen edition or accepted inventory changed. Batch 7 must still pass its own strict acceptance gates before merge.
