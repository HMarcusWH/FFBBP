# Abstract mathematics — seventh formalization batch

Date: 2026-11-26 (Europe/Stockholm). Development branch from [accepted Batch 6 reconciliation](https://github.com/HMarcusWH/FFBBP/commit/7d35353c6379c75eb676f0885d5dd05b4bc61361). Its PR tree was verified and merged; the additional main replay 45855927304 was observed queued at preparation. No new edition, license or operational scope.

## Frozen scope

A new reusable module `FFBBP/Foundations/FiniteProbability.lean` contains constructive natural-number arithmetic and finite probability count representations. Proven earlier arithmetic helper bodies are reused privately in the new namespace so the accepted source is not refactored in the same batch. The strict policy remains empty named axiom dependency sets. There are no new global axioms or tactic-based assumptions.

| Group | Candidate in FFBBP.FiniteProbability | Precise proposition and limitation |
| --- | --- | --- |
| M01.02 | m01_priorOddsCounts | For arbitrary positive prior counts and common positive likelihood count, updated weights and normalizer are positive, the normalizer factors, and prior/posterior odds agree by cross multiplication. General almost-sure Bayes factor and continuous likelihood versions remain prose. |
| M01.03 | m01_squaredRiskLowerBound | For arbitrary finite lists of nonnegative estimate coordinates and integer masses with positive total, a common-law weighted risk numerator times four in at least one model dominates total mass times squared endpoint gap. Common rational scaling gives the stated finite rational squared-risk bound. General real-valued estimators/expectations remain prose. |
| M06.01 | m06_totalVarianceNumerators | For finite lists of raw and group-mean squared moment numerators in common units with ordered group moments, a positive common denominator and grand squared-mean numerator no greater than the summed group means, prove exact total = within + between numerator decomposition. The moments and their order are explicit input premises; actual conditional expectation construction, mean constraints, Jensen inequalities and the general conditional identity remain outside this Lean proof. |
| M08.02 | m08_intersectionBounds | Arbitrary four nonnegative event-cell masses with positive total give the exact lower truncated-subtraction bound and both upper intersection bounds. Rational finite cell normalization is external; general probability measures are not formalized. |
| M10.01 | m10_midpointSharpness | For all natural coordinates a,b, the midpoint a+b on the doubled grid has distance equal to the original gap from both doubled endpoints and hence equal squared numerators, giving sharp factor one quarter after scaling. Arbitrary real estimates and expectation construction remain prose. |
| M14.01 | m14_finiteTVContraction | For arbitrary finite nonnegative integer channel rows with common positive row total, output pair vectors are obtained by coordinatewise summation of weighted input masses (zero-padding shorter rows). Their L1 numerator is at most the row denominator times input L1. The statement proves the contraction even without imposing input normalization; with common rational input mass and row denominator it gives finite rational TV contraction. Real-valued stochastic matrices and general channels remain prose. |

Six additional Python exact Fraction methods independently check finite prior odds, two-point weighted risk bounds, a nontrivial finite total-variance example, four-cell intersection bounds, midpoint sharpness and deterministic seeded finite stochastic matrices including a zero-weight case. Finite numerical checks are not general proofs. All fifteen existing methods and their source are retained.

## Gate

SUBMITTED — native compilation and all 32 strict named axiom-free reports pending. All 26 previously accepted statements and proof bodies remain unchanged; the root imports and audit list are extended. Dependency pins, manifest, structural module and frozen candidate edition remain unchanged. The accepted inventory is 25/40 (16 L+T, 9 L-only, 15 P). If the six candidates and evidence pass, 31/40 groups will have corresponding Lean evidence (22 L+T, 9 L-only, 9 P). M10 adds one section for 15/17 with Lean evidence. All partial scopes must remain visible when promoting the rows.

Independent review, library-wide axiom auditing and the remaining full probability-measure/real-valued results remain open. No operational, original project-specific or scientific qualification is granted.

## R1 minimal compiler repair — 2026-11-26

[Initial run 45856893466](https://github.com/HMarcusWH/FFBBP/actions/runs/45856893466) passed all 21 Python methods (job 140037523737, Python 3.14.4). Lean job 140037524154 failed building FiniteProbability.lean at line 289:4 with the sole reported error "No goals to be solved". The 32-name audit was skipped. Failed-build evidence was uploaded as artifact 15135828676 (1472 bytes, provider SHA-256 `6089540fd53f28a53cec10710ebaee8dc2205a3699088f29218e2d3ce331a4c5`). This records the observed provider metadata, not an independent archive rehash.

R1 removes only the redundant `exact Nat.zero_le _` instruction from the nil case of riskSumBound; the preceding rewrite already closed the goal. Original candidate source blob b7502ff01e35ef984a578ee841a9394e8c360020; all six public propositions, other proof terms, prior 26 declarations, 21 Python methods, required named reports, lockfile and frozen edition remain unchanged. No axiom exception or theorem weakening. Native verification remains pending at submission.

The [Batch 6 main replay](https://github.com/HMarcusWH/FFBBP/actions/runs/45855927304) has now passed both jobs, 161 build jobs, 26 exact axiom-free reports and 15 Python methods. The Batch 6 replay is no longer a merge blocker. R1 must still pass compilation, all 32 strict reports, Python regression and evidence review before merge.

## Observed R1 acceptance and merge — 2026-11-27

**ACCEPTED — exact scoped propositions; strict zero-axiom gate passed.** [Run 45866629292](https://github.com/HMarcusWH/FFBBP/actions/runs/45866629292) on R1 head f0c2c5c4e7ab7e31fc0f2cae31efe986a922adc8 completed both jobs. Lean job 140071005959: Lean 4.35.0, 162 successful build jobs, all 32 distinct named axiom-free reports. Python job 140071005425: 21/21 passed under Python 3.14.4. No nonempty axiom reports. No statement weakening or policy exception.

| Tested input | Git blob SHA |
| --- | --- |
| FFBBP.lean | ebbbfe2901c093531bb31649050f20c666d90d1d |
| FFBBP/Foundations/Structural.lean | eea2612c1545242c695249d6da2b517e42672f99 |
| FFBBP/Foundations/FiniteProbability.lean | 64abcc74f2d279b0d0017595b8042046a0a22cf9 |
| .github/workflows/mathematics.yml | cb35d844a4df6c51a4aedd5bcfece3d7addbb083 |
| examples/abstract_counterexamples.py | 4fca527f3e48bba1017194fcfc00726ae9af90d6 |
| lake-manifest.json | d0d5afd6f802f8159255011089485e0806a64fc1 |
| lean-toolchain | a6aff065db2882c535684f8c5bcd4f16e9a23915 |
| lakefile.toml | 327357be180e0cfa63b36fe6e78ad8b1f45f7eb5 |

[Evidence artifact 15141308920](https://github.com/HMarcusWH/FFBBP/actions/runs/45866629292/artifacts/15141308920) downloaded in this reconciliation; 2431 bytes, SHA-256 `bfe95c9523176693e67d8047e3724fc24f89423b1e2c296e03ca8213c5e1b30f` independently recomputed and matches provider. ZIP CRC checks passed; all three expected members present. Manifest contains nine pinned revisions and independently recomputed Git blob matches the lockfile.

| Member | Bytes | SHA-256 |
| --- | ---: | --- |
| lake-manifest.json | 3123 | 4cf42be720e442c8476af0d94dccd7c9228e4abb569b64cd51d5edbd2dc2c79a |
| lean-smoke.log | 2501 | 283fd9d718ca11d59ae3819934fffe5a8789935591ec4a95c84b1be6da0d0d4e |
| lean-build.log | 3852 | b0a848e5dfdad1490f24010e1019e76e43ae7ddcd7564ca37c59de87852f275e |

Exact extracted report preserved at [BATCH7_R1_AXIOM_REPORT.txt](evidence/BATCH7_R1_AXIOM_REPORT.txt), Git blob `21f09b530c97e476036640db428d291cebf9f62a`, matched to the extracted bytes. Tested PR checkout 61b3f0d0c27e5ffecd17b04b3d342407adfdac0f and R1 head f0c2c5c4e7ab7e31fc0f2cae31efe986a922adc8 share tree `06f32c6c0aab2a631f12a2f0a0ff8efa81053966`. [PR #3](https://github.com/HMarcusWH/FFBBP/pull/3) merged at [b4b4c9b2d9ce4f1beac174960e557fcd046b57f0](https://github.com/HMarcusWH/FFBBP/commit/b4b4c9b2d9ce4f1beac174960e557fcd046b57f0); comparison to the tested PR checkout shows only verification/ABSTRACT_BATCH6.md changed, preserving the intervening documentation-only replay record. All executable inputs match the tested source. Main push replay is a separate subsequent check.

Accepted inventory: 31/40 (22 L+T, 9 L-only, 9 P), fifteen sections with Lean evidence, fourteen with Python evidence. All finite-count, quotient and conditional-moment limitations above remain. The frozen RC1 edition is unchanged. Independent review, general measure-theoretic formalization, maintenance migrations and release authorization remain outside this acceptance.
