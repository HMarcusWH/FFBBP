import FFBBP.Foundations.FiniteProbability

namespace FFBBP.PrefixLaws

universe u v w

/-- Sum the masses of the listed outcomes selected by a Boolean event.
    A complete, nonduplicating enumeration and common normalization give
    the usual finite probability interpretation. -/
def eventMass {X : Type u} (weights : X → Nat) (event : X → Bool) :
    List X → Nat
  | [] => 0
  | x :: xs => (if event x then weights x else 0) + eventMass weights event xs

private theorem eventMassCongr {X : Type u} (P Q : X → Nat)
    (event : X → Bool) (xs : List X) (h : ∀ x, P x = Q x) :
    eventMass P event xs = eventMass Q event xs := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    change (if event x then P x else 0) + eventMass P event xs =
      (if event x then Q x else 0) + eventMass Q event xs
    have hh : (if event x then P x else 0) =
        (if event x then Q x else 0) :=
      congrArg (fun n : Nat => if event x then n else 0) (h x)
    exact (congrArg (fun n : Nat => n + eventMass P event xs) hh).trans
      (congrArg (fun n : Nat => (if event x then Q x else 0) + n) ih)

/-- Prefix-event mass under a long-word count law. -/
def prefixMass {X : Type u} [DecidableEq X] (P : List X → Nat)
    (words : List (List X)) (n : Nat) (prefix : List X) : Nat :=
  eventMass P (fun word => decide (word.take n = prefix)) words

/-- M02.01: equality of the complete long-word count laws implies equality
    of every common finite prefix projection and every prefix event mass.
    Common finite support and normalization are part of the interpretation. -/
theorem m02_prefixMarginalization {X : Type u} [DecidableEq X]
    (P Q : List X → Nat) (words : List (List X))
    (agree : ∀ word, P word = Q word) :
    ∀ n prefix, prefixMass P words n prefix = prefixMass Q words n prefix := by
  intro n prefix
  exact eventMassCongr P Q (fun word => decide (word.take n = prefix)) words agree

/-- A cylinder is represented by a finite horizon and a prefix event.
    The type of prefix-event descriptions may be shared across horizons. -/
def PrefixCylinder {E : Type u} {A : Type v}
    (cylinderAt : Nat → A → E) (e : E) : Prop :=
  ∃ n a, cylinderAt n a = e

/-- Explicit inductively generated event class: cylinders, whole space,
    complement and countable disjoint union. The abstract operations and
    disjointness predicate are supplied by the event representation. -/
inductive CylinderGenerated {E : Type u} (cylinder : E → Prop)
    (whole : E) (comp : E → E) (join : (Nat → E) → E)
    (disjoint : (Nat → E) → Prop) : E → Prop where
  | basic (e : E) : cylinder e →
      CylinderGenerated cylinder whole comp join disjoint e
  | total : CylinderGenerated cylinder whole comp join disjoint whole
  | complement (e : E) :
      CylinderGenerated cylinder whole comp join disjoint e →
      CylinderGenerated cylinder whole comp join disjoint (comp e)
  | disjointJoin (es : Nat → E) : disjoint es →
      (∀ n, CylinderGenerated cylinder whole comp join disjoint (es n)) →
      CylinderGenerated cylinder whole comp join disjoint (join es)

/-- M02.02: agreement of all cylinder evaluations extends to the
    generated complement/disjoint-countable-union class under explicit
    complement and countable additivity equations and pointwise congruence
    of the common summation operation. This is an abstract uniqueness
    induction, not a construction of probability measures or a proof
    that the class is the entire product sigma-algebra. The pi-lambda
    generation step and analytic measure properties remain separate. -/
theorem m02_cylinderDynkinUniqueness
    {E : Type u} {A : Type v} {V : Type w}
    (cylinderAt : Nat → A → E) (whole : E)
    (comp : E → E) (join : (Nat → E) → E)
    (disjoint : (Nat → E) → Prop)
    (P Q : E → V) (compMass : V → V) (sumMass : (Nat → V) → V)
    (agree : ∀ n a, P (cylinderAt n a) = Q (cylinderAt n a))
    (totalAgree : P whole = Q whole)
    (pc : ∀ e, P (comp e) = compMass (P e))
    (qc : ∀ e, Q (comp e) = compMass (Q e))
    (pj : ∀ es, disjoint es → P (join es) = sumMass (fun n => P (es n)))
    (qj : ∀ es, disjoint es → Q (join es) = sumMass (fun n => Q (es n)))
    (sumCongr : ∀ f g : Nat → V, (∀ n, f n = g n) → sumMass f = sumMass g) :
    ∀ e, CylinderGenerated (PrefixCylinder cylinderAt) whole comp join disjoint e →
      P e = Q e := by
  intro e he
  induction he with
  | basic e hc =>
    obtain ⟨n, a, h⟩ := hc
    exact Eq.mp (congrArg (fun z : E => P z = Q z) h) (agree n a)
  | total => exact totalAgree
  | complement e _ ih =>
    exact (pc e).trans ((congrArg compMass ih).trans (qc e).symm)
  | disjointJoin es hd _ ih =>
    exact (pj es hd).trans ((sumCongr _ _ ih).trans (qj es hd).symm)

/-- History count obtained by summing future counts over a common list. -/
def historyMass {H : Type u} {F : Type v} (P : H → F → Nat)
    (future : List F) (h : H) : Nat :=
  eventMass (P h) (fun _ => true) future

/-- Exact conditional numerator and denominator, with no integer division. -/
def conditionalCounts {H : Type u} {F : Type v} (P : H → F → Nat)
    (future : List F) (h : H) (f : F) : Nat × Nat :=
  (P h f, historyMass P future h)

/-- M02.04: identical finite joint counts give identical history counts,
    and at every positive-mass history both conditional denominators are
    positive and the future numerator/denominator pairs agree. This covers
    finite rational laws with a common normalization and complete support.
    No conditional value is asserted at a zero-mass history; regular
    conditional measures and their almost-sure uniqueness remain prose. -/
theorem m02_conditionalLawAgreement
    {H : Type u} {F : Type v} (P Q : H → F → Nat) (future : List F)
    (agree : ∀ h f, P h f = Q h f) :
    ∀ h, historyMass P future h = historyMass Q future h ∧
      (0 < historyMass P future h →
        0 < historyMass Q future h ∧
        ∀ f, conditionalCounts P future h f = conditionalCounts Q future h f) := by
  intro h
  have hm : historyMass P future h = historyMass Q future h :=
    eventMassCongr (P h) (Q h) (fun _ => true) future (agree h)
  refine ⟨hm, ?_⟩
  intro hp
  refine ⟨Eq.mp (congrArg (fun n : Nat => 0 < n) hm) hp, ?_⟩
  intro f
  change (P h f, historyMass P future h) = (Q h f, historyMass Q future h)
  exact (congrArg (fun n : Nat => (n, historyMass P future h)) (agree h f)).trans
    (congrArg (fun n : Nat => (Q h f, n)) hm)

end FFBBP.PrefixLaws

namespace FFBBP.MetricExamples

/-- Dirac count at a natural-coordinate site; positions are interpreted
    on a common rational grid with a positive coordinate denominator. -/
def diracCount (point site : Nat) : Nat := if site = point then 1 else 0

def twoDiracL1 : Nat :=
  FiniteProbability.pairRowL1
    [(diracCount 1 0, diracCount 0 0), (diracCount 1 1, diracCount 0 1)]

private theorem leftZero {a b : Nat} (h : a + b = 0) : a = 0 :=
  Nat.le_antisymm (Nat.le_trans (Nat.le_add_right a b) (Nat.le_of_eq h)) (Nat.zero_le a)

private theorem rightZero {a b : Nat} (h : a + b = 0) : b = 0 :=
  Nat.le_antisymm (Nat.le_trans (Nat.le_add_left b a) (Nat.le_of_eq h)) (Nat.zero_le b)

/-- The two-site unit-count coupling has unique entries, with one
    off-diagonal unit, under the stated Dirac marginals. -/
private theorem couplingForced (a b c d : Nat)
    (hab : a + b = 0) (hcd : c + d = 1)
    (_hac : a + c = 1) (hbd : b + d = 0) :
    a = 0 ∧ b = 0 ∧ c = 1 ∧ d = 0 ∧ b + c = 1 := by
  have ha := leftZero hab
  have hb := rightZero hab
  have hd := rightZero hbd
  have hc : c = 1 := (congrArg (fun z : Nat => c + z) hd).symm.trans hcd
  have hcost : b + c = 1 :=
    (congrArg (fun z : Nat => z + c) hb).trans ((Nat.zero_add c).trans hc)
  exact ⟨ha, hb, hc, hd, hcost⟩

/-- M05.02: Dirac counts at 1/n and 0 on every positive rational grid
    have opposite support and L1 numerator two, hence TV one. The unit
    count coupling is forced to have one off-diagonal unit; its ground
    cost numerator is one with coordinate denominator n. For every
    positive threshold denominator k there is a grid d with
    k*costNumerator < d and unchanged L1 numerator, giving cost < 1/k.
    The support witnesses disprove mutual absolute continuity in this
    finite example. Weak convergence and the full real-metric
    Wasserstein definition/limit remain prose. -/
theorem m05_diracMetricSeparation (n : Nat) (hn : 0 < n) :
    0 < n ∧
    diracCount 1 0 = 0 ∧ diracCount 0 0 = 1 ∧
    diracCount 1 1 = 1 ∧ diracCount 0 1 = 0 ∧
    twoDiracL1 = 2 ∧ FiniteProbability.gap 1 0 = 1 ∧
    (∀ a b c d : Nat, a + b = 0 → c + d = 1 → a + c = 1 → b + d = 0 →
      a = 0 ∧ b = 0 ∧ c = 1 ∧ d = 0 ∧ b + c = 1) ∧
    (∀ k : Nat, 0 < k → ∃ d : Nat, 0 < d ∧
      k * FiniteProbability.gap 1 0 < d ∧ twoDiracL1 = 2) := by
  refine ⟨hn, by decide, by decide, by decide, by decide, by decide, by decide,
    couplingForced, ?_⟩
  intro k _
  refine ⟨k + 1, Nat.zero_lt_succ k, ?_, by decide⟩
  change k * 1 < k + 1
  exact Eq.mp (congrArg (fun z : Nat => z < k + 1) (Nat.mul_one k).symm)
    (Nat.lt_succ_self k)

end FFBBP.MetricExamples
