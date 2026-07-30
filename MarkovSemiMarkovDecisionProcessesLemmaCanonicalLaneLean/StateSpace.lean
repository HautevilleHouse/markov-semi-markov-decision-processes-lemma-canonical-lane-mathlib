import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure StateSpacePackage where
  stateType : Type u
  stateSpaceMeasurable : Prop
  stateSpaceBorel : Prop
  stateSpacePolish : Prop
  stateSpaceMeasurableClosed : stateSpaceMeasurable
  stateSpaceBorelClosed : stateSpaceBorel
  stateSpacePolishClosed : stateSpacePolish

structure StateSpaceEvidence (S : StateSpacePackage) where
  stateSpaceMeasurableEvidence : S.stateSpaceMeasurable
  stateSpaceBorelEvidence : S.stateSpaceBorel
  stateSpacePolishEvidence : S.stateSpacePolish

def StateSpaceClosed (S : StateSpacePackage) : Prop :=
  S.stateSpaceMeasurable ∧ S.stateSpaceBorel ∧ S.stateSpacePolish

theorem state_space_closed_from_evidence (S : StateSpacePackage) (E : StateSpaceEvidence S) :
    StateSpaceClosed S := by
  exact And.intro E.stateSpaceMeasurableEvidence
    (And.intro E.stateSpaceBorelEvidence E.stateSpacePolishEvidence)

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse