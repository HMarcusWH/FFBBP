# Abstract mathematics — second fixed-example formalization batch

Date: 2026-11-25. This is work on current main after the pinned 0.1.0-rc.1 candidate edition; the edition baseline remains unchanged.

## Source and scope

[Submitted source commit 11f31c711e2b05c7daad82cd92a9bec6a3ed8eb4](https://github.com/HMarcusWH/FFBBP/commit/11f31c711e2b05c7daad82cd92a9bec6a3ed8eb4).

- FFBBP.lean blob: 5e7dfce2a0f49f0530931c5dd1a576121144ccf3
- .github/workflows/mathematics.yml blob: f5a185b0b7c30f12d829dce74630ed8056365985

Both files were read back and matched the submitted text exactly. There are eight named declarations with corresponding axiom-print commands and eight required reports in the revised workflow. Source screening found no sorry, admit or native_decide tokens. Source screening is not compiler verification.

| Inventory group | New candidate | Precise statement |
| --- | --- | --- |
| M02.03 | FFBBP.AbstractExamples.m02_prefixCounts | Enumerates starting phases of 0011, their single symbols and adjacent pairs, the absence of 000 among four phase triples and its single occurrence among eight binary triples. The uniform weighting of phase choices and independent fair bits supplies the probability interpretation. |
| M05.01 | FFBBP.AbstractExamples.m05_equalMeanCounts | Checks total masses and first-moment numerators for two fixed integer count lists with denominator two, and their L1 numerator of four. The corresponding rational normalization and TV interpretation are stated in prose, not as a general formal probability-law theorem. |
| M16.02 | FFBBP.AbstractExamples.m16_centeredSums | Checks two-entry list lengths and centered square/cross-product sums for the existing scaled allocation examples, including both components. The earlier mean-sum example fixes the common scaled means. Dividing the centered sums by eight converts the integer arithmetic to the original variance and covariance values. |

All three candidates concern fixed public toy examples. No model-specific inference method, general probability-measure theorem or original project mathematical obligation is formalized by this batch.

## Verification status at submission

[CI run 45712445754](https://github.com/HMarcusWH/FFBBP/actions/runs/45712445754) tests the submitted commit. The Python job completed successfully; the Lean job was still installing its toolchain at the recorded observation. The revised workflow requires all eight exact axiom-free reports. No new Lean acceptance is recorded before observing its compiler output and completed verification step.

The existing four example declarations and one smoke theorem remain the previously verified results. If the new candidates pass, the statement-level register must be updated only after inspection of the exact compiler reports and statement scopes. Independent third-party reproduction and independent mathematical review remain open. No new edition, tag, license or unrestricted release is granted.

## Observed acceptance and evidence integrity

The submitted run 45712445754 completed both jobs successfully. The Lean job 139550012810 built 160 jobs under Lean 4.35.0 and completed the automated eight-declaration check. Python job 139550012219 passed all six tests under Python 3.14.4. The module-system migration warning remains.

The compiler and automated check each report that the following declarations do not depend on any axioms:

```text
FFBBP.bootstrapSmoke
FFBBP.AbstractExamples.m04_noReducedMap
FFBBP.AbstractExamples.m08_overlapCounts
FFBBP.AbstractExamples.m14_parityLoss
FFBBP.AbstractExamples.m16_aggregateAmbiguity
FFBBP.AbstractExamples.m02_prefixCounts
FFBBP.AbstractExamples.m05_equalMeanCounts
FFBBP.AbstractExamples.m16_centeredSums
```

The actual Actions artifact 15067593533 was downloaded and checked locally. Its 1108 bytes have SHA-256 ff194af614747674068727f021495f899444e0ef0bc7cc4ab8ed1024e7bcf8cd, matching the provider digest; both ZIP members passed CRC checks.

| Member | Bytes | SHA-256 |
| --- | ---: | --- |
| lake-manifest.json | 3123 | 4cf42be720e442c8476af0d94dccd7c9228e4abb569b64cd51d5edbd2dc2c79a |
| lean-smoke.log | 565 | 2f0a0dc377b9a158936a403e3bed2980559a1669fd7eafa10fa67942bebb2894 |

The manifest has nine package revisions and Git blob d0d5afd6f802f8159255011089485e0806a64fc1, matching the committed lockfile. The extracted compiler report contains all eight axiom-free lines. Current source, workflow and build inputs match their tested Git blobs.

Disposition: the three additional fixed-example declarations are accepted within their precise statements. M02.03, M05.01 and M16.02 move from T to L+T in the current [statement inventory](ABSTRACT_STATEMENT_INVENTORY.md). This yields seven grouped statements with matching Lean and Python evidence, zero T-only groups and thirty-three prose/logical discussion groups. Six Python methods remain; the arithmetic smoke theorem is separate. Integer and list statements do not themselves formalize the surrounding probability-measure claims. The earlier frozen edition is unchanged. Independent review, independent reproduction, library-wide axiom audit and original project qualification are not established.
