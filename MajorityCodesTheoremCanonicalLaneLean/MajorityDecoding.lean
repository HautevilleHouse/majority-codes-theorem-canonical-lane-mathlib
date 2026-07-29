import MajorityCodesTheoremCanonicalLaneLean.CodeConstruction

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure MajorityDecodingPackage (C : CodeConstructionPackage) where
  threshold : Prop
  majorityDecisionRule : Prop
  errorCorrectionCapability : Prop
  successProbability : Prop
  thresholdClosed : threshold
  majorityDecisionRuleClosed : majorityDecisionRule
  errorCorrectionCapabilityClosed : errorCorrectionCapability
  successProbabilityClosed : successProbability

structure MajorityDecodingEvidence {C : CodeConstructionPackage}
    (M : MajorityDecodingPackage C) where
  thresholdClosed : M.threshold
  majorityDecisionRuleClosed : M.majorityDecisionRule
  errorCorrectionCapabilityClosed : M.errorCorrectionCapability
  successProbabilityClosed : M.successProbability

def MajorityDecodingClosed {C : CodeConstructionPackage}
    (M : MajorityDecodingPackage C) : Prop :=
  M.threshold ∧ M.majorityDecisionRule ∧ M.errorCorrectionCapability ∧ M.successProbability

theorem majority_decoding_closed_from_evidence {C : CodeConstructionPackage}
    (M : MajorityDecodingPackage C) (E : MajorityDecodingEvidence M) :
    MajorityDecodingClosed M := by
  exact And.intro E.thresholdClosed (And.intro E.majorityDecisionRuleClosed
    (And.intro E.errorCorrectionCapabilityClosed E.successProbabilityClosed))

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse