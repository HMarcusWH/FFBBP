# FFBBP

Public mathematical research and formalization record.

## Purpose

This repository documents abstract mathematical foundations and limitations of statistical inference, with Lean 4 formalization of selected propositions and counterexamples. It is a research record, not an operational system or a claim of universal inference capability.

## Start here

- [Versioned abstract mathematics candidate edition 0.1.0-rc.1](editions/ABSTRACT_MATH_0.1.0_RC1.md)
- [Abstract mathematical foundations (M01–M17)](mathematics/FOUNDATIONS.md)
- [Executable abstract examples](examples/abstract_counterexamples.py)
- [Lean project configuration](lakefile.toml)
- [Lean smoke test and abstract mathematical declarations](FFBBP.lean)
- [G08 R1 proof register](verification/G08_R1_PROOF_REGISTER.md)
- [G09 statement and axiom assurance](verification/G09_PROOF_ASSURANCE.md)
- [G10 reproducibility assessment](verification/G10_REPRODUCIBILITY.md)
- [G11 mathematical claim reconciliation](verification/G11_CLAIM_RECONCILIATION.md)
- [Automated mathematical checks](.github/workflows/mathematics.yml)
- [G07 hosted verification receipt](verification/G07_BOOTSTRAP_RECEIPT.md)
- [Statement-level mathematical inventory](verification/ABSTRACT_STATEMENT_INVENTORY.md)
- [Batch 2 verified fixed examples](verification/ABSTRACT_BATCH2.md)
- [Batch 3 verified fixed examples](verification/ABSTRACT_BATCH3.md)
- [Batch 4 R1 verified finite-count results](verification/ABSTRACT_BATCH4.md)
- [Batch 5 R1 verified finite probability and partial identification](verification/ABSTRACT_BATCH5.md)
- [Research status](RESEARCH_STATUS.md)
- [Publication scope](governance/PUBLICATION_SCOPE.md)
- [Bootstrap plan](docs/BOOTSTRAP.md)

## Verification

The current main branch contains twenty accepted abstract mathematical declarations and one arithmetic smoke theorem. All twenty-one have exact axiom-free reports in [Batch 5 R1 CI](https://github.com/HMarcusWH/FFBBP/actions/runs/45841285680); fifteen Python test methods passed under Python 3.14.4. Run `python examples/abstract_counterexamples.py` for the standard-library exact-arithmetic checks. The Lean and Mathlib versions are v4.35.0 and the resolved Lake manifest pins nine package revisions. [Batch 4 R1](verification/ABSTRACT_BATCH4.md) and [Batch 5 R1](verification/ABSTRACT_BATCH5.md) preserve the initial failed strict-gate runs, constructive repairs, successful native verification, independently rehashed evidence ZIPs and the exact merged source identity. The zero-axiom gate was not relaxed.

The [forty-group statement inventory](verification/ABSTRACT_STATEMENT_INVENTORY.md) records sixteen groups with Lean and Python evidence, four with Lean evidence only, and twenty prose/logical groups. Thirteen of seventeen sections have Lean evidence. Coverage is scoped to exact fixed examples and parameterized finite/rational-count statements; general probability-measure and asymptotic results are not thereby formalized. The initial bootstrap and historical G07–G12 records remain applicable to their respective pinned baselines. The 0.1.0-rc.1 candidate edition remains unchanged; it is not a tagged software release. Independent third-party reproduction, independent mathematical review and library-wide axiom auditing remain outside the accepted scope.

Historical research materials are maintained separately. Their existence does not imply permission to redistribute them, current verification, or independent scientific qualification. No operational deployment, full release, or real-world identification capability is authorized by this repository.

## Licensing

No project-wide redistribution license has been selected. Third-party materials require their own rights review before inclusion.
