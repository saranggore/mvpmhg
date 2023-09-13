@isTest
public class test_animalLocator {
@isTest
   static void invoke(){
        AnimalLocatorMock fk=new AnimalLocatorMock();
        Test.setMock(HttpCalloutMock.class, fk);
        AnimalLocator he=new AnimalLocator();
      string animal=AnimalLocator.getAnimalNameById(1);
       
      system.assertEquals('tiger',animal );
     
      
    }
}