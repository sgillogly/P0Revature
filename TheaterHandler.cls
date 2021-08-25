public class TheaterHandler {
    public static void AddMovie(List<Theater__c> newTheaters){
        List<Movie__c> newMovies = new List<Movie__c>();
        for(Theater__c currTheater : newTheaters){
            Movie__c newMov = new Movie__c();
            newMov.Theater__c = currTheater.Id;
            newMovies.add(newMov);
        }
        Insert newMovies;
    }
}