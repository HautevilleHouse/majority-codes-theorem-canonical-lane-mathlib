import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MajorityCodesTheoremCanonicalLaneLean.MajorityCodesLinearCodes

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure MajorityVotingProtocol {q n k : Nat} (C : LinearCode q n k) where
  voters : Set (Fin n)
  ballotLength : Nat
  majorityFunction : Vector (Fin n) (Fin q) → Fin q
  correctnessCondition : Prop
  errorTolerance : Prop
  correctnessConditionTerm : correctnessCondition
  errorToleranceTerm : errorTolerance

structure MajorityVotingEvidence {q n k : Nat} {C : LinearCode q n k}
    (M : MajorityVotingProtocol C) where
  correctnessConditionClosed : M.correctnessCondition
  errorToleranceClosed : M.errorTolerance

def MajorityVotingClosed {q n k : Nat} {C : LinearCode q n k}
    (M : MajorityVotingProtocol C) : Prop :=
  M.correctnessCondition ∧ M.errorTolerance

theorem majority_voting_closed_from_evidence {q n k : Nat} {C : LinearCode q n k}
    (M : MajorityVotingProtocol C) (E : MajorityVotingEvidence M) :
    MajorityVotingClosed M :=
  And.intro E.correctnessConditionClosed E.errorToleranceClosed

end HautevilleHouse
end HautevilleHouse