import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure ListDecodingPackage where
  listSize : Nat
  decodingRadius : Nat
  combinatorialBound : Prop
  majorityAlgorithmFound : Prop
  listDecodingClosed : Prop

def ListDecodingClosed (L : ListDecodingPackage) : Prop :=
  L.listDecodingClosed

structure ListDecodingEvidence (L : ListDecodingPackage) where
  combinatorialBoundClosed : L.combinatorialBound
  majorityAlgorithmFoundClosed : L.majorityAlgorithmFound
  listDecodingClosedTerm : L.listDecodingClosed

theorem list_decoding_closed_from_evidence
    (L : ListDecodingPackage) (E : ListDecodingEvidence L) :
    ListDecodingClosed L := by
  exact E.listDecodingClosedTerm

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse