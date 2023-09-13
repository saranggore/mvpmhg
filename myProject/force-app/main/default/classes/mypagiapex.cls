public class mypagiapex {

private integer totalRecs = 0;
private integer OffsetSize = 0;
private integer LimitSize= 10;
public mypagiapex()
{
totalRecs = [select count() from account];
}
public List<account> getacclist()
{
List<account> acc = Database.Query('SELECT Name, website, AnnualRevenue, description, Type FROM account LIMIT :LimitSize OFFSET :OffsetSize');
System.debug('Values are ' + acc);
return acc;
}
}