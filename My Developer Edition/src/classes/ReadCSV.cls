public class ReadCSV 
{
    public Blob csvFileContent {get; set;} 		//This is to read file
    public string csvStringFormat {get; set;} 	//This will store file path as a string
    public String[] csvFileLines {get; set;}	//This will have the various lines in a file
    public List<account> AccountList{get; set;}	//This has the list of Accounts
    
    public ReadCSV()
    {
        csvFileLines = new String[]{};
        AccountList = new list <Account>();
    }
    
    //Read CSV File in the code below
    public void importFile()
    {
        try
        {
            csvStringFormat = csvFileContent.toString();
            csvFileLines = csvStringFormat.split('\n');
            
            For (Integer i = 1; i < csvFileLines.size(); i++)
            {
                Account accountObject = new Account();
                string[] csvLineText = csvFileLines[i].split(',');
                accountObject.Name = csvLineText[0];
                accountObject.AccountNumber = csvLineText[1];
                accountObject.Type = csvLineText[2];
                accountObject.AccountSource = csvLineText[3];
                AccountList.add(accountObject);
            }
        }
        catch (Exception e)
        {
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.Severity.ERROR, 'Please verify the CSV File. Unable to process it. System Error Message: ' + e.getMessage());
            ApexPages.addMessage(errorMessage);
        }
    }
}