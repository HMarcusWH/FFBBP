# G07 — hosted bootstrap verification receipt

Date: 2026-11-25

- Tested source commit: [23b19b51c32513446a3ca549b585d80e7fc40b53](https://github.com/HMarcusWH/FFBBP/commit/23b19b51c32513446a3ca549b585d80e7fc40b53).
- [GitHub Actions run 45699117744](https://github.com/HMarcusWH/FFBBP/actions/runs/45699117744): both jobs completed successfully.
- Python 3.14.4: all six fixed abstract example tests passed.
- Lean 4.35.0 (commit eb6cafb7290e8bd5f2937522d8d804f58f02bafc); Lake 5.0.0-src+eb6cafb.
- Mathlib resolved to commit 56a005855ea17e0b0958f73ec801ae140b0a1679.
- Lake reported a successful build (160 jobs).
- Direct compiler output: `'FFBBP.bootstrapSmoke' does not depend on any axioms`.
- The build emitted a module-system migration warning; it did not prevent the successful smoke check.

## Generated artifact

The downloadable evidence archive (GitHub artifact 15061968481, name lean-bootstrap-evidence) was retrieved and its SHA-256 verified against the provider digest. Both archive members passed the ZIP CRC check.

| Item | SHA-256 |
| --- | --- |
| Evidence archive (996 bytes) | 55d3f67ae690ae4f08b7ffe14b8eea008d39740936bdd2f5a6cfe7ce2740547e |
| lake-manifest.json (3123 bytes) | 4cf42be720e442c8476af0d94dccd7c9228e4abb569b64cd51d5edbd2dc2c79a |
| lean-smoke.log (53 bytes) | 685a26b7d0c72ec16ec7868bcf05d6ce27c516c791026e310313d160964a5e33 |

The generated manifest specifies nine package commit revisions. It was subsequently committed without alteration in [7dd15a4b9374a0727c59021fbaea5a5fdedef27d](https://github.com/HMarcusWH/FFBBP/commit/7dd15a4b9374a0727c59021fbaea5a5fdedef27d); Git blob d0d5afd6f802f8159255011089485e0806a64fc1 matches the downloaded artifact.

## Disposition

G07 passes the initial hosted build and arithmetic smoke-test scope. One smoke theorem is kernel checked; zero substantive research theorems are accepted. The successful run generated its manifest rather than consuming the subsequently committed file. A separate locked-checkout rerun is not established by this receipt. The archive has a finite Actions retention period. This receipt is not an independent mathematical review, a library-wide axiom audit, or scientific or operational qualification.
