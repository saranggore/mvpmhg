public class Owner_change_extension {
    public List<Account> accounts{get;set;}
    public Owner_change_extension(apexpages.StandardSetController controller){
        List<string> fields=new List<string>{'Name','Phone','Rating','Industry'};
        controller.addFields(fields);
        accounts=(List<account>)controller.getSelected();
    }
    
    public pagereference  callMe(){
        user u=[select id from user  where firstName='Sarang'];
        for(account a:accounts){
            a.ownerId=u.Id;
        }
        update accounts;
        pagereference p=new pagereference('/001?fcf=00B2v00000Kyhfi');
        return p;
    }
}