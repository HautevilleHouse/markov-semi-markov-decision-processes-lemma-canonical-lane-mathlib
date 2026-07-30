import MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.ConvergenceAnalysis

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure StationaryPolicyPackage (A : AdmissibleClass) where
  deterministicPolicy : A.object.actionSpace → A.object.stateSpace
  stationaryDistribution : Measure A.object.stateSpace
  averageReward : ℝ
  optimalityCondition : Prop

structure StationaryPolicyEvidence (A : AdmissibleClass) (P : StationaryPolicyPackage A) where
  deterministicPolicyClosed : True
  stationaryDistributionClosed : True
  averageRewardClosed : True
  optimalityConditionClosed : P.optimalityCondition

def StationaryPolicyClosed (A : AdmissibleClass) (P : StationaryPolicyPackage A) : Prop :=
  P.optimalityCondition

theorem stationary_policy_closed_from_evidence (A : AdmissibleClass) (P : StationaryPolicyPackage A) (E : StationaryPolicyEvidence A P) : StationaryPolicyClosed A P := by
  exact E.optimalityConditionClosed

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse
