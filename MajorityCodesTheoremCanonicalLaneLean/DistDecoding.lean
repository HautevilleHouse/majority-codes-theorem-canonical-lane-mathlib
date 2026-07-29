import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure DistanceDecodingPackage (C : CodeConstructionPackage) where
  distanceMetric : C.codewords → C.codewords → ℕ
  hammingDistance : Prop
  minimumDistance : ℕ
  decodingRadius : ℕ
  distanceMetricDefined : distanceMetric = (λ x y => List.length (List.zipWith (λ a b => if a = b then 0 else 1) x y))
  minimumDistancePositive : minimumDistance > 0
  decodingRadiusSufficient : decodingRadius ≤ (minimumDistance - 1) / 2

structure DistanceDecodingEvidence {C : CodeConstructionPackage}
    (D : DistanceDecodingPackage C) where
  hammingDistanceClosed : D.hammingDistance
  minimumDistancePositiveClosed : D.minimumDistancePositive
  decodingRadiusSufficientClosed : D.decodingRadiusSufficient

def DistanceDecodingClosed {C : CodeConstructionPackage}
    (D : DistanceDecodingPackage C) : Prop :=
  D.hammingDistance ∧ D.minimumDistancePositive ∧ D.decodingRadiusSufficient

theorem distance_decoding_closed_from_evidence
    {C : CodeConstructionPackage} (D : DistanceDecodingPackage C)
    (E : DistanceDecodingEvidence D) : DistanceDecodingClosed D := by
  exact And.intro E.hammingDistanceClosed
    (And.intro E.minimumDistancePositiveClosed E.decodingRadiusSufficientClosed)

end HautevilleHouse
end MajorityCodesTheoremCanonicalLaneLean