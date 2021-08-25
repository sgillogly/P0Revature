public class CaseHandler {
    
    public static void ValidateSubjectLine(List<Case> newCases){        
        for(Case currentCase: newCases){
            if(!matchesSubjectFormat(currentCase)){
                String tmp = currentCase.Subject;
                currentCase.Subject = 'Sub: ' + tmp;
            }
            if(currentCase.Status == null){
                currentCase.Status = 'New';
            }
            currentCase.Subject += ' Status: ' + currentCase.Status;
        }
    }
    
    public static Boolean matchesSubjectFormat(Case currCase){
        String caseSubject = currCase.Subject;
        if(caseSubject == null){
            return false;
        }
        return caseSubject.IndexOf('Sub: ') == 0;
    }
}