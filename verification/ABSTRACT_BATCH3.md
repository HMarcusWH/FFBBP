# Abstract mathematics — third fixed-example formalization batch

Date: 2026-11-26 (Europe/Stockholm). This is post-edition work on current main; the pinned 0.1.0-rc.1 candidate edition remains unchanged.

## Submitted source and scope

[Source and workflow commit 349a472ac9b4bd87f0b300c3eb4687d7d67d3289](https://github.com/HMarcusWH/FFBBP/commit/349a472ac9b4bd87f0b300c3eb4687d7d67d3289).

- FFBBP.lean Git blob: 2d7235d652abf3df5d56fe398f428a500fa5b3d3
- .github/workflows/mathematics.yml Git blob: f8611d7dc1c274057ac89460569366333ebf900d

The two files were committed together and read back exactly. Source inspection found twelve named declarations and twelve matching axiom-print commands, all covered by the required named reports in CI. The existing eight declarations are retained. A limited source screen found no sorry, admit or native_decide tokens. This is not a compiler or library-wide axiom audit.

| Inventory group | Candidate | Precise fixed-example scope |
| --- | --- | --- |
| M03.02 | FFBBP.AbstractExamples.m03_coinParityCounts | Natural-number arithmetic checks the two stipulated coin pairs using denominator 24. Both parity numerators are 216 with denominator 576, while product numerators are 36 and 24. The pairs are distinct and not coordinate exchanges. The probability interpretation is prose. |
| M04.02 | FFBBP.AbstractExamples.m04_binaryMarginalCounts | Fixed equally weighted binary pair lists have the same marginal counts, different equality-event counts and signed doubled-centered-product sums 2 and -2. Division by eight gives the stated covariances. |
| M06.02 | FFBBP.AbstractExamples.m06_mixtureCounts | Fixed equal-weight integer lists have means 0, 10 and 5, respectively, and centered-square sums 0, 0 and 50. Dividing by the two entries gives the stated variances. |
| M16.03 | FFBBP.AbstractExamples.m16_swapCounts | Swapping the components leaves the first scaled allocation list unchanged and reverses the second list. Equality-event counts distinguish the lists even after exchange. The interpretation as equality of equally weighted laws under reversal remains prose. |

These are fixed counterexamples and finite arithmetic facts; no general probability-measure theorem or model-specific method is formalized. No Python test methods were added or altered. If the four candidates pass, the statement inventory will require an L-only category, since the four groups did not have corresponding dedicated Python assertions.

## Verification status

[Hosted CI run 45723822800](https://github.com/HMarcusWH/FFBBP/actions/runs/45723822800) was observed queued with both jobs pending. Lean job ID 139588484683; Python job ID 139588484965. Twelve named axiom-free reports are required by the revised workflow.

At this observation the seven previously accepted fixed-example declarations and one arithmetic smoke theorem remain the verified inventory. The four new declarations are candidates only. No new acceptance is granted before inspecting the completed run and individual reports. The existing forty-group inventory retains its accepted-evidence counts until that verification.

Independent reproduction, independent statement review, library-wide axiom audit and the licensing decision remain outstanding. No general project qualification or new edition release is granted.
