@isTest
public class AnimalLocatorTest {
@isTest
   static void invoke(){
        AnimalLocatorMock fk=new AnimalLocatorMock();
        Test.setMock(HttpCalloutMock.class, fk);
        AnimalLocator he=new AnimalLocator();
      string animal=AnimalLocator.getAnimalNameById(1);
       System.assertNotEquals(null,animal,'The callout returned a null response.');
     
       system.assertEquals('pesky',animal );
      system.debug(animal);
      
    }
}