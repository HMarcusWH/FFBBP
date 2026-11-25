# FFBBP

Public mathematical research and formalization record.

## Purpose

This repository documents abstract mathematical foundations and limitations of statistical inference, with an intended Lean 4 formalization of selected propositions and counterexamples. It is a research record, not an operational system or a claim of universal inference capability.

## Start here

- [Abstract mathematical foundations (M01–M17)](mathematics/FOUNDATIONS.md)
- [Executable abstract examples](examples/abstract_counterexamples.py)
- [Lean project configuration](lakefile.toml)
- [Lean arithmetic smoke test](FFBBP.lean)
- [Automated mathematical checks](.github/workflows/mathematics.yml)
- [Research status](RESEARCH_STATUS.md)
- [Publication scope](governance/PUBLICATION_SCOPE.md)
- [Bootstrap plan](docs/BOOTSTRAP.md)

## Verification

The repository contains documentation, fixed abstract mathematical examples and an initial Lean 4 project configuration. Run `python examples/abstract_counterexamples.py` from the repository root using Python 3. The examples use the standard library and six local tests passed in Python 3.13.5; these checks are not general mathematical proofs. The Lean and Mathlib versions are both set to v4.35.0. The [upstream Mathlib toolchain](https://github.com/leanprover-community/mathlib4/blob/v4.35.0/lean-toolchain) was inspected to confirm compatibility. The local configuration passed static checks. The [initial GitHub Actions run](https://github.com/HMarcusWH/FFBBP/actions/runs/45699117744) completed all six Python tests under Python 3.14.4 and installed the Lean toolchain. At the recorded observation, dependency resolution was in progress; Lean compilation and its axiom report were not yet accepted, and no resolved lockfile had been committed. Check the linked run for live status. No kernel-checked research theorem or independent review is claimed. Future proof records will distinguish statement drafting, compilation, axiom inspection and review of the intended mathematical claim.

Historical research materials are maintained separately. Their existence does not imply permission to redistribute them, current verification, or independent scientific qualification. No operational deployment, full release, or real-world identification capability is authorized by this repository.

## Licensing

No project-wide redistribution license has been selected. Third-party materials require their own rights review before inclusion.
