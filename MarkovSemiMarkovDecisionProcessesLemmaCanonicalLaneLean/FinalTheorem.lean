import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

def ConstrainedSMDPClosure (A : SMDPAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_smdp_endgame (A : SMDPAdmissibleClass) :
    ConstrainedSMDPClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse
