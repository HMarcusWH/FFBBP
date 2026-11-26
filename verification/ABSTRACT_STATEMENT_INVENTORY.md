# Public abstract mathematics — statement inventory

Updated: 2026-11-26. Companion to the [G11 section-level reconciliation](G11_CLAIM_RECONCILIATION.md) and [0.1.0-rc.1 candidate edition](../editions/ABSTRACT_MATH_0.1.0_RC1.md). This is a post-edition documentation register; the pinned candidate source baseline is unchanged.

## Scope and evidence

The public foundations exposition, Lean source, Python test source, G11 reconciliation and research status were directly inspected. Source identities (foundations refers to the reviewed pre-reconciliation exposition; executable inputs refer to the tested Batch 5 R1 tree):

- `mathematics/FOUNDATIONS.md`: `2595d4ad8f865b6338bb67ee4cc8babc6525d48d`
- `FFBBP.lean`: `7bb4c3704283f645c794f5da4ae078cb52f672db`
- `examples/abstract_counterexamples.py`: `cffe22b3175ba1c5636bd9feb90f86106cf81e70`

Existing verification evidence: [G08 R1 proof register](G08_R1_PROOF_REGISTER.md), [G09 named statement review](G09_PROOF_ASSURANCE.md), [G10 hosted reproducibility](G10_REPRODUCIBILITY.md). [Batch 2 acceptance](ABSTRACT_BATCH2.md) adds three checked fixed-example declarations. [Batch 3 acceptance](ABSTRACT_BATCH3.md) adds four further fixed-example declarations. [Batch 4 R1 acceptance](ABSTRACT_BATCH4.md) adds four declarations and four test methods; [Batch 5 R1 acceptance](ABSTRACT_BATCH5.md) adds five declarations and five test methods. This inventory records the observed builds; it does not itself launch a new compiler run or establish independent review.

The identifier Mxx.yy denotes a grouped statement or example in the public exposition only. These identifiers are newly assigned for documentary traceability; they do not extend or replace the original project's numbered mathematical obligations. The grouping is editorial, not a canonical theorem decomposition. Definitions, implications, bounds and fixed examples may share a row. The inventory does not assert completeness at the level of individual logical formulas.

Evidence categories:

- P: public mathematical prose or logical discussion; no matching accepted executable/formal check established in this repository.
- T: example or finite-grid check with some matching Python assertions in previously successful runs; not a general theorem.
- L: statement group with a corresponding accepted Lean declaration but without a dedicated Python assertion covering that group. Probability interpretations remain prose.
- L+T: statement group with a corresponding accepted Lean declaration and Python assertions (including parameterized finite-count propositions and bounded numerical witnesses). Only the precise declared Lean proposition is kernel checked. Probability interpretations and other prose claims are not automatically formalized.

## Statement register

| ID | Kind | Existing public claim (summary) | Evidence | Verified portion / limitation |
| --- | --- | --- | --- | --- |
| M01.01 | Definition / proposition | Identifiability as constancy on observation-law fibers; equivalent unique factorization through the quotient. | P | No corresponding declaration or test. |
| M01.02 | Probability proposition | Equal observation laws preserve prior odds between two positively weighted simple hypotheses. | P | Prose result under the stated common-law assumptions. |
| M01.03 | Lower bound | Two-point squared-error lower bound under identical observation laws. | P | Prose proof; no accepted Lean declaration. |
| M02.01 | Probability proposition | Agreement at a longer finite prefix implies agreement at a shorter prefix. | P | Marginalization argument in prose. |
| M02.02 | Measure-theoretic proposition | All finite prefix laws determine the law on the sequence product sigma-algebra. | P | Cylinder uniqueness argument in prose. |
| M02.03 | Fixed counterexample | Independent fair symbols versus a uniformly phased repeating 0011 word: agreement at lengths one and two, disagreement at length three. | L+T | m02_prefixCounts verifies the fixed periodic-phase enumeration and triple counts; Python test_m02_finite_horizon_agreement checks the corresponding example. Equal-weight probability interpretation remains prose. |
| M02.04 | Conditional-law proposition | Identical history/future joint law gives almost-sure agreement of regular conditional future laws under the stated uniqueness assumptions. | P | Null histories expressly excluded from a pointwise assertion. |
| M03.01 | Quotient proposition | Law-preserving group orbits lie inside observable-law fibers; the map between quotients is surjective, with the stated condition for injectivity. | P | Prose only. |
| M03.02 | Fixed counterexample | The two independent Bernoulli parameter pairs have equal parity probabilities but different products and are not swaps. | L | m03_coinParityCounts verifies fixed parity and product numerators and inequality under exchange; probability interpretation remains prose. |
| M04.01 | Fixed counterexample | Specified three-state deterministic example admits no commuting reduced map. | L+T | m04_noReducedMap; Python test_m04_present_statistic_is_not_future_law checks the conflicting reduced successors. No general stochastic closure theorem. |
| M04.02 | Fixed counterexample | Identical binary marginals with different joint laws and covariances in the U,V example. | L | m04_binaryMarginalCounts checks marginal lists, equality counts and signed centered-product sums. Equal weighting and covariance normalization remain prose. |
| M05.01 | Fixed counterexample | Equal means with total variation distance one for the stated point-mass and two-point mixture. | L+T | m05_equalMeanCounts verifies fixed mass, first-moment and L1 numerators. Python test_m05_equal_means_do_not_imply_equal_laws checks normalization, means and TV. No general probability theorem. |
| M05.02 | Metric counterexample | Weak and Wasserstein convergence of the stated point masses without TV convergence or absolute continuity. | P | Prose only; not covered by M05.01. |
| M05.03 | Conditional counterexample | Small unconditional TV in the stated three-element experiment, but conditional TV one. | L+T | m05_conditioningAmplification proves positive rational-grid event mass, normalization and full/conditional L1 count identities; test_m05_conditioning_amplification checks exact Fraction TV and conditional laws. General real and measure-theoretic conditioning remains prose. |
| M05.04 | Horizon counterexample | TV of the stated all-zero and independent Bernoulli sequence laws and its two limiting behaviors. | L+T | m05_horizonGapCounts proves positive denominator, all-zero and complement count normalization and the two-event L1 identity for arbitrary rational epsilon and natural horizon. test_m05_horizon_gap enumerates finite full word laws. Full word-law interpretation and both analytic limits remain prose. |
| M06.01 | Probability identity | Conditional law of total variance under the stated finite-second-moment joint law. | P | Prose expansion and tower-property argument. |
| M06.02 | Fixed example | Equal-weight two-model mixture has zero within-model variance and mixture variance 25. | L | m06_mixtureCounts checks finite sums and centered squares; dividing by two gives the stated variance values. Not a general variance decomposition. |
| M07.01 | Fixed example | Balanced fair-coin sequence likelihood ratio in the misspecified two-candidate family and its limiting posterior concentration. | L+T | m07_balancedLikelihoodCounts proves the arbitrary-k positive-denominator cross-multiplication identity and fixed parameter differences; test_m07_balanced_likelihood checks exact likelihoods and finite posterior progression. Posterior convergence remains prose. |
| M07.02 | Asymptotic proposition | Almost-sure normalized log-likelihood ratio limit under independent fair-coin observations. | P | Strong-law argument in prose; no general misspecification theorem accepted. |
| M08.01 | Fixed counterexample | Specified fair-die events have equal marginal probabilities, nonempty intersection and nonexhaustive union. | L+T | m08_overlapCounts proves four face counts. Python test_m08_overlapping_events checks probabilities; equal face weighting supplies the prose interpretation. |
| M08.02 | Probability bounds | Intersection bounds from inclusion-exclusion and monotonicity for two events. | P | No accepted general event-probability inequality. |
| M08.03 | Logical limitation | Exclusive labels need not encode exclusive propositions; rejecting an alternative does not imply another without the required premises. | P | Logical discussion; not counted as an accepted theorem. |
| M09.01 | Fixed counterexample | Two binary worlds agree on the stipulated observed input but differ at the unobserved input. | L+T | m09_observationalAgreement proves agreement at the observed Boolean input and disagreement at the other input; test_m09_observational_agreement checks the same worlds. No general extrapolation theorem. |
| M09.02 | Lower bound | Worst-case binary prediction error at least one half for the stated two-world example. | L+T | m09_worstCaseError proves the rational-grid two-risk numerator sum and doubled-numerator lower bound for every admissible denominator and prediction numerator; test_m09_worst_case_error checks exact Fraction risks on finite grids. Arbitrary real probabilities and a universal error rate are not claimed. |
| M10.01 | Sharpness example | Constant midpoint attains the two-model squared-error lower bound from M01 for unrestricted real estimates. | P | Prose only; linked to M01.03, not a separate project acceptance. |
| M11.01 | Probability example | Distinct Bernoulli laws identify the sign in the stipulated family, with the stated one-observation TV distance. | L+T | m11_bernoulliSeparation proves positive denominator, normalization, opposite sides of the midpoint, distinct vectors and L1 numerator for admissible rational separations; test_m11_bernoulli_separation checks exact Fraction TV. General probability laws and finite-sample minimax claims remain prose. |
| M11.02 | Finite-sample limitation | Worst-case error lower bound and stated randomized-guess sharpness for the fixed Bernoulli family. | P | Prose only; pointwise versus uniform caveat retained. |
| M12.01 | Common-limit limitation | Worst-case error bound for the stated k-label common-TV-limit assumptions and randomized-guess sharpness. | P | Prose only. |
| M12.02 | Fixed example | Adding a neutral fair-coin label gives the stated three-label finite-sample limitation. | P | Prose only. |
| M13.01 | Definition / interpretation | Identified-set definition and distinction between singleton, multiple values and incompatible empty set. | P | Definition and logical consequences, not a finite-sample confidence set. |
| M13.02 | Fixed example | Identified interval for face-two probability given the stipulated die parity law. | L+T | m13_parityIdentifiedGrid proves both directions of the exact identified-set characterization on every rational grid with denominator 2m, m>0, by a constructive six-face witness; test_m13_parity_identified_grid checks finite grids. Real-valued identified-set theorem remains prose. |
| M13.03 | Fixed example | Restricting the declared family to the two endpoint distributions gives a two-point set, not the full interval. | L+T | m13_endpointIdentifiedSet proves both directions for the two endpoint models for every positive m; test_m13_endpoint_identified_set checks finite grids and the excluded interior. The rational-grid scope is retained. |
| M14.01 | Probability inequality | Total variation contraction for a common finite stochastic matrix under the stated row-normalization assumption. | P | General inequality is not proved by m14_parityLoss. |
| M14.02 | Fixed counterexample | Two disjoint equally weighted face lists have identical parity laws. | L+T | m14_parityLoss proves list distinction, disjointness and equality of mapped lists; Python test_m14_parity_erases_distinguishability checks the TV value before reduction and equal parity masses. |
| M14.03 | Set inclusion | Compatible model set, and hence identified set, cannot shrink under the specified common transformation alone. | P | Prose inclusion argument only. |
| M15.01 | Variance example | Parity-sampling variance and comparison with the fixed identified-set diameter from M13. | L+T | m15_samplingVarianceCounts proves enumerated fair-trial moments for n=1,2,4 and fixed endpoint separation. test_m15_sampling_variance checks exact moments on finite grids for three probabilities and n=1..8. General n, nonfair probability and real square-root formula remain prose; quantities are not additive. |
| M15.02 | Coverage lower bound | Confidence-set diameter probability and expectation bounds under common observation law, stated measurable coverage and alpha assumptions. | P | Prose only; not a confidence-set construction. |
| M16.01 | Fixed counterexample | Equal aggregate and component means with different equality-event probabilities for the stated two allocations. | L+T | m16_aggregateAmbiguity proves equal sums/lists and different equality counts for scaled equal-weight lists. Python test_m16_equal_aggregate_distinct_components checks corresponding fixed values. |
| M16.02 | Fixed example | Different component variances and covariance in the same allocation example. | L+T | m16_centeredSums checks both centered-square sums and cross-product sums on the scaled lists. The existing Python test explicitly checks first-component variance and covariance; normalization of integer sums remains a prose interpretation. |
| M16.03 | Symmetry observation | Both allocation laws are unchanged by swapping coordinates, so the difference is not an exchange of coordinates. | L | m16_swapCounts proves the fixed list swap/reversal identities and equality counts. The equal-weight probability-law interpretation remains prose. |

## Synthesis and notation

The introductory notation and reading guide define conventions and recommend background reading; they are not counted as accepted theorems. The M04 and M05 interpretive summaries concern the listed counterexamples. M06's distinction between uncertainty sources is conceptual rather than an additional variance theorem. M10's synthesis, M11's pointwise-versus-uniform qualification, M15's caution about adding distinct uncertainty quantities, and M17's closing synthesis are retained as scope statements, not independent theorem rows. M17 is thereby accounted for without manufacturing a proof obligation for it.

## Reconciliation

| Measure | Count |
| --- | ---: |
| Public sections accounted for (including M17 synthesis) | 17 |
| Grouped statement/example rows | 40 |
| L+T rows | 16 |
| L-only rows | 4 |
| T-only rows | 0 |
| P rows | 20 |
| Distinct accepted mathematical declarations mapped | 20 |
| Distinct Python test methods mapped | 15 |
| Arithmetic smoke theorem (separate from research rows) | 1 |

All forty identifiers are unique. All fifteen Python test method names and all twenty accepted mathematical declaration names appear in the register. The M16 Python method maps to two rows, so sixteen L+T groups correspond to fifteen test methods. Thirteen of seventeen sections have corresponding Lean evidence, eleven of those also have Python evidence; four sections remain prose/synthesis only. Counts describe partial or full evidence at the grouped-statement level, not percentages of theorem completion or scientific qualification. Batches 2–5 document the precise accepted propositions; general probability-measure and asymptotic results are not automatically accepted. The pinned RC1 edition remains unchanged.

## Remaining assurance

The next review can consider independent checking of the existing abstract examples and careful statement-level verification of the public prose. The named-declaration axiom check is not a library-wide audit. Independent reproduction, independent statement review, rights clearance and an owner licensing decision remain open. The original project-specific mathematical obligations, private archive, datasets and runtime are outside this register and remain unaccepted by it.

No formalization of model-specific methods, new operational code, or migration of historical implementations is included. No new public release or license is granted.
