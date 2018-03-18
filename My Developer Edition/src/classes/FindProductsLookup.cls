public with sharing class FindProductsLookup
{
	public String query {get; set;}
	public List<Sales_Product__c> ProdSetup {get; set;}
	
	public PageReference findProduct()
	{
		List<List<Sales_Product__c>> searchResults = [FIND :query IN ALL FIELDS RETURNING Sales_Product__c (id, Prod_Name__c, Category__c, Price__c)];
		ProdSetup = searchResults[0];
		return null;
		//Test
	}
}