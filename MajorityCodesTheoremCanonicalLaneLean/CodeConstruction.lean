import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure CodeConstructionPackage where
  alphabetSize : Nat
  blockLength : Nat
  codeSize : Nat
  encodingMap : Type
  minimumDistance : Nat
  errorCorrectionRadius : Nat
  codeConstructionClosed : Prop

def CodeConstructionClosed (C : CodeConstructionPackage) : Prop :=
  C.codeConstructionClosed

structure CodeConstructionEvidence (C : CodeConstructionPackage) where
  codeConstructionClosedTerm : C.codeConstructionClosed

theorem code_construction_closed_from_evidence
    (C : CodeConstructionPackage) (E : CodeConstructionEvidence C) :
    CodeConstructionClosed C := by
  exact E.codeConstructionClosedTerm

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse