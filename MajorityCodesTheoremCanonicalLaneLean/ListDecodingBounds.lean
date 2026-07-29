import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MajorityCodesTheoremCanonicalLaneLean.MajorityCodeVoting

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure ListDecodingParameters {q n k : Nat} {C : LinearCode q n k}
    (M : MajorityVotingProtocol C) where
  listSize : Nat
  radius : ℝ
  listDecodingAlgorithm : (Fin q) → Vector (Fin n) (Fin q) → List (Vector (Fin n) (Fin q))
  completenessBound : Prop
  listSizeBound : listSize ≤ n
  completenessBoundTerm : completenessBound
  listSizeBoundTerm : listSizeBound

structure ListDecodingEvidence {q n k : Nat} {C : LinearCode q n k}
    {M : MajorityVotingProtocol C} (L : ListDecodingParameters M) where
  completenessBoundClosed : L.completenessBound
  listSizeBoundClosed : L.listSizeBound

def ListDecodingClosed {q n k : Nat} {C : LinearCode q n k}
    {M : MajorityVotingProtocol C} (L : ListDecodingParameters M) : Prop :=
  L.completenessBound ∧ L.listSizeBound

theorem list_decoding_closed_from_evidence {q n k : Nat} {C : LinearCode q n k}
    {M : MajorityVotingProtocol C} (L : ListDecodingParameters M)
    (E : ListDecodingEvidence L) : ListDecodingClosed L :=
  And.intro E.completenessBoundClosed E.listSizeBoundClosed

end HautevilleHouse
end HautevilleHouse