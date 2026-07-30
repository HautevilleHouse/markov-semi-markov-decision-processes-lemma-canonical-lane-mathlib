import MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.SemiMarkovExtension

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure OptimalityCriteriaPackage {A : MarkovAdmittedObject} {K : MarkovKernelPackage A}
    (S : SemiMarkovExtensionPackage K) where
  expectedTotalReward : Prop
  optimalValueFunction : Prop
  bellmanOptimality : Prop

structure OptimalityCriteriaEvidence {A : MarkovAdmittedObject} {K : MarkovKernelPackage A}
    {S : SemiMarkovExtensionPackage K} (O : OptimalityCriteriaPackage S) where
  expectedTotalRewardClosed : O.expectedTotalReward
  optimalValueFunctionClosed : O.optimalValueFunction
  bellmanOptimalityClosed : O.bellmanOptimality

def OptimalityCriteriaClosed {A : MarkovAdmittedObject} {K : MarkovKernelPackage A}
    {S : SemiMarkovExtensionPackage K} (O : OptimalityCriteriaPackage S) : Prop :=
  O.expectedTotalReward ∧ O.optimalValueFunction ∧ O.bellmanOptimality

theorem optimality_criteria_closed_from_evidence {A : MarkovAdmittedObject} {K : MarkovKernelPackage A}
    {S : SemiMarkovExtensionPackage K} (O : OptimalityCriteriaPackage S)
    (E : OptimalityCriteriaEvidence O) : OptimalityCriteriaClosed O := by
  exact And.intro E.expectedTotalRewardClosed
    (And.intro E.optimalValueFunctionClosed E.bellmanOptimalityClosed)

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse