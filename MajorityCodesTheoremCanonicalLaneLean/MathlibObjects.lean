import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MajorityCodesSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MajorityCodesAdmittedObject where
  space : MajorityCodesSpace
  codeLength : Nat
  messageSpace : Type
  distanceMetric : Prop
  majorityDecodingWorks : Prop
  conclusion : majorityDecodingWorks

structure MajorityCodesEndgameState where
  object : MajorityCodesAdmittedObject

def MajorityCodesWitnessClosed (O : MajorityCodesAdmittedObject) : Prop :=
  O.majorityDecodingWorks

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse