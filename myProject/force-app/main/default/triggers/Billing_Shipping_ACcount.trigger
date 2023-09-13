trigger Billing_Shipping_ACcount on Account (before insert,before update) {
List<Account> accList=new List<Account>();
    for(Account acc:trigger.new){
            acc.ShippingCity=acc.BillingCity;
            acc.ShippingCountry=acc.BillingCountry;
            acc.ShippingState=acc.BillingState;
            acc.ShippingStreet=acc.BillingStreet;
            acc.ShippingPostalCode=acc.BillingPostalCode;
            accList.add(acc);
        
    }
    //update accList;
}