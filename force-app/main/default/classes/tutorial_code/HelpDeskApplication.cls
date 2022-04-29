/**
 * Created by bjohnson on 4/13/2022.
 */

public with sharing class HelpDeskApplication {

	public static final fflib_Application.UnitOfWorkFactory uow = new fflib_Application.UnitOfWorkFactory(new List<SObjectType>{
			Account.SObjectType,
			Contact.SObjectType,
			Case.SObjectType,
			Task.SObjectType,
			Opportunity.SObjectType
	});

	public static final fflib_Application.ServiceFactory service = new fflib_Application.ServiceFactory(new Map<Type, Type>{
			ITaskService.class => TaskService.class
	});

	public static final fflib_Application.SelectorFactory selector = new fflib_Application.SelectorFactory(
			new Map<SObjectType, Type>{
					Case.SObjectType => CaseSelector.class}
	);

	/*public static final fflib_Application.DomainFactory domain = new fflib_Application.DomainFactory(
		HelpDeskApplication.selector,
		new Map<SObjectType, Type>{Case.SObjectType => Cases.Constructor.class,
		Contact.SObjectType => Contacts.Constructor.class
		}
	);*/


}