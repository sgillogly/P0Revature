@isTest
public class CaseHandlerTest {
	@testSetup
    public static void SetupTests(){
        List<Case> testCases = TestHelper.CreateCases(151);
        //insert records to be accessible to other test methods
        Insert testCases;
    }
    
    @isTest
    public static void TP_ValidateSubjectLine(){
        
        Test.startTest();
        
        List<Case> testCases = [SELECT Subject, Status FROM Case LIMIT 10];
        CaseHandler.ValidateSubjectLine(testCases);
        
        System.assertEquals(10, TestHelper.numValid(testCases));
        
        Test.stopTest();
    }
    
    @isTest
    public static void TN_ValidateSubjectLine(){
        Test.startTest();
        
        List<Case> testCases = TestHelper.CreateCases(10);
        CaseHandler.ValidateSubjectLine(testCases);
        
        System.assertEquals(10, TestHelper.numValid(testCases));
        
        Test.stopTest();
    }
    
    @isTest
    public static void TS_ValidateSubjectLine(){
        
        Test.startTest();
        
        List<Case> testCases = [SELECT Subject, Status FROM Case LIMIT 1];
        CaseHandler.ValidateSubjectLine(testCases);
        
        System.assertEquals(1, TestHelper.numValid(testCases));
        
        Test.stopTest();
    }
    
    @isTest
    public static void TB_ValidateSubjectLine(){
        
        Test.startTest();
        
        List<Case> testCases = [SELECT Subject, Status FROM Case LIMIT 151];
        CaseHandler.ValidateSubjectLine(testCases);
        
        System.assertEquals(151, TestHelper.numValid(testCases));
        
        Test.stopTest();
    }
    
    @isTest
    public static void TP_matchesSubjectFormat(){
        
        Test.startTest();
        
        Case testCase = [SELECT Subject FROM Case LIMIT 1];
        Boolean result = CaseHandler.matchesSubjectFormat(testCase);
        
        System.assertEquals(true, result);
        
        Test.stopTest();
    }
    
    @isTest
    public static void TN_matchesSubjectFormat(){
        
        Test.startTest();
        
        Case testCase = new Case();
        Boolean result = CaseHandler.matchesSubjectFormat(testCase);
        
        System.assertEquals(false, result);
        
        Test.stopTest();
    }
}