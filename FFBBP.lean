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

end AbstractExamples

#print axioms bootstrapSmoke
#print axioms AbstractExamples.m04_noReducedMap
#print axioms AbstractExamples.m08_overlapCounts
#print axioms AbstractExamples.m14_parityLoss
#print axioms AbstractExamples.m16_aggregateAmbiguity

end FFBBP
