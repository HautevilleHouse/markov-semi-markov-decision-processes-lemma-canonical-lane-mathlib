import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.OptimalityEquations

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure ValueIterationAlgorithm {M : MarkovStateSpace} {S : SemiMarkovStateSpace M}
    {Eq : MarkovOptimalityEquation M S} (SEq : SemiMarkovOptimalityEquation Eq) where
  initialGuess : M.stateType -> Real
  iterationMap : (M.stateType -> Real) -> (M.stateType -> Real)
  convergenceRate : Real
  initialGuessTerm : initialGuess
  iterationMapTerm : iterationMap
  convergenceRateTerm : convergenceRate

structure ConvergenceGuarantee {M : MarkovStateSpace} {S : SemiMarkovStateSpace M}
    {Eq : MarkovOptimalityEquation M S} {SEq : SemiMarkovOptimalityEquation Eq}
    (V : ValueIterationAlgorithm SEq) where
  monotoneConvergence : Prop
  limitIsFixedPoint : Prop
  monotoneConvergenceTerm : monotoneConvergence
  limitIsFixedPointTerm : limitIsFixedPoint

structure ValueIterationEvidence {M : MarkovStateSpace} {S : SemiMarkovStateSpace M}
    {Eq : MarkovOptimalityEquation M S} {SEq : SemiMarkovOptimalityEquation Eq}
    {V : ValueIterationAlgorithm SEq} (G : ConvergenceGuarantee V) where
  convergenceRateClosed : V.convergenceRate > 0
  monotoneConvergenceClosed : G.monotoneConvergence
  limitIsFixedPointClosed : G.limitIsFixedPoint

def ValueIterationClosed {M : MarkovStateSpace} {S : SemiMarkovStateSpace M}
    {Eq : MarkovOptimalityEquation M S} {SEq : SemiMarkovOptimalityEquation Eq}
    {V : ValueIterationAlgorithm SEq} (G : ConvergenceGuarantee V) : Prop :=
  V.convergenceRate > 0 ∧ G.monotoneConvergence ∧ G.limitIsFixedPoint

theorem value_iteration_closed_from_evidence
    {M : MarkovStateSpace} {S : SemiMarkovStateSpace M}
    {Eq : MarkovOptimalityEquation M S} {SEq : SemiMarkovOptimalityEquation Eq}
    {V : ValueIterationAlgorithm SEq} (G : ConvergenceGuarantee V)
    (E : ValueIterationEvidence G) : ValueIterationClosed G := by
  exact And.intro E.convergenceRateClosed
    (And.intro E.monotoneConvergenceClosed E.limitIsFixedPointClosed)

end HautevilleHouse
end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean