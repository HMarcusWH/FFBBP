# G09 — Named-declaration proof assurance

Date: 2026-11-25. Scope: the public standalone abstract examples only.

## Source and evidence

- Tested commit: [24d2adbe10f6252671eba1f83de5399c2cda2729](https://github.com/HMarcusWH/FFBBP/commit/24d2adbe10f6252671eba1f83de5399c2cda2729).
- [Hosted run 45699855662](https://github.com/HMarcusWH/FFBBP/actions/runs/45699855662), Lean job 139506796492 and Python job 139506796971: both completed successfully.
- Current and tested FFBBP.lean Git blob: b255ff9d7b7b9094c231c75e69809096fecb9240.
- Current and tested lake-manifest.json Git blob: d0d5afd6f802f8159255011089485e0806a64fc1.
- Reviewed exposition mathematics/FOUNDATIONS.md Git blob: a86ed69df35fd2e3f943389bfdc519803c9e8a20.
- Compiler log: Lean 4.35.0, Mathlib commit 56a005855ea17e0b0958f73ec801ae140b0a1679, 160 build jobs completed successfully. The module-system migration warning remains.

## Statement review

| Declaration | Verified statement | Interpretation and limit |
| --- | --- | --- |
| FFBBP.bootstrapSmoke | 2 + 2 = 4 in Nat | Toolchain check, not a research claim. |
| FFBBP.AbstractExamples.m04_noReducedMap | No total Nat map reproduces the specified reduced successors on ToyState | Faithful fixed deterministic counterexample; no general stochastic result. |
| FFBBP.AbstractExamples.m08_overlapCounts | Counts 3, 3, 2 and 2 for the two face lists, their overlap and uncovered faces | Agrees with M08 under equal weighting and the specified distinct face lists; no measure-theoretic event inequality formalized. |
| FFBBP.AbstractExamples.m14_parityLoss | Distinct disjoint face lists have equal mapped parity lists | Faithful fixed equally weighted example; probability interpretation is prose, not a Lean proof of general TV contraction. |
| FFBBP.AbstractExamples.m16_aggregateAmbiguity | Equal aggregate lists and equal component sums, different equality-event counts | The two lists have two equally weighted entries each, scaled by two relative to the prose example; mean and event-probability interpretation uses these conventions. No general probability law, variance or covariance theorem formalized. |

Internal review finds the precise statements consistent with their restricted illustrative interpretations. All five named declarations have no reported axiom dependencies. This is not an independent human review, a library-wide dependency audit, or a verification of all seventeen prose sections.

## Artifact integrity

Downloaded Actions artifact 15061659579 from the G08 run. The archive is 1076 bytes; its recomputed SHA-256 equals the provider-reported digest:

`c0f707fb13a9d49331b1c280f109fb4b34f3ea6e1868881e70cd876fda30f9bb`

Both ZIP members passed CRC verification.

| Member | Bytes | SHA-256 |
| --- | ---: | --- |
| lake-manifest.json | 3123 | 4cf42be720e442c8476af0d94dccd7c9228e4abb569b64cd51d5edbd2dc2c79a |
| lean-smoke.log | 346 | 884f56fa3db5ed8aad1acf55550845e65553cef705b153299a10fdd19e95d063 |

The artifact manifest's Git blob matches the committed and tested lockfile. All nine package revisions are retained. The five compiler reports appear in both the downloaded log and hosted job log:

```text
'FFBBP.bootstrapSmoke' does not depend on any axioms
'FFBBP.AbstractExamples.m04_noReducedMap' does not depend on any axioms
'FFBBP.AbstractExamples.m08_overlapCounts' does not depend on any axioms
'FFBBP.AbstractExamples.m14_parityLoss' does not depend on any axioms
'FFBBP.AbstractExamples.m16_aggregateAmbiguity' does not depend on any axioms
```

## CI correction

The preceding workflow directly enforced the smoke theorem report only. The remaining four reports were inspected individually. Commit [359db63b1960a4d5afa21fb4d3cedb6e06950710](https://github.com/HMarcusWH/FFBBP/commit/359db63b1960a4d5afa21fb4d3cedb6e06950710) extends the existing check to require exact axiom-free reports for all five named declarations. No theorem source or dependency lock was changed. The [new run 45707958300](https://github.com/HMarcusWH/FFBBP/actions/runs/45707958300) was in progress when this record was written; its result is not accepted in advance.

## Disposition

G09 internal statement and named-axiom review completed, with matching retained artifact and lockfile. Revised CI enforcement awaits its own observed result. G10 independent reproduction is not established. No general model-specific mathematical obligation, scientific qualification or operational release is established by this work.
