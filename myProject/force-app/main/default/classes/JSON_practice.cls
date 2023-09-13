public class JSON_practice {
    public Account acc       {set;get;}
    public string jsonstring {set;get;}
    public JSON_practice(){
    acc=new account();
    }
    public void crate(){
        system.JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
        js.writeFieldName('Status');
        try{
            insert acc;
            js.writeString('Success');
            js.writeIdField('ID',acc.id);
        }
        catch(exception e){
            js.writeString('Failed');
            js.writeStringField('Error',e.getMessage());
        }
        js.writeEndObject();
        jsonstring=js.getAsString();
    }
}