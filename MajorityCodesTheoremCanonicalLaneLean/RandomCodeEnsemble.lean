import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MajorityCodesTheoremCanonicalLaneLean

structure RandomCodeEnsemblePackage (C : CodeConstructionPackage) where
  ensembleSize : ℕ
  randomSelection : Prop
  averageDistance : ℚ
  probabilityDecodingError : ℚ
  ensembleSizePositive : ensembleSize > 0
  averageDistancePositive : averageDistance > 0
  probabilityDecodingErrorPositive : probabilityDecodingError > 0
  randomSelectionCondition : randomSelection = True

structure RandomCodeEnsembleEvidence {C : CodeConstructionPackage}
    (R : RandomCodeEnsemblePackage C) where
  ensembleSizePositiveClosed : R.ensembleSizePositive
  averageDistancePositiveClosed : R.averageDistancePositive
  probabilityDecodingErrorPositiveClosed : R.probabilityDecodingErrorPositive
  randomSelectionConditionClosed : R.randomSelectionCondition

def RandomCodeEnsembleClosed {C : CodeConstructionPackage}
    (R : RandomCodeEnsemblePackage C) : Prop :=
  R.ensembleSizePositive ∧ R.averageDistancePositive ∧
  R.probabilityDecodingErrorPositive ∧ R.randomSelectionCondition

theorem random_code_ensemble_closed_from_evidence
    {C : CodeConstructionPackage} (R : RandomCodeEnsemblePackage C)
    (E : RandomCodeEnsembleEvidence R) : RandomCodeEnsembleClosed R := by
  exact And.intro E.ensembleSizePositiveClosed
    (And.intro E.averageDistancePositiveClosed
      (And.intro E.probabilityDecodingErrorPositiveClosed E.randomSelectionConditionClosed))

end HautevilleHouse
end MajorityCodesTheoremCanonicalLaneLean