import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.StationaryPolicies

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure AverageRewardCriterion {M : MarkovStateSpace} {S : SemiMarkovStateSpace M}
    {P : Policy M} {SP : StationaryPolicy P} (SM : SemiMarkovStationaryPolicy SP) where
  rewardFunction : M.stateType -> M.actionSpace M.stateType -> Real
  averageReward : Real
  optimalPolicyExists : Prop
  averageRewardTerm : averageReward
  optimalPolicyExistsTerm : optimalPolicyExists

structure AverageRewardOptimalityEquation {M : MarkovStateSpace} {S : SemiMarkovStateSpace M}
    {P : Policy M} {SP : StationaryPolicy P} {SM : SemiMarkovStationaryPolicy SP}
    (C : AverageRewardCriterion SM) where
  biasFunction : M.stateType -> Real
  optimalityEquation : Prop
  biasFunctionTerm : biasFunction
  optimalityEquationTerm : optimalityEquation

structure AverageRewardEvidence {M : MarkovStateSpace} {S : SemiMarkovStateSpace M}
    {P : Policy M} {SP : StationaryPolicy P} {SM : SemiMarkovStationaryPolicy SP}
    {C : AverageRewardCriterion SM} (O : AverageRewardOptimalityEquation C) where
  averageRewardClosed : C.averageReward > 0
  optimalityEquationClosed : O.optimalityEquation
  optimalPolicyExistsClosed : C.optimalPolicyExists

def AverageRewardOptimalityClosed {M : MarkovStateSpace} {S : SemiMarkovStateSpace M}
    {P : Policy M} {SP : StationaryPolicy P} {SM : SemiMarkovStationaryPolicy SP}
    {C : AverageRewardCriterion SM} (O : AverageRewardOptimalityEquation C) : Prop :=
  C.averageReward > 0 ∧ O.optimalityEquation ∧ C.optimalPolicyExists

theorem average_reward_optimality_closed_from_evidence
    {M : MarkovStateSpace} {S : SemiMarkovStateSpace M}
    {P : Policy M} {SP : StationaryPolicy P} {SM : SemiMarkovStationaryPolicy SP}
    {C : AverageRewardCriterion SM} (O : AverageRewardOptimalityEquation C)
    (E : AverageRewardEvidence O) : AverageRewardOptimalityClosed O := by
  exact And.intro E.averageRewardClosed
    (And.intro E.optimalityEquationClosed E.optimalPolicyExistsClosed)

end HautevilleHouse
end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean