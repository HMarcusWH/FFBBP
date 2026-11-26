import Mathlib.Data.Nat.Basic
import Lean.Elab.Tactic.Omega

namespace FFBBP

/-- Minimal arithmetic smoke test for the Lean project, not a research theorem. -/
theorem bootstrapSmoke : (2 : Nat) + 2 = 4 := rfl

namespace AbstractExamples

/-- M04: a fixed three-element example of failure of deterministic reduction. -/
inductive ToyState where
  | a | b | c

def reduceToy : ToyState → Nat
  | .a => 0
  | .b => 0
  | .c => 1

def stepToy : ToyState → ToyState
  | .a => .a
  | .b => .c
  | .c => .c

/-- No single map on reduced values reproduces both successors in this toy example. -/
theorem m04_noReducedMap :
    ¬ ∃ f : Nat → Nat, ∀ s : ToyState,
      reduceToy (stepToy s) = f (reduceToy s) := by
  intro h
  obtain ⟨f, hf⟩ := h
  have ha : 0 = f 0 := hf ToyState.a
  have hb : 1 = f 0 := hf ToyState.b
  exact Nat.noConfusion (ha.trans hb.symm)

/-- M08: counts in a fixed fair-die example; each face has equal weight. -/
def eventA : List Nat := [2, 4, 6]
def eventB : List Nat := [4, 5, 6]
def dieFaces : List Nat := [1, 2, 3, 4, 5, 6]

/-- The two events have three faces each, two shared faces and two uncovered faces. -/
theorem m08_overlapCounts :
    eventA.length = 3 ∧
    eventB.length = 3 ∧
    (eventA.filter (fun x => eventB.contains x)).length = 2 ∧
    (dieFaces.filter (fun x => !(eventA.contains x || eventB.contains x))).length = 2 := by
  decide

/-- M14: equally weighted two-face experiments, with disjoint supports. -/
def facesP : List Nat := [1, 2]
def facesQ : List Nat := [3, 4]

/-- The original supports differ and are disjoint, but their parity lists coincide. -/
theorem m14_parityLoss :
    facesP ≠ facesQ ∧
    facesP.filter (fun x => facesQ.contains x) = [] ∧
    facesP.map (fun x => x % 2) = facesQ.map (fun x => x % 2) := by
  decide

/-- M16: twice the original component values, with two equally weighted outcomes. -/
def allocationA : List (Nat × Nat) := [(1, 1), (1, 1)]
def allocationB : List (Nat × Nat) := [(2, 0), (0, 2)]

/-- Equal sums and component means in the fixed examples, but different equality counts. -/
theorem m16_aggregateAmbiguity :
    allocationA.map (fun x => x.1 + x.2) = allocationB.map (fun x => x.1 + x.2) ∧
    (allocationA.map Prod.fst).sum = (allocationB.map Prod.fst).sum ∧
    (allocationA.map Prod.snd).sum = (allocationB.map Prod.snd).sum ∧
    (allocationA.filter (fun x => x.1 == x.2)).length = 2 ∧
    (allocationB.filter (fun x => x.1 == x.2)).length = 0 := by
  decide

/-- M02: the four starting phases of the periodic word 0011. -/
def toyPhases : List Nat := [0, 1, 2, 3]

def phaseBit (i : Nat) : Nat := if i % 4 < 2 then 0 else 1

def phasePairs : List (Nat × Nat) :=
  toyPhases.map (fun i => (phaseBit i, phaseBit (i + 1)))

def phaseTriples : List (Nat × Nat × Nat) :=
  toyPhases.map (fun i => (phaseBit i, phaseBit (i + 1), phaseBit (i + 2)))

def fairBits : List Nat := [0, 1]

def fairTriples : List (Nat × Nat × Nat) :=
  fairBits.flatMap (fun x => fairBits.flatMap (fun y =>
    fairBits.map (fun z => (x, y, z))))

/-- Fixed enumeration: equal single and pair frequencies for the periodic word,
    but zero occurrences of 000 versus one among eight fair triples. -/
theorem m02_prefixCounts :
    toyPhases.map phaseBit = [0, 0, 1, 1] ∧
    phasePairs = [(0, 0), (0, 1), (1, 1), (1, 0)] ∧
    phaseTriples.length = 4 ∧
    (phaseTriples.filter (fun x => x == (0, 0, 0))).length = 0 ∧
    fairTriples.length = 8 ∧
    (fairTriples.filter (fun x => x == (0, 0, 0))).length = 1 := by
  decide

/-- M05: masses on {0,1,2} expressed as counts with denominator two. -/
def massCountsP : List Nat := [0, 2, 0]
def massCountsQ : List Nat := [1, 0, 1]

/-- Equal mass and first-moment numerators, with L1 numerator four.
    Dividing counts by two gives equal means and TV distance one. -/
theorem m05_equalMeanCounts :
    massCountsP.sum = 2 ∧
    massCountsQ.sum = 2 ∧
    (List.zipWith (fun v m => v * m) [0, 1, 2] massCountsP).sum = 2 ∧
    (List.zipWith (fun v m => v * m) [0, 1, 2] massCountsQ).sum = 2 ∧
    (List.zipWith (fun a b => (a - b) + (b - a)) massCountsP massCountsQ).sum = 4 := by
  decide

/-- M16: deviations of the doubled components from their common scaled mean. -/
def centeredX (x : Nat × Nat) : Int := Int.ofNat x.1 - 1
def centeredY (x : Nat × Nat) : Int := Int.ofNat x.2 - 1

/-- Exact centered sums for the two fixed equal-weight allocation lists.
    With two entries and components scaled by two, the normalization is eight. -/
theorem m16_centeredSums :
    allocationA.length = 2 ∧
    allocationB.length = 2 ∧
    (allocationA.map (fun x => centeredX x * centeredX x)).sum = 0 ∧
    (allocationA.map (fun x => centeredY x * centeredY x)).sum = 0 ∧
    (allocationA.map (fun x => centeredX x * centeredY x)).sum = 0 ∧
    (allocationB.map (fun x => centeredX x * centeredX x)).sum = 2 ∧
    (allocationB.map (fun x => centeredY x * centeredY x)).sum = 2 ∧
    (allocationB.map (fun x => centeredX x * centeredY x)).sum = -2 := by
  decide

/-- M03.02: integer numerators for two fixed pairs of coin probabilities,
    all expressed with denominator 24. The parity and product numerators
    have denominator 576. -/
theorem m03_coinParityCounts :
    (24 * (6 + 6) - 2 * 6 * 6 : Nat) = 216 ∧
    (24 * (3 + 8) - 2 * 3 * 8 : Nat) = 216 ∧
    (6 * 6 : Nat) = 36 ∧
    (3 * 8 : Nat) = 24 ∧
    ((6, 6) : Nat × Nat) ≠ (3, 8) ∧
    ((6, 6) : Nat × Nat) ≠ (8, 3) := by
  decide

/-- M04.02: two equally weighted lists of binary pairs. -/
def equalBits : List (Nat × Nat) := [(0, 0), (1, 1)]
def oppositeBits : List (Nat × Nat) := [(0, 1), (1, 0)]

/-- Fixed marginal counts, equality-event counts and centered product sums.
    The doubled deviations give covariance numerators with denominator eight. -/
theorem m04_binaryMarginalCounts :
    equalBits.length = 2 ∧ oppositeBits.length = 2 ∧
    equalBits.map Prod.fst = [0, 1] ∧
    oppositeBits.map Prod.fst = [0, 1] ∧
    equalBits.map Prod.snd = [0, 1] ∧
    oppositeBits.map Prod.snd = [1, 0] ∧
    (equalBits.filter (fun x => x.1 == x.2)).length = 2 ∧
    (oppositeBits.filter (fun x => x.1 == x.2)).length = 0 ∧
    (equalBits.map (fun x =>
      (2 * Int.ofNat x.1 - 1) * (2 * Int.ofNat x.2 - 1))).sum = 2 ∧
    (oppositeBits.map (fun x =>
      (2 * Int.ofNat x.1 - 1) * (2 * Int.ofNat x.2 - 1))).sum = -2 := by
  decide

/-- M06.02: deterministic values zero and ten, and their two-point mixture. -/
def mixtureLow : List Int := [0, 0]
def mixtureHigh : List Int := [10, 10]
def mixtureBoth : List Int := [0, 10]

/-- The two fixed within-list centered-square sums vanish, while the
    equal-weight mixture has mean five and centered-square sum fifty. -/
theorem m06_mixtureCounts :
    mixtureLow.length = 2 ∧ mixtureHigh.length = 2 ∧ mixtureBoth.length = 2 ∧
    mixtureLow.sum = 0 ∧ mixtureHigh.sum = 20 ∧ mixtureBoth.sum = 10 ∧
    (mixtureLow.map (fun x => x * x)).sum = 0 ∧
    (mixtureHigh.map (fun x => (x - 10) * (x - 10))).sum = 0 ∧
    (mixtureBoth.map (fun x => (x - 5) * (x - 5))).sum = 50 := by
  decide

/-- M16.03: swapping components preserves the two fixed equally weighted
    lists up to reversal, yet their equality-event counts differ. -/
theorem m16_swapCounts :
    allocationA.map (fun x => (x.2, x.1)) = allocationA ∧
    allocationB.map (fun x => (x.2, x.1)) = allocationB.reverse ∧
    (allocationA.filter (fun x => x.1 == x.2)).length = 2 ∧
    (allocationB.filter (fun x => x.1 == x.2)).length = 0 ∧
    ((allocationB.map (fun x => (x.2, x.1))).filter
      (fun x => x.1 == x.2)).length = 0 := by
  decide

/-- M09.01: two binary worlds, observed only at input false. -/
def extrapolationWorldA (_ : Bool) : Bool := false
def extrapolationWorldB (x : Bool) : Bool := x

/-- The worlds agree at the sole observed input and disagree at the other input. -/
theorem m09_observationalAgreement :
    extrapolationWorldA false = extrapolationWorldB false ∧
    extrapolationWorldA true ≠ extrapolationWorldB true := by
  decide

/-- M09.02: exact rational risk bound for every positive denominator d
    and prediction numerator r in [0,d]. The two risks are r/d and
    (d-r)/d; the disjunction says at least one is at least one half. -/
theorem m09_worstCaseError (d r : Nat) (hd : 0 < d) (hr : r ≤ d) :
    0 < d ∧ r + (d - r) = d ∧
    (d ≤ 2 * r ∨ d ≤ 2 * (d - r)) := by
  exact ⟨hd, by omega, by omega⟩

/-- Absolute difference of nonnegative integer counts, with no signed underflow. -/
def batch4CountDistance (a b : Nat) : Nat := (a - b) + (b - a)

/-- L1 numerator for a two-element law with a common positive denominator. -/
def batch4PairL1 (p q : Nat × Nat) : Nat :=
  batch4CountDistance p.1 q.1 + batch4CountDistance p.2 q.2

/-- L1 numerator for a three-element law with a common positive denominator. -/
def batch4TripleL1 (p q : Nat × Nat × Nat) : Nat :=
  batch4CountDistance p.1 q.1 + batch4PairL1 p.2 q.2

/-- M05.03: all rational epsilon=e/d with 0<e<d. Both full count
    vectors normalize to d; their L1 numerator is 2e. Restriction to
    the last two outcomes has positive mass e in each world and the
    same L1 numerator. The full TV is e/d and conditional TV is e/e.
    No integer division is used to represent probability normalization. -/
theorem m05_conditioningAmplification (d e : Nat) (he : 0 < e) (hed : e < d) :
    let p : Nat × Nat × Nat := (d - e, e, 0)
    let q : Nat × Nat × Nat := (d - e, 0, e)
    0 < e ∧ e < d ∧
    p.1 + p.2.1 + p.2.2 = d ∧
    q.1 + q.2.1 + q.2.2 = d ∧
    batch4TripleL1 p q = 2 * e ∧
    p.2.1 + p.2.2 = e ∧ q.2.1 + q.2.2 = e ∧
    p.2 = (e, 0) ∧ q.2 = (0, e) ∧
    batch4PairL1 p.2 q.2 = 2 * e := by
  dsimp only [batch4TripleL1, batch4PairL1, batch4CountDistance]
  exact ⟨he, hed, by omega, by omega, by omega, by omega, by omega,
    rfl, rfl, by omega⟩

/-- M11.01: all rational separations t/(2m) in (0,1/4].
    The two binary laws have common denominator 2m. The first
    coordinate distinguishes the labels; the L1 numerator 4t gives
    TV 2*t/(2*m). The finite count representation does not assert
    the later finite-sample minimax result. -/
theorem m11_bernoulliSeparation (m t : Nat) (ht : 0 < t) (hb : 2 * t ≤ m) :
    let p : Nat × Nat := (m + t, m - t)
    let q : Nat × Nat := (m - t, m + t)
    0 < 2 * m ∧
    p.1 + p.2 = 2 * m ∧ q.1 + q.2 = 2 * m ∧
    q.1 < m ∧ m < p.1 ∧ p ≠ q ∧
    batch4PairL1 p q = 4 * t := by
  dsimp only [batch4PairL1, batch4CountDistance]
  refine ⟨by omega, by omega, by omega, by omega, by omega, ?_, by omega⟩
  intro h
  have h' : m + t = m - t := congrArg Prod.fst h
  omega

end AbstractExamples

#print axioms bootstrapSmoke
#print axioms AbstractExamples.m04_noReducedMap
#print axioms AbstractExamples.m08_overlapCounts
#print axioms AbstractExamples.m14_parityLoss
#print axioms AbstractExamples.m16_aggregateAmbiguity
#print axioms AbstractExamples.m02_prefixCounts
#print axioms AbstractExamples.m05_equalMeanCounts
#print axioms AbstractExamples.m16_centeredSums
#print axioms AbstractExamples.m03_coinParityCounts
#print axioms AbstractExamples.m04_binaryMarginalCounts
#print axioms AbstractExamples.m06_mixtureCounts
#print axioms AbstractExamples.m16_swapCounts

#print axioms AbstractExamples.m09_observationalAgreement
#print axioms AbstractExamples.m09_worstCaseError
#print axioms AbstractExamples.m05_conditioningAmplification
#print axioms AbstractExamples.m11_bernoulliSeparation

end FFBBP
