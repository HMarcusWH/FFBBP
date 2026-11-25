# G08 R1 — Abstract proof register

Source: [FFBBP.lean at 24d2adbe](https://github.com/HMarcusWH/FFBBP/blob/24d2adbe10f6252671eba1f83de5399c2cda2729/FFBBP.lean).

[Hosted compiler run](https://github.com/HMarcusWH/FFBBP/actions/runs/45699855662). At submission, the four proof candidates had been read back from GitHub, with no incomplete-proof placeholders found by a source inspection. Compiler and axiom acceptance are separate checks.

| Declaration | Exposition | Exact scope of statement |
| --- | --- | --- |
| FFBBP.AbstractExamples.m04_noReducedMap | M04 | No map on reduced natural-number values commutes with the fixed three-state successor example. |
| FFBBP.AbstractExamples.m08_overlapCounts | M08 | Counts of two specified fair-die events, their common faces and their uncovered faces. |
| FFBBP.AbstractExamples.m14_parityLoss | M14 | Distinct disjoint two-face supports have identical parity lists. |
| FFBBP.AbstractExamples.m16_aggregateAmbiguity | M16 | Two equally weighted lists of scaled component values have equal aggregate lists and equal component sums but different equality-event counts. |

These statements formalize restricted illustrative examples, not general probability-measure theorems. In particular, M14's general total-variation inequality and M16's covariance calculations are not formalized here. No empirical or operational claim follows. The arithmetic smoke theorem remains separate from the four candidate example results.

The previous locked-dependency bootstrap run [45699559058](https://github.com/HMarcusWH/FFBBP/actions/runs/45699559058), testing commit 7dd15a4b9374a0727c59021fbaea5a5fdedef27d, completed both hosted jobs successfully. This is separate from the new proof run.

## Acceptance status

At submission: four proof candidates; zero newly accepted research-example proofs. The first arithmetic smoke theorem remains verified by G07. Full statement review, library-wide axiom audit and independent reproduction are pending. No general project mathematical obligation is closed.
