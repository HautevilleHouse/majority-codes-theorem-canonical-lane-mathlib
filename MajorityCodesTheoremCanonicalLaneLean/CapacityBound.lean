import MajorityCodesTheoremCanonicalLaneLean.MajorityDecoding

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure CapacityBoundPackage {C : CodeConstructionPackage}
    (M : MajorityDecodingPackage C) where
  channelModel : Prop
  mutualInformation : Prop
  capacityAchievability : Prop
  converseBound : Prop
  channelModelClosed : channelModel
  mutualInformationClosed : mutualInformation
  capacityAchievabilityClosed : capacityAchievability
  converseBoundClosed : converseBound

structure CapacityBoundEvidence {C : CodeConstructionPackage}
    {M : MajorityDecodingPackage C} (B : CapacityBoundPackage M) where
  channelModelClosed : B.channelModel
  mutualInformationClosed : B.mutualInformation
  capacityAchievabilityClosed : B.capacityAchievability
  converseBoundClosed : B.converseBound

def CapacityBoundClosed {C : CodeConstructionPackage}
    {M : MajorityDecodingPackage C} (B : CapacityBoundPackage M) : Prop :=
  B.channelModel ∧ B.mutualInformation ∧ B.capacityAchievability ∧ B.converseBound

theorem capacity_bound_closed_from_evidence {C : CodeConstructionPackage}
    {M : MajorityDecodingPackage C} (B : CapacityBoundPackage M)
    (E : CapacityBoundEvidence B) : CapacityBoundClosed B := by
  exact And.intro E.channelModelClosed (And.intro E.mutualInformationClosed
    (And.intro E.capacityAchievabilityClosed E.converseBoundClosed))

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse