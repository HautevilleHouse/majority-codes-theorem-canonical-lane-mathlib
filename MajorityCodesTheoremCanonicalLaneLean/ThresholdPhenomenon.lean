import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure ThresholdPhenomenonPackage where
  noiseLevel : ℝ
  errorProbability : ℝ
  thresholdNoise : ℝ
  thresholdExponent : ℝ
  sharpTransition : Prop

def noiseBelowThreshold (T : ThresholdPhenomenonPackage) : Prop :=
  T.noiseLevel < T.thresholdNoise

def thresholdExponentPositive (T : ThresholdPhenomenonPackage) : Prop :=
  T.thresholdExponent > 0

structure ThresholdPhenomenonEvidence (T : ThresholdPhenomenonPackage) where
  noiseBelowThresholdClosed : noiseBelowThreshold T
  sharpTransitionClosed : T.sharpTransition
  thresholdExponentPositiveClosed : thresholdExponentPositive T

def ThresholdPhenomenonClosed (T : ThresholdPhenomenonPackage) : Prop :=
  noiseBelowThreshold T ∧ T.sharpTransition ∧ thresholdExponentPositive T

theorem threshold_phenomenon_closed_from_evidence
    (T : ThresholdPhenomenonPackage) (E : ThresholdPhenomenonEvidence T) :
    ThresholdPhenomenonClosed T := by
  exact And.intro E.noiseBelowThresholdClosed
    (And.intro E.sharpTransitionClosed E.thresholdExponentPositiveClosed)

end HautevilleHouse
end MajorityCodesTheoremCanonicalLaneLean