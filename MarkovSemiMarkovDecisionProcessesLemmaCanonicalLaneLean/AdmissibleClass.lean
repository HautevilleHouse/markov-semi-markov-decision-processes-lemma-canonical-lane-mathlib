import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure MarkovAdmittedObject where
  stateSpace : Type
  stateTopology : TopologicalSpace stateSpace
  actionSpace : Type
  actionTopology : TopologicalSpace actionSpace
  transitionKernel : stateSpace → actionSpace → stateSpace → ℝ
  rewardFunction : stateSpace → actionSpace → ℝ
  markovProperty : Prop
  stationarity : Prop
  conclusion : markovProperty ∧ stationarity

structure AdmissibleClass where
  object : MarkovAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse