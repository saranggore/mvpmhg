global class AccountService{
webservice static string createcustomer(string name,string phone,string city){
      Account objA =new Account();
      objA.name=name;
      objA.phone=phone;
      objA.BillingCity=city;
      insert objA;
      
      if(objA.id!=null){
      return 'success';
      }
      else{return 'failure';}
}

}