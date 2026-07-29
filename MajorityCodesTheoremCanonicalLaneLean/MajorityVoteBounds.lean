import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure MajorityVoteBoundsPackage where
  errorProbability : ℝ
  sampleComplexity : ℕ
  reliabilityBound : ℝ
  convergenceRate : ℕ

def errorProbabilitySmall (P : MajorityVoteBoundsPackage) : Prop :=
  P.errorProbability < 0.5

def sampleComplexityFinite (P : MajorityVoteBoundsPackage) : Prop :=
  P.sampleComplexity > 0

structure MajorityVoteBoundsEvidence (P : MajorityVoteBoundsPackage) where
  errorProbabilitySmallClosed : errorProbabilitySmall P
  sampleComplexityFiniteClosed : sampleComplexityFinite P
  reliabilityBoundClosed : P.reliabilityBound > 0.9

def MajorityVoteBoundsClosed (P : MajorityVoteBoundsPackage) : Prop :=
  errorProbabilitySmall P ∧ sampleComplexityFinite P ∧ (P.reliabilityBound > 0.9)

theorem majority_vote_bounds_closed_from_evidence
    (P : MajorityVoteBoundsPackage) (E : MajorityVoteBoundsEvidence P) :
    MajorityVoteBoundsClosed P := by
  exact And.intro E.errorProbabilitySmallClosed
    (And.intro E.sampleComplexityFiniteClosed E.reliabilityBoundClosed)

end HautevilleHouse
end MajorityCodesTheoremCanonicalLaneLean