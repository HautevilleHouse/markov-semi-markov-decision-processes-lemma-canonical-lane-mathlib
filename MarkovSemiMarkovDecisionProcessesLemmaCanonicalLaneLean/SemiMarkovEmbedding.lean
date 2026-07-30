import MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.StationaryPolicies

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

structure SemiMarkovEmbeddingPackage (A : AdmissibleClass) where
  holdingTimeDistribution : A.object.stateSpace → A.object.actionSpace → Measure ℝ
  embeddedMarkovChain : (A.object.stateSpace × A.object.actionSpace) → Measure (A.object.stateSpace × A.object.actionSpace)
  equivalenceCondition : Prop
  sojournTimeAccounting : Prop

structure SemiMarkovEmbeddingEvidence (A : AdmissibleClass) (E : SemiMarkovEmbeddingPackage A) where
  equivalenceConditionClosed : E.equivalenceCondition
  sojournTimeAccountingClosed : E.sojournTimeAccounting

def SemiMarkovEmbeddingClosed (A : AdmissibleClass) (E : SemiMarkovEmbeddingPackage A) : Prop :=
  E.equivalenceCondition ∧ E.sojournTimeAccounting

theorem semi_markov_embedding_closed_from_evidence (A : AdmissibleClass) (E : SemiMarkovEmbeddingPackage A) (Ev : SemiMarkovEmbeddingEvidence A E) : SemiMarkovEmbeddingClosed A E := by
  exact And.intro Ev.equivalenceConditionClosed Ev.sojournTimeAccountingClosed

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse
