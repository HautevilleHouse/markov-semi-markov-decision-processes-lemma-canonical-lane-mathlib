import canonicalLaneMathlib.AdmissibleClass
import MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.TransitionKernel

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure OptimalityEquationPackage {S : StateSpacePackage} {A : ActionSpacePackage}
    {T : TransitionKernelPackage S A} where
  valueFunction : S.stateType → ℝ
  bellmanOperator : (S.stateType → ℝ) → (S.stateType → ℝ)
  fixedPointEquation : Prop
  contractionProperty : Prop
  fixedPointEquationClosed : fixedPointEquation
  contractionPropertyClosed : contractionProperty

structure OptimalityEquationEvidence {S : StateSpacePackage} {A : ActionSpacePackage}
    {T : TransitionKernelPackage S A} (O : OptimalityEquationPackage S A T) where
  fixedPointEquationEvidence : O.fixedPointEquation
  contractionPropertyEvidence : O.contractionProperty

def OptimalityEquationClosed {S : StateSpacePackage} {A : ActionSpacePackage}
    {T : TransitionKernelPackage S A} (O : OptimalityEquationPackage S A T) : Prop :=
  O.fixedPointEquation ∧ O.contractionProperty

theorem optimality_equation_closed_from_evidence {S : StateSpacePackage} {A : ActionSpacePackage}
    {T : TransitionKernelPackage S A} (O : OptimalityEquationPackage S A T)
    (E : OptimalityEquationEvidence O) : OptimalityEquationClosed O := by
  exact And.intro E.fixedPointEquationEvidence E.contractionPropertyEvidence

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse