import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.MarkovDecisionProcessFoundation

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure HoldingTimeDistribution (S : Type u) (A : Type v) where
  distribution : S → A → S → Set (ℝ) → ℝ
  nonneg : ∀ s a s' I, distribution s a s' I ≥ 0

structure SemiMarkovDecisionProcess (S : Type u) (A : Type v) extends MarkovDecisionProcess S A where
  holdingTime : HoldingTimeDistribution S A
  transitionKernel : MarkovKernel S A
  transitionKernelConsistent : ∀ s a s', transition.kernel s a s' = holdingTime.distribution s a s' Set.univ

structure SMDPAdmissibleObject (S : Type u) (A : Type v) where
  smdp : SemiMarkovDecisionProcess S A
  optimalValue : OptimalValueFunction S A smdp.toMarkovDecisionProcess

structure SMDPAdmissibleClass where
  object : SMDPAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def gateClosed (A : SMDPAdmissibleClass) : Prop := A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : SMDPAdmissibleClass) : gateClosed A := A.gateWitness

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse
