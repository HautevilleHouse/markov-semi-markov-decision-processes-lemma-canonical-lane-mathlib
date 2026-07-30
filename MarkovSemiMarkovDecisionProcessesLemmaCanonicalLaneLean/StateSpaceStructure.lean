import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure MarkovStateSpace where
  stateType : Type u
  measurability : Prop
  actionSpace : stateType -> Type v
  transitionKernel : stateType -> actionSpace stateType -> stateType -> Prop
  measurabilityTerm : measurability

structure SemiMarkovStateSpace (M : MarkovStateSpace) where
  sojournTime : M.stateType -> M.actionSpace M.stateType -> Real
  cumulativeDistribution : Real -> Real -> Prop
  sojournTimeMeasurable : Prop
  sojournTimeMeasurableTerm : sojournTimeMeasurable

structure StateSpaceEvidence (M : MarkovStateSpace) (S : SemiMarkovStateSpace M) where
  measurabilityClosed : M.measurability
  sojournTimeMeasurableClosed : S.sojournTimeMeasurable

def StateSpaceClosed (M : MarkovStateSpace) (S : SemiMarkovStateSpace M) : Prop :=
  M.measurability ∧ S.sojournTimeMeasurable

theorem state_space_closed_from_evidence (M : MarkovStateSpace) (S : SemiMarkovStateSpace M)
    (E : StateSpaceEvidence M S) : StateSpaceClosed M S := by
  exact And.intro E.measurabilityClosed E.sojournTimeMeasurableClosed

end HautevilleHouse
end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean