public with sharing class accountFromIndustry {
@AuraEnabled(cacheable=true)
public static List<Account> findAccount(string industry){
string searchKey='%'+industry+'%';

return [select id,Name from account where Industry like:searchKey];
}
}