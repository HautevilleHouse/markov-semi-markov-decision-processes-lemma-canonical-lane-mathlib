import canonicalLaneMathlib.AdmissibleClass
import MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.StateSpace
import MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.ActionSpace

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure TransitionKernelPackage {S : StateSpacePackage} {A : ActionSpacePackage} where
  kernel : S.stateType → A.actionType → Set (S.stateType × ℝ)
  measurableInStateAction : Prop
  probabilityMeasureInNextState : Prop
  measurableInStateActionClosed : measurableInStateAction
  probabilityMeasureInNextStateClosed : probabilityMeasureInNextState

structure TransitionKernelEvidence {S : StateSpacePackage} {A : ActionSpacePackage}
    (T : TransitionKernelPackage S A) where
  measurableInStateActionEvidence : T.measurableInStateAction
  probabilityMeasureInNextStateEvidence : T.probabilityMeasureInNextState

def TransitionKernelClosed {S : StateSpacePackage} {A : ActionSpacePackage}
    (T : TransitionKernelPackage S A) : Prop :=
  T.measurableInStateAction ∧ T.probabilityMeasureInNextState

theorem transition_kernel_closed_from_evidence {S : StateSpacePackage} {A : ActionSpacePackage}
    (T : TransitionKernelPackage S A) (E : TransitionKernelEvidence T) :
    TransitionKernelClosed T := by
  exact And.intro E.measurableInStateActionEvidence E.probabilityMeasureInNextStateEvidence

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse