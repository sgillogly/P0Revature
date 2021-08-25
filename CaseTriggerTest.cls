@isTest
public class CaseTriggerTest {
	
    @isTest
    public static void ApplyDummyCase() {
        Case DummyCase = new Case();
        insert DummyCase;
        Test.startTest();
        Database.SaveResult result = Database.update(DummyCase, false);
        Test.stopTest();
    }
}