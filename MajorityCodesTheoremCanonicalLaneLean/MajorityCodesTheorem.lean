import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MajorityCodesTheoremCanonicalLaneLean.JohnsonBound

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure MajorityCodesTheoremStatement {q n k : Nat} {C : LinearCode q n k}
    {M : MajorityVotingProtocol C} {L : ListDecodingParameters M}
    (J : JohnsonBoundParameters L) where
  listSizeAchievable : Prop
  radiusOptimal : Prop
  theoremProved : Prop
  listSizeAchievableTerm : listSizeAchievable
  radiusOptimalTerm : radiusOptimal
  theoremProvedTerm : theoremProved

structure MajorityCodesTheoremEvidence {q n k : Nat} {C : LinearCode q n k}
    {M : MajorityVotingProtocol C} {L : ListDecodingParameters M}
    {J : JohnsonBoundParameters L} (T : MajorityCodesTheoremStatement J) where
  listSizeAchievableClosed : T.listSizeAchievable
  radiusOptimalClosed : T.radiusOptimal
  theoremProvedClosed : T.theoremProved

def MajorityCodesTheoremClosed {q n k : Nat} {C : LinearCode q n k}
    {M : MajorityVotingProtocol C} {L : ListDecodingParameters M}
    {J : JohnsonBoundParameters L} (T : MajorityCodesTheoremStatement J) : Prop :=
  T.listSizeAchievable ∧ T.radiusOptimal ∧ T.theoremProved

theorem majority_codes_theorem_closed_from_evidence {q n k : Nat} {C : LinearCode q n k}
    {M : MajorityVotingProtocol C} {L : ListDecodingParameters M}
    {J : JohnsonBoundParameters L} (T : MajorityCodesTheoremStatement J)
    (E : MajorityCodesTheoremEvidence T) : MajorityCodesTheoremClosed T :=
  And.intro E.listSizeAchievableClosed
    (And.intro E.radiusOptimalClosed E.theoremProvedClosed)

end HautevilleHouse
end HautevilleHouse