import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure MajorityAdmittedObject where
  codeLength : Nat
  decodingRadius : Nat
  uniqueDecoding : Prop
  conclusion : uniqueDecoding

def MajorityWitnessClosed (O : MajorityAdmittedObject) : Prop :=
  O.uniqueDecoding

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse