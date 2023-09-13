public class AssendingArray {
    Public static void aArray(){
        List<Integer> arra = new List<Integer>{10,2,8,4};
           
            for(integer i=0;i<arra.size();i++){
                for(integer j=i+1;j<arra.size();j++){
                    if(arra[i]>arra[j]){
                        integer a=arra[i];
                        arra[i]=arra[j];
                        arra[j]=a;
                    }
            }
            }
        system.debug('****arr2****'+arra);
    }
}