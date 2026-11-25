# FFBBP

Public mathematical research and formalization record.

## Purpose

This repository documents abstract mathematical foundations and limitations of statistical inference, with an intended Lean 4 formalization of selected propositions and counterexamples. It is a research record, not an operational system or a claim of universal inference capability.

## Start here

- [Abstract mathematical foundations (M01–M17)](mathematics/FOUNDATIONS.md)
- [Executable abstract examples](examples/abstract_counterexamples.py)
- [Lean project configuration](lakefile.toml)
- [Lean smoke test and fixed mathematical examples](FFBBP.lean)
- [G08 R1 proof register](verification/G08_R1_PROOF_REGISTER.md)
- [G09 statement and axiom assurance](verification/G09_PROOF_ASSURANCE.md)
- [Automated mathematical checks](.github/workflows/mathematics.yml)
- [G07 hosted verification receipt](verification/G07_BOOTSTRAP_RECEIPT.md)
- [Research status](RESEARCH_STATUS.md)
- [Publication scope](governance/PUBLICATION_SCOPE.md)
- [Bootstrap plan](docs/BOOTSTRAP.md)

## Verification

The repository contains documentation, fixed abstract mathematical examples and an initial Lean 4 project configuration. Run `python examples/abstract_counterexamples.py` from the repository root using Python 3. The examples use the standard library and six local tests passed in Python 3.13.5; these checks are not general mathematical proofs. The Lean and Mathlib versions are both set to v4.35.0. The [upstream Mathlib toolchain](https://github.com/leanprover-community/mathlib4/blob/v4.35.0/lean-toolchain) was inspected to confirm compatibility. The local configuration passed static checks. The [initial GitHub Actions run](https://github.com/HMarcusWH/FFBBP/actions/runs/45699117744) completed all six Python tests under Python 3.14.4 and installed the Lean toolchain. Both initial hosted jobs passed. Lean checked the arithmetic smoke theorem without axiom dependencies. The CI-generated manifest was committed with nine resolved revisions; see the G07 receipt for its exact scope. A subsequent locked-checkout run passed. G08 R1 also passed hosted Lean verification for four fixed abstract examples. The five named declarations (including the smoke theorem) report no axiom dependencies. General probability-measure results and independent review are not established by these checks. G09 reviewed the exact fixed-example statements and verified the retained evidence artifact. The revised CI workflow requires all five named axiom-free reports; its first run is pending. Independent review and library-wide axiom auditing remain outside the accepted scope.

Historical research materials are maintained separately. Their existence does not imply permission to redistribute them, current verification, or independent scientific qualification. No operational deployment, full release, or real-world identification capability is authorized by this repository.

## Licensing

No project-wide redistribution license has been selected. Third-party materials require their own rights review before inclusion.
