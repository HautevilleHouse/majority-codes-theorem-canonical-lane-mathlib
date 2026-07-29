import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure ReliabilityFunctionPackage where
  rate : ℝ
  reliabilityExponent : ℝ
  codingRate : ℝ
  exponentPositivity : Prop
  rateValidity : Prop

def exponentPositive (R : ReliabilityFunctionPackage) : Prop :=
  R.reliabilityExponent > 0

def rateLessThanCapacity (R : ReliabilityFunctionPackage) : Prop :=
  R.rate < 1.0

structure ReliabilityFunctionEvidence (R : ReliabilityFunctionPackage) where
  exponentPositivityClosed : exponentPositive R
  rateLessThanCapacityClosed : rateLessThanCapacity R
  exponentPositivityRateRelation : R.reliabilityExponent = 1 - R.rate

def ReliabilityFunctionClosed (R : ReliabilityFunctionPackage) : Prop :=
  exponentPositive R ∧ rateLessThanCapacity R ∧ (R.reliabilityExponent = 1 - R.rate)

theorem reliability_function_closed_from_evidence
    (R : ReliabilityFunctionPackage) (E : ReliabilityFunctionEvidence R) :
    ReliabilityFunctionClosed R := by
  exact And.intro E.exponentPositivityClosed
    (And.intro E.rateLessThanCapacityClosed E.exponentPositivityRateRelation)

end HautevilleHouse
end MajorityCodesTheoremCanonicalLaneLean