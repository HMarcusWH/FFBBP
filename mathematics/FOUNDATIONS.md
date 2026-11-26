# Abstract mathematical foundations and limits of inference

Public exposition — 25 November 2026. Corresponds to supplementary research rounds M01–M17. These are standard mathematical results and illustrative counterexamples, not new priority claims. All examples concern hypothetical probability experiments. No model-specific inference method, empirical validation, or operational qualification is presented. Proofs below are mathematical prose, not Lean certificates.

## Notation

Let Θ be a set of possible mathematical models, O(θ)=Pθ their probability laws on a common observation space, and q a quantity defined on Θ. Write L(X) for a probability law and δx for the point mass at x. Total variation (TV) means sup_E |P(E)−Q(E)|; for finite probability vectors it equals half their L1 distance.

## M01 — Observational equivalence

Define θ ~ θ′ when O(θ)=O(θ′), and let π map Θ onto its equivalence classes. The quantity q is identifiable exactly when it is constant on each class. Equivalently, there is a unique function q̄ on the quotient such that q=q̄∘π: define q̄([θ])=q(θ). Constancy gives well-definedness, and surjectivity gives uniqueness. The converse follows from the factorization.

Under two simple hypotheses with positive prior weights and equal observation laws, the Bayes factor is one almost surely under their common law. Their posterior odds equal their prior odds, even when those odds are unequal.

Suppose two observationally equivalent models assign real values a and b to q. For any real-valued estimator X, their squared-error risks obey

$$
\max\{\mathbb E[(X-a)^2],\mathbb E[(X-b)^2]\}\ge (a-b)^2/4.
$$

The expectations use the same law of X, including any common auxiliary randomization. The average of the squared errors is (X−(a+b)/2)²+(a−b)²/4. Nonnegativity proves the bound.

## M02 — Finite-horizon agreement

Equality of joint laws through time t+1 implies equality through time t by marginalization. Equality at every finite horizon implies equality on the sequence product sigma-algebra by uniqueness on cylinder events. Agreement at a single finite horizon does not suffice.

Compare independent fair binary symbols with the repeating word 0011 started at a uniformly random phase. Both have fair single-symbol laws and uniform adjacent two-symbol laws. The first assigns probability 1/8 to the word 000; the second assigns zero. Thus agreement at horizon two does not imply agreement at horizon three.

When the joint history and future law is identical and regular conditional distributions exist with almost-sure uniqueness (as on standard Borel spaces), their conditional future laws agree almost surely with respect to the common history law. This does not assert equality of versions at null histories.

## M03 — Gauge invariance

Suppose a group acts on Θ and preserves O. Every group orbit lies in an observational equivalence class. The natural map from the orbit quotient to the observational quotient is surjective, but it need not be injective. It is injective exactly when each observable-law fiber is one orbit.

For two independent Bernoulli variables with parameters p,q, the parity law has success probability p+q−2pq. The pairs (1/4,1/4) and (1/8,1/3) both yield parity probability 3/8. They are not related by swapping parameters; their products are 1/16 and 1/24. The product is invariant under the declared exchange symmetry but is not identified by parity. This refutes the converse of the implication from identification to invariance under a law-preserving group.

## M04 — Sufficiency and dynamical closure

Preservation of a specified present statistic does not establish preservation of a future law or autonomous reduced dynamics.

Let A,B,C be abstract states, with R(A)=R(B)=0 and R(C)=1. Define T(A)=A, T(B)=C, T(C)=C. If a function T̄ on reduced states satisfied R∘T=T̄∘R, then T̄(0) would have to equal both 0 and 1. No such function exists.

Likewise, fair binary U with V=U in one experiment and V=1−U in another gives identical individual marginals but covariances 1/4 and −1/4. A pair of matching marginals is not a matching joint law.

## M05 — Approximation depends on what is compared

Four elementary counterexamples distinguish metrics, conditioning, and horizons.

- P=δ1 and Q=(δ0+δ2)/2 have the same mean but TV distance one.
- P_n=δ_(1/n) converges weakly to δ0 and has Wasserstein-1 distance 1/n from δ0 on the usual real metric. Their TV distance is one at every finite n. Neither point mass is absolutely continuous with respect to the other.
- On a three-element space, let P=(1−ε,ε,0), Q=(1−ε,0,ε), with 0<ε<1. Their TV distance is ε. Conditional on the last two elements, their laws are disjoint point masses, at TV distance one.
- Compare the length-H all-zero sequence law with H independent Bernoulli(ε) symbols. TV is 1−(1−ε)^H. It tends to zero as ε tends to zero for fixed H, but tends to one as H tends to infinity for fixed positive ε.

These examples refute unconditional transfers of approximation claims. They do not provide a general numerical certificate.

## M06 — Different sources of uncertainty

Random variation, sampling uncertainty, structural ambiguity, representational loss, numerical error and model misspecification are distinct concepts; they need not be independent or additive.

For a scalar Z with finite second moment, a model index M and observations Y, the conditional law of total variance gives

$$
\operatorname{Var}(Z\mid Y)=
\mathbb E[\operatorname{Var}(Z\mid M,Y)\mid Y]
+\operatorname{Var}(\mathbb E[Z\mid M,Y]\mid Y).
$$

Expand Z−E[Z|Y] as the sum of Z−E[Z|M,Y] and E[Z|M,Y]−E[Z|Y]. The cross term has zero conditional expectation by the tower property. The identity is relative to the specified joint probability law, not a universal decomposition of all uncertainty.

In an equal-weight mixture of two models with identical observation laws, one setting Z=0 and the other Z=10, the within-model variance is zero while the mixture variance is 25. Exact computation does not eliminate structural ambiguity.

## M07 — Model misspecification

Take independent fair-coin observations and two candidate Bernoulli laws with probabilities 3/5 and 4/5, assigning equal positive prior weights. The true fair-coin law is not a candidate.

On a balanced sequence of even length n, the likelihood ratio of the first candidate to the second is (3/2)^(n/2). Its posterior probability tends to one, while its parameter differs from the true probability by 1/10. More generally, with S_n heads, the normalized log-likelihood ratio is

$$
(S_n/n)\log(3/4)+(1-S_n/n)\log 2
\longrightarrow \tfrac12\log(3/2)>0
$$

almost surely under the stipulated fair independent experiment, by the strong law of large numbers. Thus increasing posterior confidence in a preferred candidate does not establish absolute model adequacy.

## M08 — Competing labels and overlapping propositions

Mutually exclusive model labels need not represent mutually exclusive propositions. On a fair six-sided die, the events A={2,4,6} and B={4,5,6} each have probability 1/2, their intersection has probability 1/3, and their union has probability 2/3. The sum of marginal probabilities is one even though the events are neither exclusive nor exhaustive.

For general events of probabilities p,q, their intersection lies between max(0,p+q−1) and min(p,q), by inclusion-exclusion and monotonicity. Normalization does not determine the joint event law. Rejecting one alternative does not establish another unless the requisite logical premises hold.

## M09 — Limits of extrapolation

Let X and Y be binary. Two worlds agree that Y=0 at X=0. At X=1, world A has Y=0 and world B has Y=1. Suppose observations are confined to X=0. Their observation laws coincide irrespective of sample count.

If a randomized binary prediction at X=1 outputs one with probability r, its risks in the two worlds are r and 1−r. Their maximum is at least 1/2. This is a worst-case result for the stated two-world example, not a universal error rate.

## M10 — First synthesis

The quotient of observation laws describes identification, while dynamical closure, approximation and scientific adequacy are separate questions. In the M01 two-model squared-error example the bound is sharp: the constant midpoint has risk (a−b)²/4 in both models. This sharpness statement concerns the declared two-model problem and unrestricted real-valued estimates.

## M11 — Exact identification versus uniform recovery

Consider Bernoulli(1/2+t) and Bernoulli(1/2−t) for 0<t≤1/4. The sign label is uniquely determined by the population law, yet the one-observation TV distance is 2t.

For a fixed finite n of independent observations, both product laws tend in TV to the fair-coin product law as t tends to zero. Any binary decision rule has sum of error probabilities at least one minus the TV distance of the two data laws (apply the definition of TV to the decision probability, which is bounded between zero and one). Hence its worst-case error over the entire family is at least 1/2. A fair random guess attains that worst-case error when randomized rules are permitted.

This does not deny pointwise recovery for each fixed nonzero t. It refutes uniform recovery over the stated family.

## M12 — Boundary instability and common limits

Exact equality of two observation laws is different from convergence of distinct laws to a shared limit. For k distinct labels, suppose that each label admits a sequence of complete-data laws converging in TV to the same law P0. For a rule with assignment probabilities f_i(y), their sum is one. Therefore some E_P0[f_i]≤1/k. Along that label's sequence, the correct-classification probability approaches E_P0[f_i]. The worst-case error is at least 1−1/k. Uniform random guessing attains the bound when allowed.

Adding the fair coin as a separate neutral label to the M11 example produces a three-label family with exact population-law identification and worst-case finite-sample error 2/3. A constant sequence for the neutral label is permitted. These are impossibility results for the stipulated probability families.

## M13 — Partial identification

For a specified population law P, define

$$
I_q(P)=\{q(\theta):P_\theta=P\}.
$$

A singleton gives unique identification; multiple values give ambiguity; an empty set indicates incompatibility with the declared family. The set is not a finite-sample confidence set or necessarily an interval.

If only parity of an unknown six-sided die is observed and its even probability equals 1/2, the probability of face two has identified set [0,1/2]. Nonnegativity gives the bound; each u in the interval is realized by assigning probabilities u to face two, 1/2−u to face four, and 1/2 to face one. Restricting the family to only those two endpoint distributions makes the identified set {0,1/2}, not the whole interval.

## M14 — Information loss

For finite probability vectors P,Q and a common stochastic matrix K (nonnegative rows summing to one), TV(PK,QK)≤TV(P,Q). Indeed,

$$
\frac12\sum_y|\sum_x (P(x)-Q(x))K(y\mid x)|
\le\frac12\sum_x |P(x)-Q(x)|\sum_y K(y\mid x).
$$

The right-hand side is TV(P,Q). Deterministic maps are special cases.

For example, P assigns half its mass to each of faces one and two, Q half to each of faces three and four. Before retaining parity their TV distance is one; afterward it is zero.

Every model compatible with P also remains compatible with PK after applying K. Thus I_q(P) is contained in the corresponding identified set after the common transformation. New or model-dependent information is outside this argument.

## M15 — Sampling uncertainty versus structural ambiguity

For n independent parity observations from the same die, the empirical even proportion has variance p(1−p)/n. At p=1/2 the sampling standard deviation is 1/(2√n), but the M13 identified set for face two has diameter 1/2 even at exact knowledge of the population parity law. The two quantities must not be added.

More generally, let two observationally equivalent models assign real values a<b to q. Suppose a random confidence set C has measurable inclusion events and diameter and at least 1−α coverage at each model (0≤α<1/2). Both inclusion probabilities are measured under a common complete-data law, including any common randomization. By the union bound,

$$
P(a,b\in C)\ge 1-2\alpha.
$$

Consequently P(diam(C)≥b−a)≥1−2α and E[diam(C)]≥(1−2α)(b−a). Take diameter zero for the empty set and allow infinite diameter. The result concerns the stated repeated-sampling coverage, not arbitrary credible sets or numerical enclosures.

## M16 — Aggregate versus component identification

In one model (U,V)=(1/2,1/2) deterministically. In another, (U,V) is equally likely to be (1,0) or (0,1). Both have sum one and both have component means 1/2. Yet their component variances are zero versus 1/4, covariance zero versus −1/4, and probabilities of equality one versus zero. Swapping coordinates leaves each model unchanged, so the two laws are not related by that symmetry.

Equal aggregate laws do not imply equal component joint laws. The additional agreement of component means is stipulated in the example, not implied by aggregate equality.

## M17 — Closing synthesis

Population-law identification, statistical stability, sufficiency of a representation, numerical correctness and model validity are distinct obligations. The examples establish limited logical implications and counterexamples under their stated premises; they do not establish a complete theorem for a particular application. No new canonical mathematical acceptance is claimed.

## Reading guide and verification status

The mathematical background consists of elementary conditional probability, equivalence relations and quotients, uniqueness of probability measures on generating cylinders, conditional expectation, the strong law of large numbers, total variation, and inclusion-exclusion. M01–M17 labels refer to the supplementary exposition sequence, not to an external theorem numbering or completed project obligations.

For further reading, standard treatments include Patrick Billingsley's *Probability and Measure* (measure-theoretic probability), E. L. Lehmann and Joseph P. Romano's *Testing Statistical Hypotheses* (statistical testing), and Charles F. Manski's *Partial Identification of Probability Distributions* (identified sets). These are background recommendations, not a claim that every statement above was extracted from those texts or that priority has been established.

This edition is newly authored from the reviewed abstract discussion. It does not transfer the underlying historical documents, private archive identifiers, datasets, implementation, or verification manifests. The initial G04 edition preceded Lean initialization. The current repository has eleven kernel-checked fixed-example declarations across M02, M03, M04, M05, M06, M08, M14 and M16, and six executed fixed Python examples. The [statement inventory](../verification/ABSTRACT_STATEMENT_INVENTORY.md) and [Batch 3 register](../verification/ABSTRACT_BATCH3.md) identify their exact coverage; G11 records the earlier baseline. The general mathematical derivations remain prose, and independent review is not established.
