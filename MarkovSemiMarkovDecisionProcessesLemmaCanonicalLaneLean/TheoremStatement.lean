import Mathlib

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure MarkovSemiMarkovSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MarkovSemiMarkovAdmittedObject where
  space : MarkovSemiMarkovSpace
  closedCondition : Prop
  optimalityCondition : Prop
  policyModel : Type
  policyTopology : TopologicalSpace policyModel
  optimalPolicyExists : Prop
  conclusion : optimalPolicyExists

structure MarkovSemiMarkovEndgameState where
  object : MarkovSemiMarkovAdmittedObject

def MarkovSemiMarkovWitnessClosed (O : MarkovSemiMarkovAdmittedObject) : Prop :=
  O.optimalPolicyExists

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse