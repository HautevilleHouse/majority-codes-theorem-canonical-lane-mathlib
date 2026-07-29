import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure ErrorCorrectingCodePackage where
  blockLength : Nat
  messageLength : Nat
  minimumDistance : Nat
  codebook : Type
  encodingMap : Type
  decodingMap : Type

structure ErrorCorrectingCodeEvidence (C : ErrorCorrectingCodePackage) where
  minimumDistanceClosed : C.minimumDistance ≥ 3
  encodingInjective : Prop
  decodingCorrectness : Prop
  encodingInjectiveClosed : encodingInjective
  decodingCorrectnessClosed : decodingCorrectness

def ErrorCorrectingCodeClosed (C : ErrorCorrectingCodePackage) : Prop :=
  (C.minimumDistance ≥ 3) ∧ C.encodingInjective ∧ C.decodingCorrectness

theorem error_correcting_code_closed_from_evidence
    (C : ErrorCorrectingCodePackage) (E : ErrorCorrectingCodeEvidence C) :
    ErrorCorrectingCodeClosed C := by
  exact And.intro E.minimumDistanceClosed
    (And.intro E.encodingInjectiveClosed E.decodingCorrectnessClosed)

end HautevilleHouse
end MajorityCodesTheoremCanonicalLaneLean