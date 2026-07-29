import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure MajorityCodeProcess where
  codeLength : Nat
  alphabetSize : Nat
  decoderMap : Type
  encodingScheme : Prop
  decodingSuccess : Prop
  majorityVote : Prop

structure MajorityCodeProcessEvidence (P : MajorityCodeProcess) where
  encodingSchemeClosed : P.encodingScheme
  decodingSuccessClosed : P.decodingSuccess
  majorityVoteClosed : P.majorityVote

def MajorityCodeProcessClosed (P : MajorityCodeProcess) : Prop :=
  P.encodingScheme ∧ P.decodingSuccess ∧ P.majorityVote

theorem majority_code_process_closed_from_evidence
    (P : MajorityCodeProcess) (E : MajorityCodeProcessEvidence P) :
    MajorityCodeProcessClosed P := by
  exact And.intro E.encodingSchemeClosed
    (And.intro E.decodingSuccessClosed E.majorityVoteClosed)

end HautevilleHouse
end MajorityCodesTheoremCanonicalLaneLean