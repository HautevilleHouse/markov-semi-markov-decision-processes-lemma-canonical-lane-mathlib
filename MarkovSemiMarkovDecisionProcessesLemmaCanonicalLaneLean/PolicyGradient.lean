import canonicalLaneMathlib.AdmissibleClass
import MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.OptimalityEquation

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure PolicyGradientPackage {S : StateSpacePackage} {A : ActionSpacePackage}
    {T : TransitionKernelPackage S A} {O : OptimalityEquationPackage S A T} where
  policyClass : Set (S.stateType → A.actionType)
  gradientEstimator : (S.stateType → A.actionType) → (S.stateType → ℝ) → (S.stateType → A.actionType)
  policyImprovement : Prop
  convergenceToOptimal : Prop
  policyImprovementClosed : policyImprovement
  convergenceToOptimalClosed : convergenceToOptimal

structure PolicyGradientEvidence {S : StateSpacePackage} {A : ActionSpacePackage}
    {T : TransitionKernelPackage S A} {O : OptimalityEquationPackage S A T}
    (P : PolicyGradientPackage S A T O) where
  policyImprovementEvidence : P.policyImprovement
  convergenceToOptimalEvidence : P.convergenceToOptimal

def PolicyGradientClosed {S : StateSpacePackage} {A : ActionSpacePackage}
    {T : TransitionKernelPackage S A} {O : OptimalityEquationPackage S A T}
    (P : PolicyGradientPackage S A T O) : Prop :=
  P.policyImprovement ∧ P.convergenceToOptimal

theorem policy_gradient_closed_from_evidence {S : StateSpacePackage} {A : ActionSpacePackage}
    {T : TransitionKernelPackage S A} {O : OptimalityEquationPackage S A T}
    (P : PolicyGradientPackage S A T O) (E : PolicyGradientEvidence P) :
    PolicyGradientClosed P := by
  exact And.intro E.policyImprovementEvidence E.convergenceToOptimalEvidence

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse