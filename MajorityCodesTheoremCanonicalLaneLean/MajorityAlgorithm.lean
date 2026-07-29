import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MajorityCodesTheoremCanonicalLaneLean.ListDecoding

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure MajorityAlgorithmPackage (C : CodeConstructionPackage)
    (L : ListDecodingPackage C) where
  majorityFunction : List (C.codewords) → C.codewords
  uniquenessCondition : Prop
  correctness : Prop
  uniquenessConditionHolds : ∀ (xs : List (C.codewords)),
    xs.Nonempty → (∀ (y : C.codewords), y ∈ xs → y = majorityFunction xs) →
    (if (List.count (majorityFunction xs) xs) * 2 > xs.length then
      majorityFunction xs = List.head (List.filter (λ z => z = majorityFunction xs) xs) else True)
  majorityCorrect : ∀ (x : C.codewords) (ys : List (C.codewords)),
    ys = (L.listDecodingAlgorithm x) → majorityFunction ys = x

structure MajorityAlgorithmEvidence {C : CodeConstructionPackage}
    {L : ListDecodingPackage C} (M : MajorityAlgorithmPackage C L) where
  uniquenessConditionHoldsClosed : M.uniquenessConditionHolds
  majorityCorrectClosed : M.majorityCorrect

def MajorityAlgorithmClosed {C : CodeConstructionPackage}
    {L : ListDecodingPackage C} (M : MajorityAlgorithmPackage C L) : Prop :=
  M.uniquenessConditionHolds ∧ M.majorityCorrect

theorem majority_algorithm_closed_from_evidence
    {C : CodeConstructionPackage} {L : ListDecodingPackage C}
    (M : MajorityAlgorithmPackage C L) (E : MajorityAlgorithmEvidence M) :
    MajorityAlgorithmClosed M := by
  exact And.intro E.uniquenessConditionHoldsClosed E.majorityCorrectClosed

end HautevilleHouse
end MajorityCodesTheoremCanonicalLaneLean