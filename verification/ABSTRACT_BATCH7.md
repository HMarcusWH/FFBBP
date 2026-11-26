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
