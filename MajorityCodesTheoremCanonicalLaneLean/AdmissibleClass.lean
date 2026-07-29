import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : MajorityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MajorityWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse