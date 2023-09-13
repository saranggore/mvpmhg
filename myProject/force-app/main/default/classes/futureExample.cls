public class futureExample {
        @AuraEnabled(cacheable=true)

    public static list<string> prfileNames(string searchKey){
        system.debug('****'+searchKey);
        String key = '%' + searchKey + '%';
        List<profile> fetchedNames=[select id,Name from profile where name like :key];
        List<string> namesFetched=new List<string>();
        for(profile prfl:fetchedNames){
            namesFetched.add(prfl.Name);
        }
        system.debug('****'+namesFetched);
        return namesFetched;
    }
}