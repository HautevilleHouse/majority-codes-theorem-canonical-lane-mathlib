import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MajorityCodesTheoremCanonicalLaneLean.ListDecodingBounds

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure JohnsonBoundParameters {q n k : Nat} {C : LinearCode q n k}
    {M : MajorityVotingProtocol C} (L : ListDecodingParameters M) where
  relativeDistance : ℝ
  johnsonRadius : ℝ
  johnsonBoundInequality : Prop
  tightnessCondition : Prop
  johnsonBoundInequalityTerm : johnsonBoundInequality
  tightnessConditionTerm : tightnessCondition

structure JohnsonBoundEvidence {q n k : Nat} {C : LinearCode q n k}
    {M : MajorityVotingProtocol C} {L : ListDecodingParameters M}
    (J : JohnsonBoundParameters L) where
  johnsonBoundInequalityClosed : J.johnsonBoundInequality
  tightnessConditionClosed : J.tightnessCondition

def JohnsonBoundClosed {q n k : Nat} {C : LinearCode q n k}
    {M : MajorityVotingProtocol C} {L : ListDecodingParameters M}
    (J : JohnsonBoundParameters L) : Prop :=
  J.johnsonBoundInequality ∧ J.tightnessCondition

theorem johnson_bound_closed_from_evidence {q n k : Nat} {C : LinearCode q n k}
    {M : MajorityVotingProtocol C} {L : ListDecodingParameters M}
    (J : JohnsonBoundParameters L) (E : JohnsonBoundEvidence J) :
    JohnsonBoundClosed J :=
  And.intro E.johnsonBoundInequalityClosed E.tightnessConditionClosed

end HautevilleHouse
end HautevilleHouse