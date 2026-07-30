import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure ActionSpacePackage where
  actionType : Type u
  actionSpaceMeasurable : Prop
  actionSpaceBorel : Prop
  actionSpaceCompact : Prop
  actionSpaceMeasurableClosed : actionSpaceMeasurable
  actionSpaceBorelClosed : actionSpaceBorel
  actionSpaceCompactClosed : actionSpaceCompact

structure ActionSpaceEvidence (A : ActionSpacePackage) where
  actionSpaceMeasurableEvidence : A.actionSpaceMeasurable
  actionSpaceBorelEvidence : A.actionSpaceBorel
  actionSpaceCompactEvidence : A.actionSpaceCompact

def ActionSpaceClosed (A : ActionSpacePackage) : Prop :=
  A.actionSpaceMeasurable ∧ A.actionSpaceBorel ∧ A.actionSpaceCompact

theorem action_space_closed_from_evidence (A : ActionSpacePackage) (E : ActionSpaceEvidence A) :
    ActionSpaceClosed A := by
  exact And.intro E.actionSpaceMeasurableEvidence
    (And.intro E.actionSpaceBorelEvidence E.actionSpaceCompactEvidence)

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse