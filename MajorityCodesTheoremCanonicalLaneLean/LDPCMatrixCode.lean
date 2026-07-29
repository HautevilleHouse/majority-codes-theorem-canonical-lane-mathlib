import HautevilleHouse.MajorityCodesTheoremCanonicalLaneLean.CodeWordErrorCorrecting

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure ParityCheckMatrix (m n : Nat) where
  rows : Nat
  cols : Nat
  entries : Matrix (Fin m) (Fin n) (Fin 2)

def parityCheckMatrixDimensions {m n : Nat} (H : ParityCheckMatrix m n) : Nat × Nat :=
  (H.rows, H.cols)

def isLowDensity {m n : Nat} (H : ParityCheckMatrix m n) (maxWeight : Nat) : Prop :=
  (∀ i, (Finset.sum (Finset.range H.cols) (λ j => H.entries i j).toNat) ≤ maxWeight) ∧
  (∀ j, (Finset.sum (Finset.range H.rows) (λ i => H.entries i j).toNat) ≤ maxWeight)

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse