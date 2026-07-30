import MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.OptimalityCriteria

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure PolicyIterationPackage {A : MarkovAdmittedObject} {K : MarkovKernelPackage A}
    {S : SemiMarkovExtensionPackage K} {O : OptimalityCriteriaPackage S} where
  policyImprovement : Prop
  convergenceGuaranteed : Prop
  optimalPolicyExists : Prop

structure PolicyIterationEvidence {A : MarkovAdmittedObject} {K : MarkovKernelPackage A}
    {S : SemiMarkovExtensionPackage K} {O : OptimalityCriteriaPackage S}
    (P : PolicyIterationPackage O) where
  policyImprovementClosed : P.policyImprovement
  convergenceGuaranteedClosed : P.convergenceGuaranteed
  optimalPolicyExistsClosed : P.optimalPolicyExists

def PolicyIterationClosed {A : MarkovAdmittedObject} {K : MarkovKernelPackage A}
    {S : SemiMarkovExtensionPackage K} {O : OptimalityCriteriaPackage S}
    (P : PolicyIterationPackage O) : Prop :=
  P.policyImprovement ∧ P.convergenceGuaranteed ∧ P.optimalPolicyExists

theorem policy_iteration_closed_from_evidence {A : MarkovAdmittedObject} {K : MarkovKernelPackage A}
    {S : SemiMarkovExtensionPackage K} {O : OptimalityCriteriaPackage S}
    (P : PolicyIterationPackage O) (E : PolicyIterationEvidence P) :
    PolicyIterationClosed P := by
  exact And.intro E.policyImprovementClosed
    (And.intro E.convergenceGuaranteedClosed E.optimalPolicyExistsClosed)

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse