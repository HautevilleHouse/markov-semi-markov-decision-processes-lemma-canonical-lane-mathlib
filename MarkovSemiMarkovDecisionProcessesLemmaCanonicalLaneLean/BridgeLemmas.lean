import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean.SemiMarkovExtension

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean

def bridgeClosed (A : SMDPAdmissibleClass) : Prop := A.object.optimalValue.satisfiesBellman

theorem bridge_from_admissible_class (A : SMDPAdmissibleClass) : bridgeClosed A := by
  have h := A.object.optimalValue.satisfiesBellman
  exact h

end MarkovSemiMarkovDecisionProcessesLemmaCanonicalLaneLean
end HautevilleHouse
