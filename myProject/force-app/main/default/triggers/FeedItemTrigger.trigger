trigger FeedItemTrigger on FeedItem (before insert) {
   List<FeedItem> der=new List<FeedItem>();
        for(FeedItem a:trigger.new)
        {
            if(a.type==null)
            {
                a.type='Mayur Gore';
               
            }
             der.add(a);
        }
    update der;
        
}