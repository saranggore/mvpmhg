public class demo3 {
    /*public List<Data> data;
    public String Response;
    public static void last(){
        String JSONStr = '{ "recordType":"cashsale", "id":"200724", "values":{ "tranid":"Memorized", "entity":[ { "value":"3155", "text":"100032 EJ\'s Pizzeria" } ], "trandate":"03/04/2020", "postingperiod":[ { "value":"90", "text":"Mar 2020" } ], "amount":"140.00", "item.itemid":"300-52-3100-S", "item.displayname":"Revention Software Maintenance Monthly Subscription", "item.salesdescription":"Revention Software Maintenance Monthly", "type":[ { "value":"CashSale", "text":"Cash Sale" } ] } }';
map<String, Object> mm = (map<String, Object>)JSON.deserializeUntyped(JSONStr);
system.debug(mm);
system.debug(mm.get('values'));
map<String, Object> mm2 = (map<String, Object>)mm.get('values');
system.debug(mm2);
system.debug(mm2.get('item.itemid'));
    } */
    public List<Data> data;// { get; set; }
    public String Response;
    public class Data {
        public String unique_id {get;set;}
        public String description {get;set;}
        public String title {get;set;}
    } 
    public void fetchmyData() {
        getAndParse('GET');
    }
    public void getAndParse(String GET) {//
        this.response = '{  "cache": true,  "data":{}}';
        demo3 temp = parse(this.response);    
        this.data = temp.data; 
    }
    public List<Data> getData(){
        return this.data;
    }
    public static demo3 parse(String json) {
        return (demo3) System.JSON.deserialize(json, demo3.class);
    }
}