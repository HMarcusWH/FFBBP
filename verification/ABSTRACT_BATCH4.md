# Abstract mathematics — fourth formalization batch

Date: 2026-11-26 (Europe/Stockholm). Post-edition work on current main; the pinned 0.1.0-rc.1 edition is unchanged.

## Frozen targets and exact scope

The accepted parent is [Batch 3 reconciliation](https://github.com/HMarcusWH/FFBBP/commit/3a6fb817a040e07f3e5826653426bb51e84bbc57). The four targets are public statement groups already listed in the [statement inventory](ABSTRACT_STATEMENT_INVENTORY.md). They do not introduce new project-specific mathematical obligations.

| Group | Candidate declaration in FFBBP.AbstractExamples | Precise proposition |
| --- | --- | --- |
| M09.01 | m09_observationalAgreement | The two Boolean worlds agree at false, their sole observed input, and disagree at true. |
| M09.02 | m09_worstCaseError | For every positive natural denominator d and numerator 0 <= r <= d, the risk numerators r and d-r sum to d and at least one doubled numerator is >= d. This covers every rational prediction probability; extension to arbitrary real probabilities is not kernel checked here. |
| M05.03 | m05_conditioningAmplification | For arbitrary integers 0 < e < d, the two specified three-element count vectors each sum to d, have L1 numerator 2e, and restrict to disjoint two-element vectors of mass e, with L1 numerator 2e. These give full TV e/d and conditional TV one under the finite normalized-count interpretation. No general conditional probability or measure-theoretic result is claimed. |
| M11.01 | m11_bernoulliSeparation | For positive natural t with 2t <= m, the common denominator 2m is positive, both binary vectors sum to 2m, their first-coordinate counts lie on opposite sides of m, the vectors differ, and their L1 numerator is 4t. This covers the rational separations t/(2m) in (0,1/4]; real-valued probability-law and minimax results remain outside the formal scope. |

Three definitions express finite count distances; no integer-dividing probability normalization or unverified probability oracle is introduced. Existing twelve named declarations remain intact. The revised workflow requires sixteen exact axiom-free reports. The toolchain and dependency lockfile are unchanged. The four new Python methods independently check the Boolean example and finite grids of normalized exact Fraction values (not general proofs); the six existing methods are unchanged.

## Verification status

SUBMITTED — compilation, axiom audit and Python regression pending. No new proof acceptance is granted by this record before completed CI inspection and source/evidence reconciliation. Current accepted evidence remains eleven example declarations plus one smoke theorem; 11/40 grouped statements have corresponding Lean evidence.

If the four candidates pass and are reconciled, 15/40 groups will have corresponding Lean evidence, including parameterized finite-count results. This is statement-group coverage, not proof of all interpretations or full mathematical completion. Independent reproduction, independent statement review, library-wide axiom audit and licensing remain outstanding. No private materials, operational implementation, release tag or new edition are included.

## Submission readback and local Python check

[Atomic Batch 4 submission](https://github.com/HMarcusWH/FFBBP/commit/e077941c20d20892c9423279788b6a5ba4970b6e) changed five files. All five returned exactly the submitted content on commit-pinned GitHub readback. Tested input blob identities:

- FFBBP.lean: `8fb2cd14aaaf38a4419e675795cfd6abe9a3ff06`
- .github/workflows/mathematics.yml: `4eec95388e557174e94e0472b3d6fa395eadd5c6`
- examples/abstract_counterexamples.py: `0d3fe00651f84181063c502355a42cede46d669a`

The complete Python source was reconstructed from the GitHub readback, its Git blob SHA independently recomputed and matched, and all ten unittest methods passed under local Python 3.13.5. The previous six methods are retained. The parameterized Fraction checks cover finite grids, not a formal proof. The local environment has no Lean/Lake executable, so no local kernel check is claimed.

[Hosted workflow run 45818203518](https://github.com/HMarcusWH/FFBBP/actions/runs/45818203518) was observed queued for the exact submission commit; Lean job 139903302526 and Python job 139903301937 were both queued. The sixteen-report axiom-free gate is unchanged in strength. Static screening found sixteen named theorem declarations and matching print-axioms commands, all included in the workflow, with no incomplete proof placeholder or native_decide token. This is not proof acceptance. The statement inventory remains at its last accepted Lean baseline pending compiler/evidence review.

## Observed hosted result — 2026-11-26

[Run 45818203518](https://github.com/HMarcusWH/FFBBP/actions/runs/45818203518) is completed with failure. The Python job passed all ten test methods under Python 3.14.4. The Lean library build succeeded (160 jobs), and the explicit compiler invocation printed all sixteen axiom reports. Thirteen named declarations report no axioms, including all twelve previously accepted declarations and m09_observationalAgreement. The other three reports are:

| Candidate | Exact reported axioms |
| --- | --- |
| m09_worstCaseError | propext, Quot.sound |
| m05_conditioningAmplification | propext, Quot.sound |
| m11_bernoulliSeparation | propext, Quot.sound |

These are standard foundational Lean axioms, not sorryAx or project-specific assumptions. Nonetheless, the committed zero-axiom policy rejected the reports, the required verification step failed with exit code 1 and artifact upload was skipped. The module-system migration warning persists. No relaxed policy, batch acceptance or inventory promotion is authorized. All four candidates remain unaccepted as a batch. The next step is a proof-term repair under the current zero-axiom policy or an explicitly approved and separately versioned foundational-axiom policy. Batch 5 is separately staged in [draft PR #1](https://github.com/HMarcusWH/FFBBP/pull/1) and must not merge until the Batch 4 dependency is resolved.

## R1 constructive proof repair — 2026-11-26

The earlier completed run remains a failed strict-gate result. This candidate preserves the exact four theorem statements and the Python tests. The three parameterized proofs replace arithmetic automation with constructive natural-number induction, explicit subtraction cancellation, order inequalities, and equality transport. Existing accepted declarations and all sixteen required exact axiom-free reports remain unchanged. The workflow now records the complete audit failure set and retains build/compiler logs even when the audit fails. No foundational axiom allowlist has been introduced. Acceptance requires a new successful native compiler and strict report check; no acceptance is granted by source inspection.
