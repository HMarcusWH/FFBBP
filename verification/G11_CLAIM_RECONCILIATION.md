# G11 — Public mathematical claim and evidence reconciliation

Date: 2026-11-25. Scope: the public abstract mathematics edition. The original project obligations, historical implementation and restricted archive remain separate.

## Evidence basis

The public exposition, Lean source, Python test source, G09 statement review, G10 reproducibility record and current status documents were read during this reconciliation. The current Lean source, Python examples, toolchain, Lake configuration and manifest have the same Git blob identities at the two tested commits and current main. All five comparisons matched. A fresh read of the revised G09 hosted job statuses confirmed both completed successfully. This is a documentary reconciliation; no new compiler run, artifact digest recomputation, or independent review is claimed.

| Evidence | Reference |
| --- | --- |
| Original public exposition reviewed | mathematics/FOUNDATIONS.md, Git blob a86ed69df35fd2e3f943389bfdc519803c9e8a20 |
| Lean declarations | FFBBP.lean, Git blob b255ff9d7b7b9094c231c75e69809096fecb9240 |
| Python fixed examples | examples/abstract_counterexamples.py, Git blob 58d2fb52adae863b5cdcb16f7428f31493670d4a |
| Toolchain | lean-toolchain, Git blob a6aff065db2882c535684f8c5bcd4f16e9a23915 |
| Lake project | lakefile.toml, Git blob 327357be180e0cfa63b36fe6e78ad8b1f45f7eb5 |
| Dependency lock | lake-manifest.json, Git blob d0d5afd6f802f8159255011089485e0806a64fc1 |
| First example proof run | [45699855662](https://github.com/HMarcusWH/FFBBP/actions/runs/45699855662), tested commit 24d2adbe10f6252671eba1f83de5399c2cda2729 |
| Revised automated check | [45707958300](https://github.com/HMarcusWH/FFBBP/actions/runs/45707958300), tested commit 359db63b1960a4d5afa21fb4d3cedb6e06950710 |
| Named statement review | [G09](G09_PROOF_ASSURANCE.md) |
| Prior artifact comparison | [G10](G10_REPRODUCIBILITY.md) |

## Section-level coverage

PROSE = mathematical exposition or synthesis only within the checked repository evidence; PYTHON = fixed example arithmetic tested; LEAN+PYTHON = a restricted example statement kernel checked and corresponding Python checks passed. None of these labels denotes formal verification of a whole section. The following table maps evidence to the public sections, not to original project obligations.

| Round | Highest evidence | Exact checked portion or scope boundary |
| --- | --- | --- |
| M01 | PROSE | Observational equivalence, quotient factorization, prior/posterior odds and two-point squared-error argument; no corresponding accepted declaration or Python test. |
| M02 | PYTHON | Fixed repeating-word single/pair counts and the 000 triple contrast; no proof-assistant verification of general finite-horizon or conditional-law statements. |
| M03 | PROSE | Orbit/fiber distinction and parity example; no corresponding accepted declaration or Python test. |
| M04 | LEAN+PYTHON | m04_noReducedMap; fixed three-state deterministic counterexample. The Python test checks equality of reduced starting values and inequality of successors. The additional joint-law/covariance example and general closure claims are not covered by this declaration. |
| M05 | PYTHON | Equal means with disjoint support and TV distance one on fixed three-point probability vectors. Other metric, conditional and horizon examples remain outside that test. |
| M06 | PROSE | Distinct kinds of uncertainty and conditional total variance; no corresponding accepted declaration or Python test. |
| M07 | PROSE | Misspecified coin model and posterior concentration argument; no corresponding accepted declaration or Python test. |
| M08 | LEAN+PYTHON | m08_overlapCounts checks specified face counts; Python checks the event probabilities for the fair die. No accepted general event-probability inequality. |
| M09 | PROSE | Two-world extrapolation example and worst-case bound; no corresponding accepted declaration or Python test. |
| M10 | PROSE | Synthesis and two-model midpoint sharpness statement; no corresponding accepted declaration or Python test. |
| M11 | PROSE | Identifiability versus uniform recovery; no corresponding accepted declaration or Python test. |
| M12 | PROSE | Common-limit impossibility and three-label example; no corresponding accepted declaration or Python test. |
| M13 | PROSE | Identified-set definitions and die example; no corresponding accepted declaration or Python test. |
| M14 | LEAN+PYTHON | m14_parityLoss checks specified disjoint face lists and identical parity lists; Python checks the two probability vectors and parity aggregation. General contraction and identified-set inclusion are not Lean verified. |
| M15 | PROSE | Sampling variance and structural confidence-set lower bounds; no corresponding accepted declaration or Python test. |
| M16 | LEAN+PYTHON | m16_aggregateAmbiguity checks fixed scaled allocation lists, aggregate and component sums, and equality counts; Python also checks selected component variance and covariance values. No general probability-law or covariance theorem is Lean verified. |
| M17 | PROSE | Closing synthesis; not a separate accepted theorem. |

Coverage: 17 public sections; 4 LEAN+PYTHON, 2 PYTHON only, 11 PROSE. Six Python test methods passed in the observed hosted runs. The fifth accepted named Lean declaration bootstrapSmoke is a toolchain test, not a research round. All five named declarations have axiom-free reports. This is not a count of all statements in the exposition or a percentage of mathematical completion.

## Claim disposition

The current repository may accurately report publication of the abstract exposition, successful execution of its six fixed examples, four kernel-checked example statements, one kernel-checked arithmetic smoke theorem, the individually checked axiom reports and repeated locked-source hosted builds. The named-declaration checks are not a library-wide axiom audit. The G10 member comparison concerns the manifest and report, not compiled binary reproducibility or independent source rebuild of all dependencies.

Retain as outstanding: independent third-party reproduction (G10), independent statement review, general mathematical results outside the named declarations, library-wide axiom audit, original project-specific mathematical obligations and scientific qualification. No operational implementation or data is admitted by this register. No original private archive is released, no license is selected, and unrestricted release is not authorized.

The G04 exposition's closing verification note was written before Lean initialization. G11 will update that note to reflect the four accepted fixed-example statements, without changing its mathematical derivations. The README and status records must retain the distinction between prose, tests and formal proofs.

G11 closes the scoped documentary reconciliation only. G12 may review a versioned public abstract research edition subject to these limitations; it must not be represented as acceptance of the complete FFBBP system or as closure of G10's independent third-party requirement.
