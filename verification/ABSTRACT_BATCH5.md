# Abstract mathematics — fifth formalization batch

Date: 2026-11-26 (Europe/Stockholm). Development branch only; the pinned 0.1.0-rc.1 edition is unchanged.

## Baseline and dependency gate

Parent [Batch 4 submission record](https://github.com/HMarcusWH/FFBBP/commit/4c52da4959a67752dcdc87306b77ec2eec8e5dae). Batch 4 hosted Python job 139903301937 passed all ten tests; Lean job 139903302526 was in progress at the preparation of this branch. Its four declarations are not accepted yet. This branch does not advance main or confer Batch 4 acceptance. It must be reconciled against the eventual accepted Batch 4 source before merge; if Batch 4 fails, repair and rebase/retest instead of waiving the gate.

## Frozen targets

| Group | Candidate in FFBBP.AbstractExamples | Exact statement and limit |
| --- | --- | --- |
| M05.04 | m05_horizonGapCounts | For every natural horizon h and rational epsilon=e/d in (0,1), positive denominator d^h, all-zero numerator (d-e)^h, normalized two-event counts and L1 numerator twice the complement count. The full word-law point-mass interpretation and the two analytic limits are not formally proved here. |
| M07.01 | m07_balancedLikelihoodCounts | Balanced-word likelihood numerators have ratio 6^k/4^k = 3^k/2^k by positive cross multiplication for arbitrary natural k. The two candidate parameters differ from the fair value; first difference is one tenth. Posterior convergence is not formally proved. |
| M13.02 | m13_parityIdentifiedGrid | For each positive m, six nonnegative face counts with odd and even totals m give exactly the face-two numerators 0 through m under denominator 2m. Both necessity and constructive sufficiency are checked; no real-valued identified-set theorem is asserted. |
| M13.03 | m13_endpointIdentifiedSet | Restricting the same six-face model to the two endpoint distributions gives exactly the endpoint numerators 0 and m, for arbitrary positive m. |
| M15.01 | m15_samplingVarianceCounts | Exact enumeration of signed sums for one, two and four independent fair trials gives counts, zero centered sums and centered-square sums 2, 8 and 64 respectively. Endpoint separation is two under denominator four. General n, nonfair p and square-root normalization remain outside this Lean statement. |

Five additional exact Fraction Python methods check finite word distributions, balanced likelihoods and finite posterior progression, the parity identified grids, endpoint restrictions, and empirical proportion variance by exhaustive finite binary enumeration for three rational probabilities and n=1..8. They are numerical witnesses, not general proofs. The ten prior Python methods are preserved.

All sixteen prior named theorem candidates and their audit commands are preserved. The revised CI requires twenty-one explicit axiom-free reports. Lean 4 and Mathlib pins and the lockfile are unchanged. The new code reuses the finite count-distance definitions from Batch 4. No private archive, model-specific theorem, runtime code or release authorization is introduced.

## Disposition

SUBMITTED AS DEVELOPMENT CANDIDATES. Accepted Lean evidence remains 11/40 at this observation. If both batches pass, 20/40 groups would have corresponding Lean evidence, with partial scope explicitly recorded rather than implying twenty fully formalized probability-law results. Independent mathematical review, independent reproduction, the library-wide audit and owner licensing decision remain open.
