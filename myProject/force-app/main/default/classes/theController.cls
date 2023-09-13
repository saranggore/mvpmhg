public class theController {

   String searchText;
   List<opportunity> results;

   public String getSearchText() {
      return searchText;
   }

   public void setSearchText(String s) {
      searchText = s;
   }

   public List<opportunity> getResults() {
      return results;
   }

   public PageReference doSearch() {
      results = (List<opportunity>)[FIND :searchText RETURNING opportunity(Name,email__c, phone__c)][0];
      return null;
   }

}