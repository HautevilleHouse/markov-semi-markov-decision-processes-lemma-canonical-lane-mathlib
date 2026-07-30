import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.MarkovDecisionProcessFoundation
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.SemiMarkovExtension

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure BellmanOptimalityPackage {F : MarkovDecisionProcessFoundation}
    {S : SemiMarkovExtension F} where
  optimalValueFunction : F.stateSpace → ℝ
  bellmanEquation : ∀ s, optimalValueFunction s = 
    max (fun a => F.rewardFunction s a + 
      ∫ t, (S.holdingTimeDistribution s a t) * (optimalValueFunction (someNextState s a)))
  optimalPolicy : F.stateSpace → F.actionSpace

structure BellmanOptimalityEvidence {F : MarkovDecisionProcessFoundation}
    {S : SemiMarkovExtension F} (B : BellmanOptimalityPackage F S) where
  bellmanEquationClosed : ∀ s, B.bellmanEquation s
  optimalPolicyClosed : ∀ s, B.bellmanEquation s → 
    B.optimalPolicy s = argmax (fun a => F.rewardFunction s a + 
      ∫ t, (S.holdingTimeDistribution s a t) * (B.optimalValueFunction (someNextState s a)))

def BellmanOptimalityClosed {F : MarkovDecisionProcessFoundation}
    {S : SemiMarkovExtension F} (B : BellmanOptimalityPackage F S) : Prop :=
  (∀ s, B.bellmanEquation s) ∧ (∀ s, B.bellmanEquation s → 
    B.optimalPolicy s = argmax (fun a => F.rewardFunction s a + 
      ∫ t, (S.holdingTimeDistribution s a t) * (B.optimalValueFunction (someNextState s a))))

theorem bellman_optimality_closed_from_evidence
    {F : MarkovDecisionProcessFoundation} {S : SemiMarkovExtension F}
    (B : BellmanOptimalityPackage F S) (E : BellmanOptimalityEvidence B) :
    BellmanOptimalityClosed B := by
  exact And.intro E.bellmanEquationClosed E.optimalPolicyClosed

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse