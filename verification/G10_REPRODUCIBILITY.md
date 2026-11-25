# G10 — Locked-source reproducibility assessment

Date: 2026-11-25. Scope: the five named Lean declarations and six fixed Python checks in the public abstract mathematics repository.

## Observed executions

| Record | G08 R1 | Revised G09 |
| --- | --- | --- |
| Tested commit | 24d2adbe10f6252671eba1f83de5399c2cda2729 | 359db63b1960a4d5afa21fb4d3cedb6e06950710 |
| GitHub Actions run | [45699855662](https://github.com/HMarcusWH/FFBBP/actions/runs/45699855662) | [45707958300](https://github.com/HMarcusWH/FFBBP/actions/runs/45707958300) |
| Lean job | 139506796492 | 139534671089 |
| Python job | 139506796971 | 139534671833 |
| Both jobs | success | success |
| Lean | 4.35.0 | 4.35.0 |
| Build report | 160 jobs completed | 160 jobs completed |
| Named axiom-free reports | 5 | 5 |
| Fixed Python tests | 6 passed | 6 passed |

The revised workflow's explicit five-declaration check completed successfully. This closes the pending automated enforcement item in G09. Both runs use the same locked mathematical sources, but their workflow versions differ. The G09 change adds enforcement of the four previously manually inspected axiom reports.

## Source comparisons

The following Git blob identities were retrieved at both tested commits and current main; all five comparisons matched across the three references.

| Path | Git blob SHA |
| --- | --- |
| FFBBP.lean | b255ff9d7b7b9094c231c75e69809096fecb9240 |
| lake-manifest.json | d0d5afd6f802f8159255011089485e0806a64fc1 |
| lean-toolchain | a6aff065db2882c535684f8c5bcd4f16e9a23915 |
| lakefile.toml | 327357be180e0cfa63b36fe6e78ad8b1f45f7eb5 |
| examples/abstract_counterexamples.py | 58d2fb52adae863b5cdcb16f7428f31493670d4a |

## Fresh artifact verification and member comparison

Both downloaded evidence ZIPs were opened locally. Their recomputed SHA-256 values match the provider digests, and both passed ZIP CRC verification.

| Artifact ID | Bytes | SHA-256 |
| --- | ---: | --- |
| 15061659579 (G08 R1) | 1076 | c0f707fb13a9d49331b1c280f109fb4b34f3ea6e1868881e70cd876fda30f9bb |
| 15067145229 (revised G09) | 1076 | b626fc30f3212eecb79336ca92d65328cecbb7280120f190cc3bee619dcf5be2 |

The outer archive bytes differ. Their two member names and corresponding member bytes match exactly:

| Member | Bytes | Common SHA-256 |
| --- | ---: | --- |
| lake-manifest.json | 3123 | 4cf42be720e442c8476af0d94dccd7c9228e4abb569b64cd51d5edbd2dc2c79a |
| lean-smoke.log | 346 | 884f56fa3db5ed8aad1acf55550845e65553cef705b153299a10fdd19e95d063 |

The manifest member's Git blob matches the committed lockfile and contains nine resolved package revisions. The compiler log contains five axiom-free reports matching the named declarations in G09. Artifact byte checks do not establish identical compiled binaries or a fully source-rebuilt Mathlib dependency tree.

## Disposition

- G09: scoped internal assurance and revised automated enforcement passed.
- G10: repeated hosted-build reproducibility passed for the existing named examples. The evidence comparison was performed afresh; no new Lean compilation was launched by this assessment.
- Independent third-party reproduction and mathematical review: not established. Both executions are GitHub-hosted runs of the same research repository, not external reviewer attestations.
- General probability-measure proofs, library-wide axiom audit, original model-specific obligations and independent scientific qualification: not established by these records.

G11 documentary reconciliation can proceed without changing these limitations. G10's independent reproduction requirement remains open. No unrestricted release is granted.
