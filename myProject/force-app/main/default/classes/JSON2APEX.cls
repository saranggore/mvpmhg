public class JSON2APEX {
public string id;
public string name;
public string email;
    public static JSON2APEX parse(string json)
    {
        return (JSON2APEX) System.JSON.deserialize(json,JSON2APEX.class);
                                                  
    }
}