import MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.FinalTheorem
import Mathlib.Analysis.Convex.Basic

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure OptimalityEquationsPackage (A : AdmissibleClass) where
  bellmanEquation : Prop
  optimalityCharacterization : Prop
  valueFunctionExistence : Prop
  policyExistence : Prop

structure OptimalityEquationsEvidence (A : AdmissibleClass) (P : OptimalityEquationsPackage A) where
  bellmanEquationClosed : P.bellmanEquation
  optimalityCharacterizationClosed : P.optimalityCharacterization
  valueFunctionExistenceClosed : P.valueFunctionExistence
  policyExistenceClosed : P.policyExistence

def OptimalityEquationsClosed (A : AdmissibleClass) (P : OptimalityEquationsPackage A) : Prop :=
  P.bellmanEquation ∧ P.optimalityCharacterization ∧ P.valueFunctionExistence ∧ P.policyExistence

theorem optimality_equations_closed_from_evidence (A : AdmissibleClass) (P : OptimalityEquationsPackage A) (E : OptimalityEquationsEvidence A P) : OptimalityEquationsClosed A P := by
  exact And.intro E.bellmanEquationClosed (And.intro E.optimalityCharacterizationClosed (And.intro E.valueFunctionExistenceClosed E.policyExistenceClosed))

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse
