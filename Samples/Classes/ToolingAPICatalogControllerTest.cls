@isTest
private class ToolingAPICatalogControllerTest {
	
	@isTest static void testMyController() {

		Test.StartTest();

		List<Product2> products = New List<Product2>();

		Product2 testproduct1 = new Product2(Name = 'P1');
		products.add(testproduct1);
		Product2 testproduct2 = new Product2(Name = 'P2');
		products.add(testproduct2);
		Product2 testproduct3 = new Product2(Name = 'P3');
		products.add(testproduct3);
		Product2 testproduct4 = new Product2(Name = 'P4');
		products.add(testproduct4);
		Product2 testproduct5 = new Product2(Name = 'P5');
		products.add(testproduct5);

		insert products;

		List<vlocity_cmt__ProductChildItem__c> childItems = New List<vlocity_cmt__ProductChildItem__c>();

		vlocity_cmt__ProductChildItem__c childItem1to2 = new vlocity_cmt__ProductChildItem__c(
			vlocity_cmt__ParentProductId__c=testproduct1.id,
			vlocity_cmt__ChildProductId__c=testproduct2.id,
			vlocity_cmt__ChildLineNumber__c='1');
		childItems.add(childItem1to2);
		vlocity_cmt__ProductChildItem__c childItem1to3 = new vlocity_cmt__ProductChildItem__c(
			vlocity_cmt__ParentProductId__c=testproduct1.id,
			vlocity_cmt__ChildProductId__c=testproduct3.id,
			vlocity_cmt__ChildLineNumber__c='2');
		childItems.add(childItem1to3);

		insert childItems;

		List<vlocity_cmt__DecompositionRelationship__c> decompositionRelationshipsItems = New List<vlocity_cmt__DecompositionRelationship__c>();

		vlocity_cmt__DecompositionRelationship__c descomp3to4 = new vlocity_cmt__DecompositionRelationship__c(
				vlocity_cmt__SourceProductId__c=testproduct3.id,
				vlocity_cmt__DestinationProductId__c=testproduct4.id 
		);
		decompositionRelationshipsItems.add(descomp3to4);
		vlocity_cmt__DecompositionRelationship__c descomp3to5 = new vlocity_cmt__DecompositionRelationship__c(
				vlocity_cmt__SourceProductId__c=testproduct3.id, 
				vlocity_cmt__DestinationProductId__c=testproduct5.id 
		);
		decompositionRelationshipsItems.add(descomp3to5);

		insert decompositionRelationshipsItems;

		vlocity_cmt__OrchestrationPlanDefinition__c orchPlanDefinition = new vlocity_cmt__OrchestrationPlanDefinition__c();
		insert orchPlanDefinition;


		List<vlocity_cmt__OrchestrationScenario__c> orchScenarios = New List<vlocity_cmt__OrchestrationScenario__c>();

		vlocity_cmt__OrchestrationScenario__c orchScenario1 = new vlocity_cmt__OrchestrationScenario__c(
			vlocity_cmt__Product2Id__c=testproduct1.id,
			vlocity_cmt__OrchestrationPlanDefinitionId__c=orchPlanDefinition.id
		);
		orchScenarios.add(orchScenario1);
		vlocity_cmt__OrchestrationScenario__c orchScenario2 = new vlocity_cmt__OrchestrationScenario__c(
			vlocity_cmt__Product2Id__c=testproduct2.id,
			vlocity_cmt__OrchestrationPlanDefinitionId__c=orchPlanDefinition.id
		);
		orchScenarios.add(orchScenario2);
		vlocity_cmt__OrchestrationScenario__c orchScenario3 = new vlocity_cmt__OrchestrationScenario__c(
			vlocity_cmt__Product2Id__c=testproduct3.id,
			vlocity_cmt__OrchestrationPlanDefinitionId__c=orchPlanDefinition.id
		);
		orchScenarios.add(orchScenario3);
		vlocity_cmt__OrchestrationScenario__c orchScenario4 = new vlocity_cmt__OrchestrationScenario__c(
			vlocity_cmt__Product2Id__c=testproduct4.id,
			vlocity_cmt__OrchestrationPlanDefinitionId__c=orchPlanDefinition.id
		);
		orchScenarios.add(orchScenario4);
		vlocity_cmt__OrchestrationScenario__c orchScenario5 = new vlocity_cmt__OrchestrationScenario__c(
			vlocity_cmt__Product2Id__c=testproduct5.id,
			vlocity_cmt__OrchestrationPlanDefinitionId__c=orchPlanDefinition.id
		);
		orchScenarios.add(orchScenario5);

		insert orchScenarios;

        PageReference pageRef = Page.CatalogNavigator; // Add your VF page Name here
        pageRef.getParameters().put('productId', testproduct1.id);
        Test.setCurrentPage(pageRef);

        ToolingAPICatalogController controller = new ToolingAPICatalogController();
        controller = new ToolingAPICatalogController(); 

        controller.getProducts();

        String product1Graph = ToolingAPICatalogController.getGraphForProduct(testproduct1.id,4);

        ToolingAPICatalogController.getProductDetails(testproduct1.id);

        ToolingAPICatalogController.getProductList('Phone1',1);

        ToolingAPICatalogController.getAttrList('Phone1',1);

        for (String key : ToolingAPICatalogController.scenarios.keySet()) {
        	System.debug('key' + key);
			ToolingAPICatalogController.getGraphForOrch(key);

		}
        Test.StopTest();

    }
	

}