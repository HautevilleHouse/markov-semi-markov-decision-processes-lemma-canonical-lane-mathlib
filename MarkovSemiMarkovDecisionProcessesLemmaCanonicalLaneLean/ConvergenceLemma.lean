import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.MarkovDecisionProcessFoundation
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.SemiMarkovExtension
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.BellmanOptimality

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure ConvergenceLemmaPackage {F : MarkovDecisionProcessFoundation}
    {S : SemiMarkovExtension F} {B : BellmanOptimalityPackage F S} where
  iterationScheme : ℕ → (F.stateSpace → ℝ)
  fixedPoint : F.stateSpace → ℝ
  convergenceRate : ℝ
  contractionProperty : Prop

structure ConvergenceLemmaEvidence {F : MarkovDecisionProcessFoundation}
    {S : SemiMarkovExtension F} {B : BellmanOptimalityPackage F S}
    (C : ConvergenceLemmaPackage F S B) where
  contractionPropertyClosed : C.contractionProperty
  fixedPointClosed : ∃ (V : F.stateSpace → ℝ), 
    (∀ s, V s = max (fun a => F.rewardFunction s a + 
      ∫ t, (S.holdingTimeDistribution s a t) * (V (someNextState s a)))) ∧
    (∀ s, Tendsto (fun n => C.iterationScheme n s) atTop (𝓝 (C.fixedPoint s)))

def ConvergenceLemmaClosed {F : MarkovDecisionProcessFoundation}
    {S : SemiMarkovExtension F} {B : BellmanOptimalityPackage F S}
    (C : ConvergenceLemmaPackage F S B) : Prop :=
  C.contractionProperty ∧ (∃ (V : F.stateSpace → ℝ), 
    (∀ s, V s = max (fun a => F.rewardFunction s a + 
      ∫ t, (S.holdingTimeDistribution s a t) * (V (someNextState s a)))) ∧
    (∀ s, Tendsto (fun n => C.iterationScheme n s) atTop (𝓝 (C.fixedPoint s))))

theorem convergence_lemma_closed_from_evidence
    {F : MarkovDecisionProcessFoundation} {S : SemiMarkovExtension F}
    {B : BellmanOptimalityPackage F S} (C : ConvergenceLemmaPackage F S B)
    (E : ConvergenceLemmaEvidence C) : ConvergenceLemmaClosed C := by
  exact And.intro E.contractionPropertyClosed E.fixedPointClosed

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse