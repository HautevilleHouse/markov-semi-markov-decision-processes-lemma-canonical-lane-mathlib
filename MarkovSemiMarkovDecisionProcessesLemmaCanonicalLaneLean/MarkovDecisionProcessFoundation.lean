import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure MarkovKernel (S : Type u) (A : Type v) where
  kernel : S → A → S → ℝ
  nonneg : ∀ s a s', kernel s a s' ≥ 0
  sum_one : ∀ s a, ∑ s', kernel s a s' = 1

structure Policy (S : Type u) (A : Type v) where
  decision : S → A → ℝ
  nonneg : ∀ s a, decision s a ≥ 0
  sum_one : ∀ s, ∑ a, decision s a = 1

structure MarkovDecisionProcess (S : Type u) (A : Type v) where
  stateSpace : Type u
  actionSpace : Type v
  states : Set S
  actions : S → Set A
  transition : MarkovKernel S A
  reward : S → A → ℝ
  discountFactor : ℝ
  discountFactorPos : discountFactor > 0
  discountFactorLtOne : discountFactor < 1

structure OptimalValueFunction (S : Type u) (A : Type v) (mdp : MarkovDecisionProcess S A) where
  value : S → ℝ
  satisfiesBellman : ∀ s, value s = max a ∈ mdp.actions s, mdp.reward s a + mdp.discountFactor * ∑ s', mdp.transition.kernel s a s' * value s'

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse
