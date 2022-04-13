/**
 * Created by bjohnson on 4/13/2022.
 */

public with sharing class Application2 {

	public static final fflib_Application.UnitOfWorkFactory uow = new fflib_Application.UnitOfWorkFactory( new List<SObjectType> {
			Account.SObjectType,
			Contact.SObjectType,
			Case.SObjectType,
			Task.SObjectType,
			Opportunity.SObjectType
	} );

	public static final fflib_Application.ServiceFactory service = new fflib_Application.ServiceFactory(
			new Map<Type, Type>{
					Task_Service_Inter
			}
	)
}