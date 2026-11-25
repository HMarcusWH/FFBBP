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
