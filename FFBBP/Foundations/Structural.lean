import Init

namespace FFBBP.StructuralFoundations

universe u v w x

/-- Identifiability means constancy on the fibers of an observation-law map. -/
def Identifiable {Θ : Type u} {L : Type v} {V : Type w}
    (O : Θ → L) (q : Θ → V) : Prop :=
  ∀ a b : Θ, O a = O b → q a = q b

/-- The observation relation and its primitive Lean quotient. -/
def ObservationRel {Θ : Type u} {L : Type v}
    (O : Θ → L) (a b : Θ) : Prop := O a = O b

abbrev ObservationQuotient {Θ : Type u} {L : Type v} (O : Θ → L) :=
  Quot (ObservationRel O)

def observationClass {Θ : Type u} {L : Type v}
    (O : Θ → L) (a : Θ) : ObservationQuotient O :=
  Quot.mk (ObservationRel O) a

/-- The represented law is recoverable from an observation class. -/
def observationValue {Θ : Type u} {L : Type v}
    (O : Θ → L) : ObservationQuotient O → L :=
  Quot.lift O (fun _ _ h => h)

/-- M01.01: construct the factor map on the primitive quotient and prove
    uniqueness pointwise, without function extensionality or choice.
    The converse uses an explicit quotient-soundness premise; we do not
    discharge that premise with the foundational quotient-equality axiom. -/
theorem m01_observationLawFactorization
    {Θ : Type u} {L : Type v} {V : Type w}
    (O : Θ → L) (q : Θ → V) :
    (Identifiable O q →
      ∃ f : ObservationQuotient O → V,
        (∀ a, f (observationClass O a) = q a) ∧
        (∀ g : ObservationQuotient O → V,
          (∀ a, g (observationClass O a) = q a) → ∀ z, g z = f z)) ∧
    ((∀ a b, O a = O b → observationClass O a = observationClass O b) →
      (∃ f : ObservationQuotient O → V,
        ∀ a, f (observationClass O a) = q a) →
      Identifiable O q) := by
  constructor
  · intro h
    let f : ObservationQuotient O → V := Quot.lift q h
    refine ⟨f, fun _ => rfl, ?_⟩
    intro g hg z
    exact Quot.ind (β := fun t : ObservationQuotient O => g t = f t)
      (fun a => hg a) z
  · intro sound h
    obtain ⟨f, hf⟩ := h
    intro a b hab
    exact (hf a).symm.trans ((congrArg f (sound a b hab)).trans (hf b))

/-- Orbit relation induced by a family of transformations. For a group
    action this is the ordinary group-orbit relation. We do not assume
    that an arbitrary indexed family is a group action. -/
def OrbitRelated {G : Type x} {Θ : Type u}
    (act : G → Θ → Θ) (a b : Θ) : Prop :=
  ∃ g, act g a = b

abbrev OrbitQuotient {G : Type x} {Θ : Type u} (act : G → Θ → Θ) :=
  Quot (OrbitRelated act)

def orbitClass {G : Type x} {Θ : Type u}
    (act : G → Θ → Θ) (a : Θ) : OrbitQuotient act :=
  Quot.mk (OrbitRelated act) a

/-- M03.01: a law-preserving family has orbits contained in law fibers.
    Given observation-quotient soundness, construct the quotient map and
    show surjectivity. Given orbit-quotient soundness and exactness as
    well, prove injectivity iff every common-law pair is orbit-related.
    The explicit quotient premises are not discharged using global axioms. -/
theorem m03_orbitQuotientMap
    {G : Type x} {Θ : Type u} {L : Type v}
    (act : G → Θ → Θ) (O : Θ → L)
    (preserves : ∀ g a, O (act g a) = O a) :
    (∀ a b, OrbitRelated act a b → O a = O b) ∧
    ((∀ a b, O a = O b → observationClass O a = observationClass O b) →
      ∃ f : OrbitQuotient act → ObservationQuotient O,
        (∀ a, f (orbitClass act a) = observationClass O a) ∧
        (∀ z : ObservationQuotient O, ∃ y : OrbitQuotient act, f y = z) ∧
        ((∀ a b, OrbitRelated act a b → orbitClass act a = orbitClass act b) →
          (∀ a b, orbitClass act a = orbitClass act b → OrbitRelated act a b) →
          ((∀ y z : OrbitQuotient act, f y = f z → y = z) ↔
            (∀ a b, O a = O b → OrbitRelated act a b)))) := by
  have hpres : ∀ a b, OrbitRelated act a b → O a = O b := by
    intro a b h
    obtain ⟨g, hg⟩ := h
    exact (preserves g a).symm.trans (congrArg O hg)
  refine ⟨hpres, ?_⟩
  intro obsSound
  let f : OrbitQuotient act → ObservationQuotient O :=
    Quot.lift (observationClass O) (fun a b h => obsSound a b (hpres a b h))
  refine ⟨f, fun _ => rfl, ?_, ?_⟩
  · intro z
    exact Quot.ind
      (β := fun t : ObservationQuotient O => ∃ y : OrbitQuotient act, f y = t)
      (fun a => ⟨orbitClass act a, rfl⟩) z
  · intro orbitSound orbitExact
    constructor
    · intro inj a b hab
      have heq : f (orbitClass act a) = f (orbitClass act b) :=
        obsSound a b hab
      exact orbitExact a b (inj (orbitClass act a) (orbitClass act b) heq)
    · intro complete y z
      refine Quot.ind
        (β := fun y' : OrbitQuotient act =>
          ∀ z' : OrbitQuotient act, f y' = f z' → y' = z') ?_ y z
      intro a
      refine Quot.ind
        (β := fun z' : OrbitQuotient act =>
          f (orbitClass act a) = f z' → orbitClass act a = z') ?_
      intro b h
      have hab : O a = O b := congrArg (observationValue O) h
      exact orbitSound a b (complete a b hab)

/-- M08.03: exhaustivity suffices for elimination of a rejected
    alternative, exclusivity alone does not; mutually exclusive and
    exhaustive labels can coexist with overlapping propositions. -/
theorem m08_logicalAlternatives :
    (∀ A B : Prop, (A ∨ B) → ¬ A → B) ∧
    (¬ (∀ A B : Prop, ¬ (A ∧ B) → ¬ A → B)) ∧
    (∃ labelA labelB eventA eventB : Prop,
      (labelA ∨ labelB) ∧ ¬ (labelA ∧ labelB) ∧ eventA ∧ eventB) := by
  refine ⟨?_, ?_, ?_⟩
  · intro A B h hn
    cases h with
    | inl ha => exact False.elim (hn ha)
    | inr hb => exact hb
  · intro h
    exact h False False (fun both => both.1) (fun hf => hf)
  · exact ⟨True, False, True, True, Or.inl True.intro,
      fun both => both.2, True.intro, True.intro⟩

/-- The identified set as a membership predicate, not a confidence set. -/
def IdentifiedSet {Θ : Type u} {L : Type v} {V : Type w}
    (O : Θ → L) (q : Θ → V) (law : L) (value : V) : Prop :=
  ∃ a : Θ, O a = law ∧ q a = value

/-- M13.01: exact singleton, ambiguity and empty-set characterizations
    over arbitrary model, law and value types. Singleton requires both
    compatibility and constancy on the specified fiber. -/
theorem m13_identifiedSetCharacterization
    {Θ : Type u} {L : Type v} {V : Type w}
    (O : Θ → L) (q : Θ → V) (law : L) :
    ((∃ v : V, ∀ w : V, IdentifiedSet O q law w ↔ w = v) ↔
      (∃ a : Θ, O a = law) ∧
      (∀ a b : Θ, O a = law → O b = law → q a = q b)) ∧
    ((∃ v w : V, IdentifiedSet O q law v ∧ IdentifiedSet O q law w ∧ v ≠ w) ↔
      (∃ a b : Θ, O a = law ∧ O b = law ∧ q a ≠ q b)) ∧
    ((∀ v : V, ¬ IdentifiedSet O q law v) ↔ ¬ (∃ a : Θ, O a = law)) := by
  refine ⟨?_, ?_, ?_⟩
  · constructor
    · intro h
      obtain ⟨v, hv⟩ := h
      obtain ⟨a, ha, _⟩ := (hv v).2 rfl
      refine ⟨⟨a, ha⟩, ?_⟩
      intro b c hb hc
      have hqb : q b = v := (hv (q b)).1 ⟨b, hb, rfl⟩
      have hqc : q c = v := (hv (q c)).1 ⟨c, hc, rfl⟩
      exact hqb.trans hqc.symm
    · intro h
      obtain ⟨⟨a, ha⟩, hconst⟩ := h
      refine ⟨q a, ?_⟩
      intro w
      constructor
      · intro hw
        obtain ⟨b, hb, hq⟩ := hw
        exact hq.symm.trans (hconst b a hb ha)
      · intro hw
        exact ⟨a, ha, hw.symm⟩
  · constructor
    · intro h
      obtain ⟨v, w, hv, hw, hne⟩ := h
      obtain ⟨a, ha, hqa⟩ := hv
      obtain ⟨b, hb, hqb⟩ := hw
      exact ⟨a, b, ha, hb, fun he => hne (hqa.symm.trans (he.trans hqb))⟩
    · intro h
      obtain ⟨a, b, ha, hb, hne⟩ := h
      exact ⟨q a, q b, ⟨a, ha, rfl⟩, ⟨b, hb, rfl⟩, hne⟩
  · constructor
    · intro h hc
      obtain ⟨a, ha⟩ := hc
      exact h (q a) ⟨a, ha, rfl⟩
    · intro h v hv
      obtain ⟨a, ha, _⟩ := hv
      exact h ⟨a, ha⟩

/-- M14.03: any common law transformation preserves compatibility of
    previously compatible models, hence can only enlarge the identified
    set. No stochastic-matrix or TV contraction claim is used here. -/
theorem m14_coarseningInclusion
    {Θ : Type u} {L : Type v} {V : Type w} {C : Type x}
    (O : Θ → L) (q : Θ → V) (K : L → C) (law : L) :
    (∀ a : Θ, O a = law → K (O a) = K law) ∧
    (∀ v : V, IdentifiedSet O q law v →
      IdentifiedSet (fun a => K (O a)) q (K law) v) := by
  refine ⟨fun _ h => congrArg K h, ?_⟩
  intro v hv
  obtain ⟨a, ha, hq⟩ := hv
  exact ⟨a, congrArg K ha, hq⟩

end FFBBP.StructuralFoundations
