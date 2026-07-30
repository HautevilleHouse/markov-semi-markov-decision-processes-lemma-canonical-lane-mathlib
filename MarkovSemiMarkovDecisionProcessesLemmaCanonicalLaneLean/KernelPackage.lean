import MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure MarkovKernelPackage (A : MarkovAdmittedObject) where
  transitionKernelProper : Prop
  measurability : Prop
  stochasticity : Prop

structure MarkovKernelEvidence {A : MarkovAdmittedObject} (K : MarkovKernelPackage A) where
  transitionKernelProperClosed : K.transitionKernelProper
  measurabilityClosed : K.measurability
  stochasticityClosed : K.stochasticity

def MarkovKernelClosed {A : MarkovAdmittedObject} (K : MarkovKernelPackage A) : Prop :=
  K.transitionKernelProper ∧ K.measurability ∧ K.stochasticity

theorem markov_kernel_closed_from_evidence {A : MarkovAdmittedObject} (K : MarkovKernelPackage A)
    (E : MarkovKernelEvidence K) : MarkovKernelClosed K := by
  exact And.intro E.transitionKernelProperClosed
    (And.intro E.measurabilityClosed E.stochasticityClosed)

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse