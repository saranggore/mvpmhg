public class leadsoql {
    public list<lead> customer{set;get;}
    public leadsoql(){
        
        customer=[select Name,company,Title,Email,Phone from lead];
    }
}