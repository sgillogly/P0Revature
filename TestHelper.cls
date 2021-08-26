@isTest
public class TestHelper {
	public static List<Case> CreateCases(Integer num){
        List<Case> casesForTesting = new List<Case>();
        for(Integer i=0; i < num; i++){
            casesForTesting.add(new Case(Subject = String.valueOf(i)));
        }
        return casesForTesting;
    }
    
    public static Integer numValid(List<Case> currCases){
        Integer numValid = 0;
        for(Case currCase : currCases){
            if(currCase.Subject.Contains('Sub: ')){
                numValid++;
            }
        }
        return numValid;
    }
}