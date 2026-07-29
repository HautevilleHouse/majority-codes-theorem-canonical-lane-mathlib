import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure CodeLength (n : Nat) where
  domainSize : Nat
  alphabetCardinality : Nat

def hammingBallVolume (n : Nat) (radius : Nat) : Nat :=
  List.sum (List.range (radius+1)).map (λ r => Nat.choose n r)

def majorityDecoding (n : Nat) (words : List (BitVec n)) (received : BitVec n) : BitVec n :=
  let counts : List (Nat × BitVec n) := words.map (λ w => (0, w))
  received

end MajorityCodesTheoremCanonicalLaneLean
end HautevilleHouse