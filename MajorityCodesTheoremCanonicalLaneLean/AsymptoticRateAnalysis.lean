import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure AsymptoticRatePackage where
  relativeDistance : ℝ
  achievableRate : ℝ
  capacityBound : ℝ
  randomConstructionExists : Prop
  capacityAchieved : Prop
  rateAnalysisClosed : Prop

def AsymptoticRateClosed (R : AsymptoticRatePackage) : Prop :=
  R.rateAnalysisClosed

structure AsymptoticRateEvidence (R : AsymptoticRatePackage) where
  randomConstructionExistsClosed : R.randomConstructionExists
  capacityAchievedClosed : R.capacityAchieved
  rateAnalysisClosedTerm : R.rateAnalysisClosed

theorem asymptotic_rate_closed_from_evidence
    (R : AsymptoticRatePackage) (E : AsymptoticRateEvidence R) :
    AsymptoticRateClosed R := by
  exact E.rateAnalysisClosedTerm

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse