public class anagramString {
    public static void anagram(){
        string fruit='banana';
        string word='nanaba';
        //check length
        if(fruit.length()==word.length()){
            //convert into array
            string[] sarray1=fruit.split('');
            string[] sarray2=word.split('');
            system.debug('sarray1='+sarray1);
            system.debug('sarray2='+sarray2);
            //sort array
            sarray1.sort();
            sarray2.sort();
            //compare array
            if(sarray1==sarray2){
                  system.debug('isAnagram');
            }
        }
    }
}