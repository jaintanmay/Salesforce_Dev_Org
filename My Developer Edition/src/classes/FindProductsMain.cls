public with sharing class FindProductsMain
{
    //Below variable is for displaying the Product Name in the Lookup section
    public String productName {get; set;}
    //Below variable stores the Product's Row Id for Query
    public Id productId {get; set;}
    //Below is the list of the query on Product Relations object
    public List<prodRelations> ProdRelnList {get; set;}
    
    //Below function is used to fetch the data from the Product Relations object
    public List<prodRelations> getRelations()
    {
        //Only proceed if there is a Product Id, basically the Lookup link has been clicked to get a proper record
        if (null!=productId)
        {
            if (ProdRelnList == null)
            {
            	ProdRelnList = new List <prodRelations>();
                for(Product_Relation__c PRc: [select id, Parent_Product_Name__c, Parent_Product_Category__c,
                                              Child_Product_Name__c, Category__c, Child_Product__r.Price__c, Child_Product__r.Id 
                                              from Product_Relation__c where Parent_Product__r.Id=:productId order by Category__c])
                {
                    ProdRelnList.add(new prodRelations(PRc));
                }    
            }
        }
        return ProdRelnList;
    }
    
    //Below function is to display data on UI
    public pagereference PrdRelations()
    {
        getRelations();
        //ProdRelnList = null;
        return null;
    }
    
    //Below Wrapper class is to add and process Check Box for selection of options on the page
    public class prodRelations 
    {
        public Product_Relation__c prodReln {get; set;}
        public Boolean OptionSelected {get; set;}
        
        public prodRelations (Product_Relation__c PRc)
        {
            prodReln = PRc;
            OptionSelected = false;
        }
    }
}