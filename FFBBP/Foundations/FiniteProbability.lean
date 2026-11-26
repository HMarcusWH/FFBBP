import Mathlib.Data.Nat.Basic

namespace FFBBP.FiniteProbability

/- Constructive natural-number arithmetic, retaining the strict empty
   axiom-dependency policy of the earlier checked arithmetic proofs. -/

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

private theorem repairMulLeRight {a b : Nat} (h : a ≤ b) (k : Nat) :
    a * k ≤ b * k := by
  induction k with
  | zero => exact Nat.le_refl 0
  | succ k ih => exact Nat.add_le_add ih h

private theorem repairMulLeLeft {a b : Nat} (h : a ≤ b) (k : Nat) :
    k * a ≤ k * b := by
  rw [Nat.mul_comm k a, Nat.mul_comm k b]
  exact repairMulLeRight h k

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

private theorem addFour (a b c d : Nat) :
    (a + b) + (c + d) = (a + c) + (b + d) := by
  calc
    _ = a + (b + (c + d)) := Nat.add_assoc a b (c + d)
    _ = a + ((b + c) + d) :=
      congrArg (fun x : Nat => a + x) (Nat.add_assoc b c d).symm
    _ = a + ((c + b) + d) :=
      congrArg (fun x : Nat => a + (x + d)) (Nat.add_comm b c)
    _ = a + (c + (b + d)) :=
      congrArg (fun x : Nat => a + x) (Nat.add_assoc c b d)
    _ = (a + c) + (b + d) := (Nat.add_assoc a c (b + d)).symm

private theorem addMul (a b c : Nat) : (a + b) * c = a * c + b * c := by
  calc
    _ = c * (a + b) := Nat.mul_comm (a + b) c
    _ = c * a + c * b := repairMulAdd c a b
    _ = a * c + b * c := repairAddCongr (Nat.mul_comm c a) (Nat.mul_comm c b)

private theorem mulSwap (a b c : Nat) : a * (b * c) = b * (a * c) := by
  calc
    _ = (a * b) * c := (repairMulAssoc a b c).symm
    _ = (b * a) * c := congrArg (fun x : Nat => x * c) (Nat.mul_comm a b)
    _ = b * (a * c) := repairMulAssoc b a c

private theorem cancelRight (a b c : Nat) : b + a ≤ c + a → b ≤ c := by
  induction a with
  | zero => intro h; exact h
  | succ a ih =>
    intro h
    exact ih (Nat.le_of_succ_le_succ h)

private theorem cancelLeft (a b c : Nat) (h : a + b ≤ a + c) : b ≤ c := by
  have hh : b + a ≤ c + a := by
    rw [Nat.add_comm b a, Nat.add_comm c a]
    exact h
  exact cancelRight a b c hh

private theorem subLeFromAdd {a b k : Nat} (h : a ≤ b + k) : a - b ≤ k := by
  cases Nat.le_total a b with
  | inl hab =>
    rw [repairSubZeroOfLe hab]
    exact Nat.zero_le k
  | inr hba =>
    have hs : b + (a - b) = a := repairAddSubOfLe hba
    exact cancelLeft b (a - b) k
      (Eq.mp (congrArg (fun x : Nat => x ≤ b + k) hs.symm) h)

/-- Exact absolute count difference. -/
def gap (a b : Nat) : Nat := (a - b) + (b - a)

private theorem gapSymm (a b : Nat) : gap a b = gap b a :=
  Nat.add_comm (a - b) (b - a)

private theorem gapOfLe {a b : Nat} (h : a ≤ b) : gap a b = b - a :=
  (congrArg (fun x : Nat => x + (b - a)) (repairSubZeroOfLe h)).trans
    (Nat.zero_add (b - a))

private theorem gapOfGe {a b : Nat} (h : b ≤ a) : gap a b = a - b :=
  (gapSymm a b).trans (gapOfLe h)

private theorem gapLeft (a b : Nat) : a ≤ b + gap a b := by
  cases Nat.le_total a b with
  | inl hab => exact Nat.le_trans hab (Nat.le_add_right b (gap a b))
  | inr hba =>
    exact Nat.le_of_eq ((repairAddSubOfLe hba).symm.trans
      (congrArg (fun x : Nat => b + x) (gapOfGe hba).symm))

private theorem gapRight (a b : Nat) : b ≤ a + gap a b := by
  rw [gapSymm a b]
  exact gapLeft b a

private theorem gapLe {a b k : Nat} (hab : a ≤ b + k) (hba : b ≤ a + k) :
    gap a b ≤ k := by
  cases Nat.le_total a b with
  | inl h =>
    rw [gapOfLe h]
    exact subLeFromAdd hba
  | inr h =>
    rw [gapOfGe h]
    exact subLeFromAdd hab

private theorem pathBound (a b c : Nat) : a ≤ c + (gap a b + gap b c) := by
  calc
    a ≤ b + gap a b := gapLeft a b
    _ ≤ (c + gap b c) + gap a b := Nat.add_le_add_right (gapLeft b c) _
    _ = c + (gap b c + gap a b) := Nat.add_assoc _ _ _
    _ = c + (gap a b + gap b c) :=
      congrArg (fun x : Nat => c + x) (Nat.add_comm _ _)

private theorem gapTriangle (a b c : Nat) : gap a c ≤ gap a b + gap b c := by
  apply gapLe (pathBound a b c)
  have h := pathBound c b a
  rw [gapSymm c b, gapSymm b a, Nat.add_comm (gap b c) (gap a b)] at h
  exact h

private theorem gapAdd (a b c d : Nat) :
    gap (a + c) (b + d) ≤ gap a b + gap c d := by
  apply gapLe
  · calc
      a + c ≤ (b + gap a b) + (d + gap c d) :=
        Nat.add_le_add (gapLeft a b) (gapLeft c d)
      _ = (b + d) + (gap a b + gap c d) := addFour _ _ _ _
  · calc
      b + d ≤ (a + gap a b) + (c + gap c d) :=
        Nat.add_le_add (gapRight a b) (gapRight c d)
      _ = (a + c) + (gap a b + gap c d) := addFour _ _ _ _

private theorem subTranslate (a b c : Nat) : (a + c) - (b + c) = a - b := by
  induction c with
  | zero => rfl
  | succ c ih =>
    exact (Nat.succ_sub_succ (a + c) (b + c)).trans ih

private theorem gapTranslate (a b c : Nat) : gap (a + c) (b + c) = gap a b :=
  repairAddCongr (subTranslate a b c) (subTranslate b a c)

private theorem gapScaleOfLe (w : Nat) {a b : Nat} (h : a ≤ b) :
    gap (w * a) (w * b) = w * gap a b := by
  have hs : w * a + w * (b - a) = w * b :=
    (repairMulAdd w a (b - a)).symm.trans
      (congrArg (fun x : Nat => w * x) (repairAddSubOfLe h))
  calc
    _ = w * b - w * a := gapOfLe (repairMulLeLeft h w)
    _ = (w * (b - a) + w * a) - w * a :=
      congrArg (fun x : Nat => x - w * a)
        (hs.symm.trans (Nat.add_comm (w * a) (w * (b - a))))
    _ = w * (b - a) := repairSubCancel _ _
    _ = w * gap a b := congrArg (fun x : Nat => w * x) (gapOfLe h).symm

private theorem gapScale (w a b : Nat) : gap (w * a) (w * b) = w * gap a b := by
  cases Nat.le_total a b with
  | inl h => exact gapScaleOfLe w h
  | inr h =>
    calc
      _ = gap (w * b) (w * a) := gapSymm _ _
      _ = w * gap b a := gapScaleOfLe w h
      _ = w * gap a b := congrArg (fun x : Nat => w * x) (gapSymm b a)

/-- M01.02: for positive prior counts and a common positive likelihood
    count, the updated weights are positive, their common normalizer
    factors, and their odds equal prior odds by cross multiplication. -/
theorem m01_priorOddsCounts (p q l : Nat) (hp : 0 < p) (hq : 0 < q) (hl : 0 < l) :
    0 < p * l ∧ 0 < q * l ∧ 0 < p * l + q * l ∧
    p * l + q * l = (p + q) * l ∧
    (p * l) * q = (q * l) * p := by
  refine ⟨Nat.mul_pos hp hl, Nat.mul_pos hq hl,
    Nat.lt_of_lt_of_le (Nat.mul_pos hp hl) (Nat.le_add_right _ _),
    (addMul p q l).symm, ?_⟩
  calc
    _ = p * (l * q) := repairMulAssoc p l q
    _ = p * (q * l) := congrArg (fun x : Nat => p * x) (Nat.mul_comm l q)
    _ = q * (p * l) := mulSwap p q l
    _ = q * (l * p) := congrArg (fun x : Nat => q * x) (Nat.mul_comm p l)
    _ = (q * l) * p := (repairMulAssoc q l p).symm

/-- Natural-coordinate square; coordinates may be scaled before interpreting risks. -/
def square (n : Nat) : Nat := n * n

private theorem squareMono {a b : Nat} (h : a ≤ b) : square a ≤ square b :=
  Nat.le_trans (repairMulLeRight h a) (repairMulLeLeft h b)

private theorem crossBoundOfLe {u v : Nat} (h : u ≤ v) :
    u * v + u * v ≤ u * u + v * v := by
  let k := v - u
  have hv : u + k = v := repairAddSubOfLe h
  have h1 : u * u + u * k = u * v :=
    (repairMulAdd u u k).symm.trans (congrArg (fun z : Nat => u * z) hv)
  have h2 : u * v + k * v = v * v :=
    (addMul u k v).symm.trans (congrArg (fun z : Nat => z * v) hv)
  have hk : u * k ≤ k * v := by
    rw [Nat.mul_comm k v]
    exact repairMulLeRight h k
  calc
    _ = (u * u + u * k) + u * v :=
      congrArg (fun z : Nat => z + u * v) h1.symm
    _ = u * u + (u * k + u * v) := Nat.add_assoc _ _ _
    _ ≤ u * u + (k * v + u * v) := Nat.add_le_add_left (Nat.add_le_add_right hk _) _
    _ = u * u + (u * v + k * v) :=
      congrArg (fun z : Nat => u * u + z) (Nat.add_comm _ _)
    _ = u * u + v * v := congrArg (fun z : Nat => u * u + z) h2

private theorem crossBound (u v : Nat) : u * v + u * v ≤ u * u + v * v := by
  cases Nat.le_total u v with
  | inl h => exact crossBoundOfLe h
  | inr h =>
    have hh := crossBoundOfLe h
    rw [Nat.mul_comm v u, Nat.add_comm (v * v) (u * u)] at hh
    exact hh

private theorem squareSumBound (u v : Nat) :
    square (u + v) ≤ 2 * (square u + square v) := by
  change (u + v) * (u + v) ≤ 2 * (u * u + v * v)
  calc
    _ = u * (u + v) + v * (u + v) := addMul u v (u + v)
    _ = (u * u + u * v) + (v * u + v * v) :=
      repairAddCongr (repairMulAdd u u v) (repairMulAdd v u v)
    _ = (u * u + u * v) + (v * v + u * v) :=
      congrArg (fun z : Nat => (u * u + u * v) + z)
        ((Nat.add_comm (v * u) (v * v)).trans
          (congrArg (fun z : Nat => v * v + z) (Nat.mul_comm v u)))
    _ = (u * u + v * v) + (u * v + u * v) := addFour _ _ _ _
    _ ≤ (u * u + v * v) + (u * u + v * v) :=
      Nat.add_le_add_left (crossBound u v) _
    _ = 2 * (u * u + v * v) := (Nat.two_mul _).symm

private theorem pointRiskBound (x a b : Nat) :
    square (gap a b) ≤ 2 * (square (gap x a) + square (gap x b)) := by
  have h := gapTriangle a x b
  rw [gapSymm a x] at h
  exact Nat.le_trans (squareMono h) (squareSumBound _ _)

/-- Each entry is a nonnegative estimate coordinate and its integer mass. -/
def estimateMass : List (Nat × Nat) → Nat
  | [] => 0
  | r :: rs => r.2 + estimateMass rs

def riskNumerator (a : Nat) : List (Nat × Nat) → Nat
  | [] => 0
  | r :: rs => r.2 * square (gap r.1 a) + riskNumerator a rs

private theorem riskSumBound (a b : Nat) (rows : List (Nat × Nat)) :
    estimateMass rows * square (gap a b) ≤
      2 * (riskNumerator a rows + riskNumerator b rows) := by
  induction rows with
  | nil =>
    change 0 * square (gap a b) ≤ 2 * (0 + 0)
    rw [Nat.zero_mul]
    exact Nat.zero_le _
  | cons r rs ih =>
    change (r.2 + estimateMass rs) * square (gap a b) ≤
      2 * ((r.2 * square (gap r.1 a) + riskNumerator a rs) +
           (r.2 * square (gap r.1 b) + riskNumerator b rs))
    have hsplit :
        r.2 * (square (gap r.1 a) + square (gap r.1 b)) +
          (riskNumerator a rs + riskNumerator b rs) =
        (r.2 * square (gap r.1 a) + riskNumerator a rs) +
          (r.2 * square (gap r.1 b) + riskNumerator b rs) :=
      (congrArg (fun z : Nat => z + (riskNumerator a rs + riskNumerator b rs))
        (repairMulAdd _ _ _)).trans (addFour _ _ _ _)
    calc
      _ = r.2 * square (gap a b) + estimateMass rs * square (gap a b) :=
        addMul _ _ _
      _ ≤ r.2 * (2 * (square (gap r.1 a) + square (gap r.1 b))) +
          2 * (riskNumerator a rs + riskNumerator b rs) :=
        Nat.add_le_add (repairMulLeLeft (pointRiskBound r.1 a b) r.2) ih
      _ = 2 * (r.2 * (square (gap r.1 a) + square (gap r.1 b))) +
          2 * (riskNumerator a rs + riskNumerator b rs) :=
        repairAddCongr (mulSwap _ _ _) rfl
      _ = 2 * (r.2 * (square (gap r.1 a) + square (gap r.1 b)) +
          (riskNumerator a rs + riskNumerator b rs)) :=
        (repairMulAdd _ _ _).symm
      _ = _ := congrArg (fun z : Nat => 2 * z) hsplit

private theorem fourRiskBound {r s k : Nat} (h : r ≤ s) (hb : k ≤ 2 * (r + s)) :
    k ≤ 4 * s := by
  have hs : r + s ≤ 2 * s := by
    rw [Nat.two_mul]
    exact Nat.add_le_add_right h s
  calc
    k ≤ 2 * (r + s) := hb
    _ ≤ 2 * (2 * s) := repairMulLeLeft hs 2
    _ = 4 * s := (repairMulAssoc 2 2 s).symm

/-- M01.03: arbitrary finite shared-law weighted estimators on natural
    coordinates. Dividing by the positive common mass and coordinate
    scaling gives the two-point squared-risk lower bound. -/
theorem m01_squaredRiskLowerBound (a b : Nat) (rows : List (Nat × Nat))
    (hm : 0 < estimateMass rows) :
    0 < estimateMass rows ∧
    (estimateMass rows * square (gap a b) ≤ 4 * riskNumerator a rows ∨
     estimateMass rows * square (gap a b) ≤ 4 * riskNumerator b rows) := by
  have hb := riskSumBound a b rows
  refine ⟨hm, ?_⟩
  cases Nat.le_total (riskNumerator a rows) (riskNumerator b rows) with
  | inl h => exact Or.inr (fourRiskBound h hb)
  | inr h =>
    rw [Nat.add_comm (riskNumerator a rows) (riskNumerator b rows)] at hb
    exact Or.inl (fourRiskBound h hb)

/-- M10.01: the midpoint has coordinate a+b on the doubled grid.
    Its squared distance to each doubled endpoint is the original
    squared gap, giving the sharp factor 1/4 after scaling back. -/
theorem m10_midpointSharpness (a b : Nat) :
    gap (a + b) (2 * a) = gap a b ∧
    gap (a + b) (2 * b) = gap a b ∧
    square (gap (a + b) (2 * a)) = square (gap a b) ∧
    square (gap (a + b) (2 * b)) = square (gap a b) := by
  have ha : gap (a + b) (2 * a) = gap a b := by
    rw [Nat.two_mul, Nat.add_comm a b]
    exact (gapTranslate b a a).trans (gapSymm b a)
  have hb : gap (a + b) (2 * b) = gap a b := by
    rw [Nat.two_mul]
    exact gapTranslate a b b
  exact ⟨ha, hb, congrArg square ha, congrArg square hb⟩

/-- M08.02: four disjoint event cells encode any two-event finite law.
    The positive total is the denominator; truncated subtraction
    expresses the Frechet lower bound and both upper bounds. -/
theorem m08_intersectionBounds (both onlyA onlyB neither : Nat)
    (h : 0 < both + onlyA + onlyB + neither) :
    let p := both + onlyA
    let q := both + onlyB
    let total := both + onlyA + onlyB + neither
    0 < total ∧ p + q - total ≤ both ∧ both ≤ p ∧ both ≤ q := by
  have hl : (both + onlyA) + (both + onlyB) ≤
      (both + onlyA + onlyB + neither) + both := by
    calc
      _ = (both + onlyA) + (onlyB + both) :=
        congrArg (fun z : Nat => both + onlyA + z) (Nat.add_comm both onlyB)
      _ = (both + onlyA + onlyB) + both := (Nat.add_assoc _ _ _).symm
      _ ≤ _ := Nat.add_le_add_right (Nat.le_add_right (both + onlyA + onlyB) neither) both
  exact ⟨h, subLeFromAdd hl, Nat.le_add_right _ _, Nat.le_add_right _ _⟩

/-- Raw and group-mean squared-moment numerators in common units.
    These summaries are not asserted to be computed conditional means. -/
structure MomentSummary where
  raw : Nat
  meanSquared : Nat

def rawMomentSum : List MomentSummary → Nat
  | [] => 0
  | r :: rs => r.raw + rawMomentSum rs

def meanMomentSum : List MomentSummary → Nat
  | [] => 0
  | r :: rs => r.meanSquared + meanMomentSum rs

def withinMomentSum : List MomentSummary → Nat
  | [] => 0
  | r :: rs => (r.raw - r.meanSquared) + withinMomentSum rs

def validMoments : List MomentSummary → Prop
  | [] => True
  | r :: rs => r.meanSquared ≤ r.raw ∧ validMoments rs

private theorem momentBalance (rows : List MomentSummary) (h : validMoments rows) :
    meanMomentSum rows + withinMomentSum rows = rawMomentSum rows := by
  induction rows with
  | nil => rfl
  | cons r rs ih =>
    change r.meanSquared ≤ r.raw ∧ validMoments rs at h
    change (r.meanSquared + meanMomentSum rs) +
      ((r.raw - r.meanSquared) + withinMomentSum rs) = r.raw + rawMomentSum rs
    calc
      _ = (r.meanSquared + (r.raw - r.meanSquared)) +
          (meanMomentSum rs + withinMomentSum rs) := addFour _ _ _ _
      _ = r.raw + rawMomentSum rs := repairAddCongr (repairAddSubOfLe h.1) (ih h.2)

/-- M06.01: finite moment-numerator decomposition under explicit
    common-unit and moment-order premises. A common positive denominator
    permits normalization. Conditional expectation, existence of the
    moments and the Jensen inequalities are not proved here. -/
theorem m06_totalVarianceNumerators (rows : List MomentSummary) (grand d : Nat)
    (hd : 0 < d) (hv : validMoments rows) (hg : grand ≤ meanMomentSum rows) :
    0 < d ∧ meanMomentSum rows ≤ rawMomentSum rows ∧
    rawMomentSum rows - grand =
      withinMomentSum rows + (meanMomentSum rows - grand) := by
  have h := momentBalance rows hv
  have hm : meanMomentSum rows ≤ rawMomentSum rows :=
    Nat.le_trans (Nat.le_add_right _ _) (Nat.le_of_eq h)
  refine ⟨hd, hm, ?_⟩
  have hs : grand + (meanMomentSum rows - grand) = meanMomentSum rows :=
    repairAddSubOfLe hg
  have he : rawMomentSum rows =
      (withinMomentSum rows + (meanMomentSum rows - grand)) + grand := by
    calc
      _ = meanMomentSum rows + withinMomentSum rows := h.symm
      _ = withinMomentSum rows + meanMomentSum rows := Nat.add_comm _ _
      _ = withinMomentSum rows + (grand + (meanMomentSum rows - grand)) :=
        congrArg (fun z : Nat => withinMomentSum rows + z) hs.symm
      _ = withinMomentSum rows + ((meanMomentSum rows - grand) + grand) :=
        congrArg (fun z : Nat => withinMomentSum rows + z) (Nat.add_comm _ _)
      _ = (withinMomentSum rows + (meanMomentSum rows - grand)) + grand :=
        (Nat.add_assoc _ _ _).symm
  exact (congrArg (fun z : Nat => z - grand) he).trans (repairSubCancel _ _)

/-- A finite channel row: masses of the two input laws and nonnegative
    transition-count weights. Short rows are zero-padded on the right. -/
structure CountChannelRow where
  p : Nat
  q : Nat
  weights : List Nat

def countSum : List Nat → Nat
  | [] => 0
  | w :: ws => w + countSum ws

def channelNormalized (d : Nat) : List CountChannelRow → Prop
  | [] => True
  | r :: rs => countSum r.weights = d ∧ channelNormalized d rs

def inputL1 : List CountChannelRow → Nat
  | [] => 0
  | r :: rs => gap r.p r.q + inputL1 rs

def pairRowL1 : List (Nat × Nat) → Nat
  | [] => 0
  | r :: rs => gap r.1 r.2 + pairRowL1 rs

def scaleRow (p q : Nat) : List Nat → List (Nat × Nat)
  | [] => []
  | w :: ws => (w * p, w * q) :: scaleRow p q ws

def addRows : List (Nat × Nat) → List (Nat × Nat) → List (Nat × Nat)
  | [], ys => ys
  | xs, [] => xs
  | x :: xs, y :: ys => (x.1 + y.1, x.2 + y.2) :: addRows xs ys

def channelOutput : List CountChannelRow → List (Nat × Nat)
  | [] => []
  | r :: rs => addRows (scaleRow r.p r.q r.weights) (channelOutput rs)

private theorem scaledRowL1 (p q : Nat) (ws : List Nat) :
    pairRowL1 (scaleRow p q ws) = countSum ws * gap p q := by
  induction ws with
  | nil =>
    change 0 = 0 * gap p q
    exact (Nat.zero_mul _).symm
  | cons w ws ih =>
    change gap (w * p) (w * q) + pairRowL1 (scaleRow p q ws) =
      (w + countSum ws) * gap p q
    exact (repairAddCongr (gapScale w p q) ih).trans (addMul _ _ _).symm

private theorem rowTriangle (xs ys : List (Nat × Nat)) :
    pairRowL1 (addRows xs ys) ≤ pairRowL1 xs + pairRowL1 ys := by
  induction xs generalizing ys with
  | nil =>
    change pairRowL1 ys ≤ 0 + pairRowL1 ys
    exact Nat.le_of_eq (Nat.zero_add _).symm
  | cons x xs ih =>
    cases ys with
    | nil =>
      change pairRowL1 (x :: xs) ≤ pairRowL1 (x :: xs) + 0
      exact Nat.le_refl _
    | cons y ys =>
      change gap (x.1 + y.1) (x.2 + y.2) + pairRowL1 (addRows xs ys) ≤
        (gap x.1 x.2 + pairRowL1 xs) + (gap y.1 y.2 + pairRowL1 ys)
      calc
        _ ≤ (gap x.1 x.2 + gap y.1 y.2) +
            (pairRowL1 xs + pairRowL1 ys) :=
          Nat.add_le_add (gapAdd x.1 x.2 y.1 y.2) (ih ys)
        _ = _ := addFour _ _ _ _

private theorem channelBound (d : Nat) (rows : List CountChannelRow)
    (hn : channelNormalized d rows) :
    pairRowL1 (channelOutput rows) ≤ d * inputL1 rows := by
  induction rows with
  | nil => exact Nat.le_refl 0
  | cons r rs ih =>
    change countSum r.weights = d ∧ channelNormalized d rs at hn
    have hr : pairRowL1 (scaleRow r.p r.q r.weights) = d * gap r.p r.q :=
      (scaledRowL1 r.p r.q r.weights).trans
        (congrArg (fun z : Nat => z * gap r.p r.q) hn.1)
    change pairRowL1 (addRows (scaleRow r.p r.q r.weights) (channelOutput rs)) ≤
      d * (gap r.p r.q + inputL1 rs)
    calc
      _ ≤ pairRowL1 (scaleRow r.p r.q r.weights) + pairRowL1 (channelOutput rs) :=
        rowTriangle _ _
      _ = d * gap r.p r.q + pairRowL1 (channelOutput rs) :=
        congrArg (fun z : Nat => z + pairRowL1 (channelOutput rs)) hr
      _ ≤ d * gap r.p r.q + d * inputL1 rs := Nat.add_le_add_left (ih hn.2) _
      _ = _ := (repairMulAdd _ _ _).symm

/-- M14.01: arbitrary finite nonnegative integer channel matrices
    (right zero-padding permitted) with common positive row total d.
    Output L1 counts are bounded by d times input L1 counts. Under
    common rational probability normalization this is TV contraction.
    Real-valued kernels and measure-theoretic channels are outside scope. -/
theorem m14_finiteTVContraction (d : Nat) (rows : List CountChannelRow)
    (hd : 0 < d) (hn : channelNormalized d rows) :
    0 < d ∧ pairRowL1 (channelOutput rows) ≤ d * inputL1 rows :=
  ⟨hd, channelBound d rows hn⟩

end FFBBP.FiniteProbability
