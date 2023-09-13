public class StarPattern {
    public static void stardraw(){
         string star='';
        for(integer i=1;i<=5;i++){
            
            for(integer j=1;j<=i;j++){
               star=star+'*';
            }
            system.debug(''+star);
            star='';
         }
    }
    public static void stardraw2(){
         string star='';
        for(integer i=5;i>=1;i--){
            
            for(integer j=i;j>=1;j--){
               star=star+'*';
            }
            system.debug(''+star);
            star='';
         }
    }
    public static void stardraw3(){
         string star='';
        for(integer i=1;i<=5;i++){
            
            for(integer j=i;j<=i;j++){
               star=star+'*';
            }
            system.debug(''+star);
            star='';
         }
    }
}