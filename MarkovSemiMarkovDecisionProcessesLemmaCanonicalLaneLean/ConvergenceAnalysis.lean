import MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.OptimalityEquations
import Mathlib.Topology.MetricSpace.Basic

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure ConvergenceAnalysisPackage (A : AdmissibleClass) where
  valueIterationConvergence : Prop
  policyIterationConvergence : Prop
  fixedPointExistence : Prop
  contractionMapping : Prop

structure ConvergenceAnalysisEvidence (A : AdmissibleClass) (C : ConvergenceAnalysisPackage A) where
  valueIterationConvergenceClosed : C.valueIterationConvergence
  policyIterationConvergenceClosed : C.policyIterationConvergence
  fixedPointExistenceClosed : C.fixedPointExistence
  contractionMappingClosed : C.contractionMapping

def ConvergenceAnalysisClosed (A : AdmissibleClass) (C : ConvergenceAnalysisPackage A) : Prop :=
  C.valueIterationConvergence ∧ C.policyIterationConvergence ∧ C.fixedPointExistence ∧ C.contractionMapping

theorem convergence_analysis_closed_from_evidence (A : AdmissibleClass) (C : ConvergenceAnalysisPackage A) (E : ConvergenceAnalysisEvidence A C) : ConvergenceAnalysisClosed A C := by
  exact And.intro E.valueIterationConvergenceClosed (And.intro E.policyIterationConvergenceClosed (And.intro E.fixedPointExistenceClosed E.contractionMappingClosed))

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse
