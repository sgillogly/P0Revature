@isTest
public class CaseUpdatesTest {
    
    public static string address;
    public static string subject;
    public static string body;

    public static void init()
    {
       address = 'noreply@email.com';
       subject = 'Test Email for Test Class';
       body = 'This is a Test Email for Test Class';
    }

    public static testMethod void Test_sendMail()
    {
        init();
        test.StartTest();    
        CaseUpdates.sendMail(address, subject, body);
        test.StopTest(); 
    }

}