# Abstract mathematics — fourth formalization batch

Date: 2026-11-26 (Europe/Stockholm). Post-edition work on current main; the pinned 0.1.0-rc.1 edition is unchanged.

## Frozen targets and exact scope

The accepted parent is [Batch 3 reconciliation](https://github.com/HMarcusWH/FFBBP/commit/3a6fb817a040e07f3e5826653426bb51e84bbc57). The four targets are public statement groups already listed in the [statement inventory](ABSTRACT_STATEMENT_INVENTORY.md). They do not introduce new project-specific mathematical obligations.

| Group | Candidate declaration in FFBBP.AbstractExamples | Precise proposition |
| --- | --- | --- |
| M09.01 | m09_observationalAgreement | The two Boolean worlds agree at false, their sole observed input, and disagree at true. |
| M09.02 | m09_worstCaseError | For every positive natural denominator d and numerator 0 <= r <= d, the risk numerators r and d-r sum to d and at least one doubled numerator is >= d. This covers every rational prediction probability; extension to arbitrary real probabilities is not kernel checked here. |
| M05.03 | m05_conditioningAmplification | For arbitrary integers 0 < e < d, the two specified three-element count vectors each sum to d, have L1 numerator 2e, and restrict to disjoint two-element vectors of mass e, with L1 numerator 2e. These give full TV e/d and conditional TV one under the finite normalized-count interpretation. No general conditional probability or measure-theoretic result is claimed. |
| M11.01 | m11_bernoulliSeparation | For positive natural t with 2t <= m, the common denominator 2m is positive, both binary vectors sum to 2m, their first-coordinate counts lie on opposite sides of m, the vectors differ, and their L1 numerator is 4t. This covers the rational separations t/(2m) in (0,1/4]; real-valued probability-law and minimax results remain outside the formal scope. |

Three definitions express finite count distances; no integer-dividing probability normalization or unverified probability oracle is introduced. Existing twelve named declarations remain intact. The revised workflow requires sixteen exact axiom-free reports. The toolchain and dependency lockfile are unchanged. The four new Python methods independently check the Boolean example and finite grids of normalized exact Fraction values (not general proofs); the six existing methods are unchanged.

## Verification status

SUBMITTED — compilation, axiom audit and Python regression pending. No new proof acceptance is granted by this record before completed CI inspection and source/evidence reconciliation. Current accepted evidence remains eleven example declarations plus one smoke theorem; 11/40 grouped statements have corresponding Lean evidence.

If the four candidates pass and are reconciled, 15/40 groups will have corresponding Lean evidence, including parameterized finite-count results. This is statement-group coverage, not proof of all interpretations or full mathematical completion. Independent reproduction, independent statement review, library-wide axiom audit and licensing remain outstanding. No private materials, operational implementation, release tag or new edition are included.
