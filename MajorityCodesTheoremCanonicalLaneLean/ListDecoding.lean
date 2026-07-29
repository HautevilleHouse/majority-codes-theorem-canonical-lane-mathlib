import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure ListDecodingPackage (C : CodeConstructionPackage) where
  listSizeBound : ℕ
  decodingRadius : ℕ
  listDecodingAlgorithm : C.codewords → List (C.codewords)
  correctness : Prop
  listSizeBoundPositive : listSizeBound > 0
  decodingRadiusNonnegative : decodingRadius ≥ 0
  correctnessCondition : ∀ (x : C.codewords) (y : C.codewords),
    hammingDistance x y ≤ decodingRadius → y ∈ listDecodingAlgorithm x ∧
    (listDecodingAlgorithm x).length ≤ listSizeBound

structure ListDecodingEvidence {C : CodeConstructionPackage}
    (L : ListDecodingPackage C) where
  listSizeBoundPositiveClosed : L.listSizeBoundPositive
  decodingRadiusNonnegativeClosed : L.decodingRadiusNonnegative
  correctnessConditionClosed : L.correctnessCondition

def ListDecodingClosed {C : CodeConstructionPackage}
    (L : ListDecodingPackage C) : Prop :=
  L.listSizeBoundPositive ∧ L.decodingRadiusNonnegative ∧ L.correctnessCondition

theorem list_decoding_closed_from_evidence
    {C : CodeConstructionPackage} (L : ListDecodingPackage C)
    (E : ListDecodingEvidence L) : ListDecodingClosed L := by
  exact And.intro E.listSizeBoundPositiveClosed
    (And.intro E.decodingRadiusNonnegativeClosed E.correctnessConditionClosed)

end HautevilleHouse
end MajorityCodesTheoremCanonicalLaneLean