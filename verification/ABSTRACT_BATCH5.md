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

## Observed original Batch 5 result and R1 repair

[Run 45818934133](https://github.com/HMarcusWH/FFBBP/actions/runs/45818934133) compiled all 21 declarations (160 jobs); all 15 hosted Python tests passed. Fourteen declarations reported no axioms. The three inherited Batch 4 candidates and m05_horizonGapCounts, m13_parityIdentifiedGrid, m13_endpointIdentifiedSet reported propext and Quot.sound; m07_balancedLikelihoodCounts reported propext. The zero-axiom gate failed and artifact upload was skipped. No acceptance was granted.

R1 merges the repaired Batch 4 main baseline 2a7e8445f6bb9ab535f5795c9aa25f4009a29d81 into this draft branch and replaces all seven affected proof bodies with explicit constructive arithmetic proofs, including local multiplication/power induction rather than relying on the previous upstream multiplication-power lemma. All 21 public named theorem statements and all 15 Python tests remain unchanged. The strict CI policy is preserved and failed compiler evidence is retained. A successful fresh compiler and complete zero-axiom report set are still required, as is acceptance reconciliation of the main Batch 4 baseline. No merge or acceptance is granted at submission.

## Observed R1 acceptance and reconciliation — 2026-11-26

**ACCEPTED — exact scoped propositions; zero-axiom gate passed.** [R1 source commit](https://github.com/HMarcusWH/FFBBP/commit/fb0a4489a01d9def38e831ef798763f8279d945c); [successful CI run 45841285680](https://github.com/HMarcusWH/FFBBP/actions/runs/45841285680). Lean job 139983311492: Lean 4.35.0 (eb6cafb7290e8bd5f2937522d8d804f58f02bafc), 160 successful build jobs, all 21 named reports explicitly axiom-free. Python job 139983311033: 15/15 methods passed under Python 3.14.4. The strict policy is unchanged. Historical initial failures above are preserved and superseded for current acceptance by R1.

Verified executable/configuration Git blobs:

| Path | Blob SHA |
| --- | --- |
| FFBBP.lean | 7bb4c3704283f645c794f5da4ae078cb52f672db |
| .github/workflows/mathematics.yml | 3df0828a57d8fa437e2cee1681ef6899b5902046 |
| examples/abstract_counterexamples.py | cffe22b3175ba1c5636bd9feb90f86106cf81e70 |
| lake-manifest.json | d0d5afd6f802f8159255011089485e0806a64fc1 |
| lean-toolchain | a6aff065db2882c535684f8c5bcd4f16e9a23915 |
| lakefile.toml | 327357be180e0cfa63b36fe6e78ad8b1f45f7eb5 |

[Downloaded artifact 15129055440](https://github.com/HMarcusWH/FFBBP/actions/runs/45841285680/artifacts/15129055440): 1971 bytes; independently recomputed SHA-256 `05bab87da3613e9c98790fdccb83be78376890587ae27b98c85046cebec8460c` matches the provider digest. ZIP CRC verification passed and the three-member set was exact. The manifest has nine package revisions and its independently recomputed Git blob SHA matches the pinned lockfile. The extracted compiler log contains exactly 21 distinct expected axiom-free reports, and the build log records successful completion of 160 jobs.

| Member | Bytes | SHA-256 |
| --- | ---: | --- |
| lake-manifest.json | 3123 | 4cf42be720e442c8476af0d94dccd7c9228e4abb569b64cd51d5edbd2dc2c79a |
| lean-smoke.log | 1587 | aa5bb04f64b40f86bcbd00e3d817483ea7ed9b0bb5b2db801d6558fff4857d62 |
| lean-build.log | 2344 | 75fb91586fbf74b01e615818054e841ce7599694fc76a5a20d644d53d3d18489 |

The unchanged public propositions were compared against the original candidate statements before R1 verification. Acceptance covers the exact statements only, including the finite-count and rational-grid qualifications recorded above. It is not an independent mathematical review or library-wide axiom audit. The module-system migration warning remains; the runner also reported the Node.js 20 action-runtime migration warning.

## Merged baseline

[PR #1](https://github.com/HMarcusWH/FFBBP/pull/1) merged successfully at [f95e12cec70bed68f15abeb900d66f4feac34715](https://github.com/HMarcusWH/FFBBP/commit/f95e12cec70bed68f15abeb900d66f4feac34715). The actual PR checkout commit 4a2cbc58b699517fc353f05e81cc3abd41aaadc4, the verified R1 branch head fb0a4489a01d9def38e831ef798763f8279d945c, and the actual main merge commit have the identical Git tree `6eb11b061ef55324cc51088d4fc1fbfe81a4c602`. The R1 main Batch 4 commit is an ancestor. No mathematical input changed at merge. The 19-file RC1 baseline and edition document remain unchanged.

Combined accepted inventory: twenty mathematical declarations and one arithmetic smoke theorem, 16 groups L+T, 4 L-only and 20 prose-only, 15 distinct Python methods, 13/17 sections with Lean evidence (11 with corresponding Python evidence). The accepted coverage is 20/40 editorial groups, not 50 percent of all mathematical formulas or project qualification. The [statement inventory](ABSTRACT_STATEMENT_INVENTORY.md), public reading guide and research status are reconciled. No project-specific obligations, independent scientific acceptance, or release authorization are granted.

## Post-merge native replay

[Main push run 45844288923](https://github.com/HMarcusWH/FFBBP/actions/runs/45844288923) on merge commit f95e12cec70bed68f15abeb900d66f4feac34715 passed both jobs. Lean job 139993792694: 160 successful build jobs and all 21 exact axiom-free reports, no nonempty axiom reports. Python job 139993792415: 15/15 methods passed under Python 3.14.4. The [post-merge evidence artifact 15130167085](https://github.com/HMarcusWH/FFBBP/actions/runs/45844288923/artifacts/15130167085) was downloaded, its 1972 bytes independently hashed to SHA-256 `99e2b689be2171ae9484f745a7524b6f00a368a238f82a47794cf556a83e18a9` matching the provider, and its ZIP CRC checks passed. The three-member set matches the PR evidence archive. The manifest and compiler report are byte-identical to the PR run; the build log differs (2345 bytes, SHA-256 `06e765c2670cece708ddbef283573674799c8cbc1e136614023f771a23d4315a`). The exact 21-line report is preserved in [BATCH5_R1_AXIOM_REPORT.txt](evidence/BATCH5_R1_AXIOM_REPORT.txt), Git blob `709952dafb6d6c6bf93a76e2cc6fe044a0305309`, matched to the extracted bytes from both archives.

The reconciliation commit and subsequent evidence-only documentation changes preserve all six tested executable/configuration blobs and the frozen RC1 edition. This is repeat hosted verification, not independent third-party reproduction or a full mathematical review.
