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
