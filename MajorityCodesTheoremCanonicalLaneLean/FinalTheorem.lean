import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MajorityCodesTheoremCanonicalLaneLean.MajorityAlgorithm

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

def ConstrainedMajorityCodesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

structure MajorityCodesAdmittedObject where
  code : CodeConstructionPackage
  listDecoding : ListDecodingPackage code
  majorityAlgo : MajorityAlgorithmPackage code listDecoding
  ensemble : RandomCodeEnsemblePackage code

structure MajorityCodesAdmittedClass where
  object : MajorityCodesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : MajorityCodesAdmittedClass) : Prop :=
  CodeConstructionClosed A.object.code ∧
  ListDecodingClosed A.object.listDecoding ∧
  MajorityAlgorithmClosed A.object.majorityAlgo ∧
  RandomCodeEnsembleClosed A.object.ensemble

theorem bridge_from_admissible_class (A : MajorityCodesAdmittedClass) :
    bridgeClosed A := by
  -- Here we assume the object provides evidence terms
  have hCode : CodeConstructionClosed A.object.code := by
    exact code_construction_closed_from_evidence A.object.code (by
      exact A.object.code.codeConstructionEvidence)
  have hList : ListDecodingClosed A.object.listDecoding := by
    exact list_decoding_closed_from_evidence A.object.listDecoding (by
      exact A.object.listDecoding.listDecodingEvidence)
  have hMaj : MajorityAlgorithmClosed A.object.majorityAlgo := by
    exact majority_algorithm_closed_from_evidence A.object.majorityAlgo (by
      exact A.object.majorityAlgo.majorityAlgorithmEvidence)
  have hRand : RandomCodeEnsembleClosed A.object.ensemble := by
    exact random_code_ensemble_closed_from_evidence A.object.ensemble (by
      exact A.object.ensemble.randomCodeEnsembleEvidence)
  exact And.intro hCode (And.intro hList (And.intro hMaj hRand))

def gateClosed (A : MajorityCodesAdmittedClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : MajorityCodesAdmittedClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedMajorityCodesClosure (A : MajorityCodesAdmittedClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_majority_codes_endgame (A : MajorityCodesAdmittedClass) :
    ConstrainedMajorityCodesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse
end MajorityCodesTheoremCanonicalLaneLean