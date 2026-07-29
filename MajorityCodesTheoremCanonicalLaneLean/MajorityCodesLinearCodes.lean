import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure LinearCode (q : Nat) (n : Nat) (k : Nat) where
  fieldSize : q = 2 ^ (Nat.log 2 q)
  length : Nat
  dimension : k ≤ n
  alphabet : Type
  addition : alphabet → alphabet → alphabet
  multiplication : alphabet → alphabet → alphabet
  generatorMatrix : Matrix (Fin k) (Fin n) alphabet
  encoding : Vector alphabet k → Vector alphabet n
  linear : Prop
  linearTerm : linear

structure LinearCodeEvidence {q n k : Nat} (C : LinearCode q n k) where
  linearClosed : C.linear

def LinearCodeClosed {q n k : Nat} (C : LinearCode q n k) : Prop :=
  C.linear

theorem linear_code_closed_from_evidence {q n k : Nat}
    (C : LinearCode q n k) (E : LinearCodeEvidence C) : LinearCodeClosed C :=
  E.linearClosed

end HautevilleHouse
end HautevilleHouse