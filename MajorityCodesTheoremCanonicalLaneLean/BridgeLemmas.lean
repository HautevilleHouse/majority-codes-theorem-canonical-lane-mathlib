import HautevilleHouse.MajorityCodesTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MajorityWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse