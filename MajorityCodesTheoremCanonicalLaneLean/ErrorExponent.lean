import MajorityCodesTheoremCanonicalLaneLean.CapacityBound

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure ErrorExponentPackage {C : CodeConstructionPackage}
    {M : MajorityDecodingPackage C} (B : CapacityBoundPackage M) where
  randomCodingExponent : Prop
  expurgatedExponent : Prop
  spherePackingExponent : Prop
  errorExponentTightness : Prop
  randomCodingExponentClosed : randomCodingExponent
  expurgatedExponentClosed : expurgatedExponent
  spherePackingExponentClosed : spherePackingExponent
  errorExponentTightnessClosed : errorExponentTightness

structure ErrorExponentEvidence {C : CodeConstructionPackage}
    {M : MajorityDecodingPackage C} {B : CapacityBoundPackage M}
    (E : ErrorExponentPackage B) where
  randomCodingExponentClosed : E.randomCodingExponent
  expurgatedExponentClosed : E.expurgatedExponent
  spherePackingExponentClosed : E.spherePackingExponent
  errorExponentTightnessClosed : E.errorExponentTightness

def ErrorExponentClosed {C : CodeConstructionPackage}
    {M : MajorityDecodingPackage C} {B : CapacityBoundPackage M}
    (E : ErrorExponentPackage B) : Prop :=
  E.randomCodingExponent ∧ E.expurgatedExponent ∧ E.spherePackingExponent ∧ E.errorExponentTightness

theorem error_exponent_closed_from_evidence {C : CodeConstructionPackage}
    {M : MajorityDecodingPackage C} {B : CapacityBoundPackage M}
    (E : ErrorExponentPackage B) (Ev : ErrorExponentEvidence E) :
    ErrorExponentClosed E := by
  exact And.intro Ev.randomCodingExponentClosed (And.intro Ev.expurgatedExponentClosed
    (And.intro Ev.spherePackingExponentClosed Ev.errorExponentTightnessClosed))

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse