import Mathlib.Data.Nat.Basic

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

/-- Constructive arithmetic proof support for the strict axiom audit.
    Use induction and equality transport rather than arithmetic automation. -/
private theorem repairAddCongr {a b c d : Nat} (h : a = b) (g : c = d) :
    a + c = b + d :=
  (congrArg (fun x : Nat => x + c) h).trans (congrArg (fun x : Nat => b + x) g)

private theorem repairSubCancel (a b : Nat) : (a + b) - b = a := by
  induction b with
  | zero => rfl
  | succ b ih =>
    exact (Nat.succ_sub_succ (a + b) b).trans ih

private theorem repairSubSelfAdd (a b : Nat) : a - (a + b) = 0 := by
  induction b with
  | zero => exact Nat.sub_self a
  | succ b ih => exact congrArg Nat.pred ih

private theorem repairSubZeroOfLe {a b : Nat} (h : a ≤ b) : a - b = 0 := by
  obtain ⟨k, hk⟩ := Nat.le.dest h
  exact Eq.mp (congrArg (fun x : Nat => a - x = 0) hk) (repairSubSelfAdd a k)

private theorem repairAddSubOfLe {a b : Nat} (h : a ≤ b) : a + (b - a) = b := by
  obtain ⟨k, hk⟩ := Nat.le.dest h
  calc
    a + (b - a) = a + ((k + a) - a) :=
      congrArg (fun x : Nat => a + (x - a)) (hk.symm.trans (Nat.add_comm a k))
    _ = a + k := congrArg (fun x : Nat => a + x) (repairSubCancel k a)
    _ = b := hk

private theorem repairFourMul (n : Nat) : 4 * n = (n + n) + (n + n) := by
  calc
    4 * n = 3 * n + n := Nat.succ_mul 3 n
    _ = (2 * n + n) + n := congrArg (fun x : Nat => x + n) (Nat.succ_mul 2 n)
    _ = ((n + n) + n) + n :=
      congrArg (fun x : Nat => (x + n) + n) (Nat.two_mul n)
    _ = (n + n) + (n + n) := Nat.add_assoc (n + n) n n

/-- M09.02: exact rational risk bound for every positive denominator d
    and prediction numerator r in [0,d]. The two risks are r/d and
    (d-r)/d; the disjunction says at least one is at least one half. -/
theorem m09_worstCaseError (d r : Nat) (hd : 0 < d) (hr : r ≤ d) :
    0 < d ∧ r + (d - r) = d ∧
    (d ≤ 2 * r ∨ d ≤ 2 * (d - r)) := by
  have hs : r + (d - r) = d := repairAddSubOfLe hr
  refine ⟨hd, hs, ?_⟩
  cases Nat.le_total r (d - r) with
  | inl h =>
    apply Or.inr
    have hh : r + (d - r) ≤ (d - r) + (d - r) :=
      Nat.add_le_add_right h (d - r)
    exact Eq.mp (congrArg (fun x : Nat => d ≤ x) (Nat.two_mul (d - r)).symm)
      (Eq.mp (congrArg (fun x : Nat => x ≤ (d - r) + (d - r)) hs) hh)
  | inr h =>
    apply Or.inl
    have hh : r + (d - r) ≤ r + r := Nat.add_le_add_left h r
    exact Eq.mp (congrArg (fun x : Nat => d ≤ x) (Nat.two_mul r).symm)
      (Eq.mp (congrArg (fun x : Nat => x ≤ r + r) hs) hh)

/-- Absolute difference of nonnegative integer counts, with no signed underflow. -/
def batch4CountDistance (a b : Nat) : Nat := (a - b) + (b - a)

/-- L1 numerator for a two-element law with a common positive denominator. -/
def batch4PairL1 (p q : Nat × Nat) : Nat :=
  batch4CountDistance p.1 q.1 + batch4CountDistance p.2 q.2

/-- L1 numerator for a three-element law with a common positive denominator. -/
def batch4TripleL1 (p q : Nat × Nat × Nat) : Nat :=
  batch4CountDistance p.1 q.1 + batch4PairL1 p.2 q.2

private theorem repairDistanceOfLe {a b : Nat} (h : a ≤ b) :
    batch4CountDistance a b = b - a :=
  (congrArg (fun x : Nat => x + (b - a)) (repairSubZeroOfLe h)).trans
    (Nat.zero_add (b - a))

private theorem repairDistanceOfGe {a b : Nat} (h : b ≤ a) :
    batch4CountDistance a b = a - b :=
  (congrArg (fun x : Nat => (a - b) + x) (repairSubZeroOfLe h)).trans
    (Nat.add_zero (a - b))

private theorem repairPairOpposite (n : Nat) :
    batch4PairL1 (n, 0) (0, n) = 2 * n := by
  change batch4CountDistance n 0 + batch4CountDistance 0 n = 2 * n
  calc
    _ = (n - 0) + (n - 0) :=
      repairAddCongr (repairDistanceOfGe (Nat.zero_le n))
        (repairDistanceOfLe (Nat.zero_le n))
    _ = n + n := rfl
    _ = 2 * n := (Nat.two_mul n).symm

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
  have hs : (d - e) + e = d :=
    (Nat.add_comm (d - e) e).trans (repairAddSubOfLe (Nat.le_of_lt hed))
  refine ⟨he, hed, hs, hs, ?_, rfl, Nat.zero_add e, rfl, rfl, repairPairOpposite e⟩
  change batch4CountDistance (d - e) (d - e) + batch4PairL1 (e, 0) (0, e) = 2 * e
  have hz : batch4CountDistance (d - e) (d - e) = 0 :=
    (repairDistanceOfLe (Nat.le_refl (d - e))).trans (Nat.sub_self (d - e))
  calc
    _ = 0 + 2 * e := repairAddCongr hz (repairPairOpposite e)
    _ = 2 * e := Nat.zero_add _

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
  have hdouble : t + t ≤ m := Eq.mp
    (congrArg (fun x : Nat => x ≤ m) (Nat.two_mul t)) hb
  have htm : t ≤ m := Nat.le_trans (Nat.le_add_right t t) hdouble
  have hm : 0 < m := Nat.lt_of_lt_of_le ht htm
  have hs : t + (m - t) = m := repairAddSubOfLe htm
  have htotal : (m + t) + (m - t) = 2 * m := calc
    (m + t) + (m - t) = m + (t + (m - t)) := Nat.add_assoc m t (m - t)
    _ = m + m := congrArg (fun x : Nat => m + x) hs
    _ = 2 * m := (Nat.two_mul m).symm
  have hlt : m - t < m := Nat.sub_lt hm ht
  have hgt : m < m + t := Nat.lt_add_of_pos_right ht
  have hle : m - t ≤ m + t :=
    Nat.le_trans (Nat.sub_le m t) (Nat.le_add_right m t)
  have hgapAdd : (t + t) + (m - t) = m + t := calc
    (t + t) + (m - t) = t + (t + (m - t)) := Nat.add_assoc t t (m - t)
    _ = t + m := congrArg (fun x : Nat => t + x) hs
    _ = m + t := Nat.add_comm t m
  have hgap : (m + t) - (m - t) = t + t := calc
    _ = ((t + t) + (m - t)) - (m - t) :=
      congrArg (fun x : Nat => x - (m - t)) hgapAdd.symm
    _ = t + t := repairSubCancel (t + t) (m - t)
  refine ⟨Nat.mul_pos (by decide) hm, htotal,
    (Nat.add_comm (m - t) (m + t)).trans htotal, hlt, hgt, ?_, ?_⟩
  · intro h
    exact (Nat.ne_of_lt (Nat.lt_trans hlt hgt)) (congrArg Prod.fst h).symm
  · change batch4CountDistance (m + t) (m - t) +
      batch4CountDistance (m - t) (m + t) = 4 * t
    calc
      _ = ((m + t) - (m - t)) + ((m + t) - (m - t)) :=
        repairAddCongr (repairDistanceOfGe hle) (repairDistanceOfLe hle)
      _ = (t + t) + (t + t) := repairAddCongr hgap hgap
      _ = 4 * t := (repairFourMul t).symm

private theorem repairMulLeRight {a b : Nat} (h : a ≤ b) (k : Nat) :
    a * k ≤ b * k := by
  induction k with
  | zero => exact Nat.le_refl 0
  | succ k ih => exact Nat.add_le_add ih h

private theorem repairMulLeLeft {a b : Nat} (h : a ≤ b) (k : Nat) :
    k * a ≤ k * b := by
  rw [Nat.mul_comm k a, Nat.mul_comm k b]
  exact repairMulLeRight h k

private theorem repairPowLe {a b : Nat} (h : a ≤ b) (n : Nat) :
    a ^ n ≤ b ^ n := by
  induction n with
  | zero => exact Nat.le_refl 1
  | succ n ih =>
    exact Nat.le_trans (repairMulLeRight ih a) (repairMulLeLeft h (b ^ n))

private theorem repairMulAdd (a b c : Nat) : a * (b + c) = a * b + a * c := by
  induction c with
  | zero => rfl
  | succ c ih =>
    change a * (b + c) + a = a * b + (a * c + a)
    exact (congrArg (fun x : Nat => x + a) ih).trans
      (Nat.add_assoc (a * b) (a * c) a)

private theorem repairMulAssoc (a b c : Nat) : (a * b) * c = a * (b * c) := by
  induction c with
  | zero => rfl
  | succ c ih =>
    change (a * b) * c + a * b = a * (b * c + b)
    exact (congrArg (fun x : Nat => x + a * b) ih).trans
      (repairMulAdd a (b * c) b).symm

private theorem repairMulPow (a b k : Nat) : (a * b) ^ k = a ^ k * b ^ k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (a * b) ^ k * (a * b) = (a ^ k * a) * (b ^ k * b)
    calc
      _ = (a ^ k * b ^ k) * (a * b) := congrArg (fun x : Nat => x * (a * b)) ih
      _ = a ^ k * (b ^ k * (a * b)) := repairMulAssoc (a ^ k) (b ^ k) (a * b)
      _ = a ^ k * ((b ^ k * a) * b) :=
        congrArg (fun x : Nat => a ^ k * x) (repairMulAssoc (b ^ k) a b).symm
      _ = a ^ k * ((a * b ^ k) * b) :=
        congrArg (fun x : Nat => a ^ k * (x * b)) (Nat.mul_comm (b ^ k) a)
      _ = a ^ k * (a * (b ^ k * b)) :=
        congrArg (fun x : Nat => a ^ k * x) (repairMulAssoc a (b ^ k) b)
      _ = (a ^ k * a) * (b ^ k * b) :=
        (repairMulAssoc (a ^ k) a (b ^ k * b)).symm

/-- M05.04: the all-zero word and its complement for a horizon h.
    With rational epsilon=e/d, the independent-word mass of the
    all-zero event is (d-e)^h/d^h. The two-event count vectors give
    the exact L1 numerator; for a point mass the complement event
    captures the full finite-law TV. The two limits remain prose. -/
theorem m05_horizonGapCounts (d e h : Nat) (he : 0 < e) (hed : e < d) :
    let total := d ^ h
    let zeroMass := (d - e) ^ h
    0 < total ∧ zeroMass ≤ total ∧
    zeroMass + (total - zeroMass) = total ∧
    batch4PairL1 (total, 0) (zeroMass, total - zeroMass) =
      2 * (total - zeroMass) := by
  have hd : 0 < d := Nat.lt_of_lt_of_le he (Nat.le_of_lt hed)
  have hle : (d - e) ^ h ≤ d ^ h :=
    repairPowLe (Nat.sub_le d e) h
  refine ⟨Nat.pow_pos hd, hle, repairAddSubOfLe hle, ?_⟩
  change batch4CountDistance (d ^ h) ((d - e) ^ h) +
    batch4CountDistance 0 (d ^ h - (d - e) ^ h) = 2 * (d ^ h - (d - e) ^ h)
  calc
    _ = (d ^ h - (d - e) ^ h) + ((d ^ h - (d - e) ^ h) - 0) :=
      repairAddCongr (repairDistanceOfGe hle) (repairDistanceOfLe (Nat.zero_le _))
    _ = (d ^ h - (d - e) ^ h) + (d ^ h - (d - e) ^ h) := rfl
    _ = 2 * (d ^ h - (d - e) ^ h) := (Nat.two_mul _).symm

/-- M07.01: balanced words have k heads and k tails, and both
    candidate likelihoods have denominator 5^(2*k). The numerator
    ratio 6^k/4^k equals 3^k/2^k by positive cross multiplication.
    At common denominator ten the true parameter differs from the
    first candidate by one unit. No convergence theorem is asserted. -/
theorem m07_balancedLikelihoodCounts (k : Nat) :
    0 < (4 : Nat) ^ k ∧ 0 < (2 : Nat) ^ k ∧
    (3 * 2 : Nat) ^ k * 2 ^ k = (4 * 1 : Nat) ^ k * 3 ^ k ∧
    (6 : Nat) - 5 = 1 ∧ (6 : Nat) ≠ 5 ∧ (8 : Nat) ≠ 5 := by
  have hl : (6 : Nat) ^ k * 2 ^ k = (12 : Nat) ^ k :=
    (repairMulPow 6 2 k).symm
  have hr : (4 : Nat) ^ k * 3 ^ k = (12 : Nat) ^ k :=
    (repairMulPow 4 3 k).symm
  exact ⟨Nat.pow_pos (by decide), Nat.pow_pos (by decide),
    hl.trans hr.symm, by decide, by decide, by decide⟩

/-- Six nonnegative integer face masses with a common denominator. -/
structure Batch5DieCounts where
  one : Nat
  two : Nat
  three : Nat
  four : Nat
  five : Nat
  six : Nat

/-- The parity law is fair under denominator 2m, with m positive. -/
def batch5FairParity (m : Nat) (p : Batch5DieCounts) : Prop :=
  0 < m ∧
  p.one + p.three + p.five = m ∧
  p.two + p.four + p.six = m

def batch5DieLow (m : Nat) : Batch5DieCounts := ⟨m, 0, 0, m, 0, 0⟩
def batch5DieHigh (m : Nat) : Batch5DieCounts := ⟨m, m, 0, 0, 0, 0⟩

/-- M13.02: exact identified interval on every rational grid with
    denominator 2m. Necessity uses the even-mass constraint;
    sufficiency constructs a compatible six-face distribution. -/
theorem m13_parityIdentifiedGrid (m u : Nat) (hm : 0 < m) :
    (∃ p : Batch5DieCounts, batch5FairParity m p ∧ p.two = u) ↔ u ≤ m := by
  constructor
  · intro h
    obtain ⟨p, hp, hu⟩ := h
    have heven : p.two + p.four + p.six = m := hp.2.2
    have hle : p.two ≤ m := Nat.le_trans (Nat.le_add_right p.two p.four)
      (Nat.le_trans (Nat.le_add_right (p.two + p.four) p.six) (Nat.le_of_eq heven))
    exact Eq.mp (congrArg (fun x : Nat => x ≤ m) hu) hle
  · intro hu
    refine ⟨⟨m, u, 0, m - u, 0, 0⟩, ?_, rfl⟩
    change 0 < m ∧ m + 0 + 0 = m ∧ u + (m - u) + 0 = m
    exact ⟨hm, rfl, repairAddSubOfLe hu⟩

/-- M13.03: after restricting the model family to the two endpoint
    distributions, the identified set contains only those endpoints. -/
theorem m13_endpointIdentifiedSet (m u : Nat) (hm : 0 < m) :
    (∃ p : Batch5DieCounts,
      (p = batch5DieLow m ∨ p = batch5DieHigh m) ∧
      batch5FairParity m p ∧ p.two = u) ↔ u = 0 ∨ u = m := by
  constructor
  · intro h
    obtain ⟨p, hp, _, hu⟩ := h
    cases hp with
    | inl h =>
      cases h
      exact Or.inl hu.symm
    | inr h =>
      cases h
      exact Or.inr hu.symm
  · intro h
    cases h with
    | inl hu =>
      refine ⟨batch5DieLow m, Or.inl rfl, ?_, hu.symm⟩
      change 0 < m ∧ m + 0 + 0 = m ∧ 0 + m + 0 = m
      exact ⟨hm, rfl, Nat.zero_add m⟩
    | inr hu =>
      refine ⟨batch5DieHigh m, Or.inr rfl, ?_, hu.symm⟩
      change 0 < m ∧ m + 0 + 0 = m ∧ m + 0 + 0 = m
      exact ⟨hm, rfl, rfl⟩

/-- All signed sums for n independent equiprobable -1/+1 increments.
    Repeated list entries retain their multiplicities. -/
def batch5FairSignSums : Nat → List Int
  | 0 => [0]
  | n + 1 => (batch5FairSignSums n).flatMap (fun s => [s - 1, s + 1])

/-- M15.01: finite exact moments of the doubled centered count for
    one, two and four fair trials. The corresponding empirical
    proportion variance is the centered-square sum divided by
    2^n * (2n)^2. The identified-grid endpoints have numerator
    separation two under denominator four. General n, nonfair p,
    and the real square-root formula remain outside this declaration. -/
theorem m15_samplingVarianceCounts :
    (batch5FairSignSums 1).length = 2 ∧
    (batch5FairSignSums 1).sum = 0 ∧
    ((batch5FairSignSums 1).map (fun x => x * x)).sum = 2 ∧
    (batch5FairSignSums 2).length = 4 ∧
    (batch5FairSignSums 2).sum = 0 ∧
    ((batch5FairSignSums 2).map (fun x => x * x)).sum = 8 ∧
    (batch5FairSignSums 4).length = 16 ∧
    (batch5FairSignSums 4).sum = 0 ∧
    ((batch5FairSignSums 4).map (fun x => x * x)).sum = 64 ∧
    (batch5DieLow 2).two = 0 ∧ (batch5DieHigh 2).two = 2 := by
  decide

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

#print axioms AbstractExamples.m05_horizonGapCounts
#print axioms AbstractExamples.m07_balancedLikelihoodCounts
#print axioms AbstractExamples.m13_parityIdentifiedGrid
#print axioms AbstractExamples.m13_endpointIdentifiedSet
#print axioms AbstractExamples.m15_samplingVarianceCounts

end FFBBP
