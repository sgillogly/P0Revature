@isTest
public class TheaterHandlerTest {
    
	@testSetup
    public static void SetupTests() {
		List<Theater__c> testTheaters = new List<Theater__c>();
        for(Integer num = 0; num < 151; num++) {
            testTheaters.add(new Theater__c());
        }
        Insert testTheaters;
    }
    @isTest
    public static void TP_AddMovie(){
        Test.startTest();
        List<Theater__c> testTheaters = [SELECT Name FROM Theater__c LIMIT 10];
        TheaterHandler.AddMovie(testTheaters);
        Test.stopTest();
    }
	@isTest
    public static void TRU_AddMovie(){
        User admin = [SELECT name FROM User WHERE Profile.name = 'System Administrator' LIMIT 1];

        Test.startTest();
        System.runAs(admin) {
        	List<Theater__c> testTheaters = [SELECT Name FROM Theater__c LIMIT 1];
        	TheaterHandler.AddMovie(testTheaters);
        Test.stopTest();
    	}
    }
}