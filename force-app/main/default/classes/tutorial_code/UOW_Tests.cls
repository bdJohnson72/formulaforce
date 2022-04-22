/**
 * Created by brooks.johnson on 4/20/2022.
 */

@IsTest
private class UOW_Tests {
    @IsTest
    static void testFactorySetup() {

        List<SObjectType> sObjectTypes = new List<SObjectType>{
                Account.SObjectType, Contact.SObjectType, Lead.SObjectType
        };
        fflib_Application.UnitOfWorkFactory uowFactory = new fflib_Application.UnitOfWorkFactory(sObjectTypes);
        fflib_ISObjectUnitOfWork uow = uowFactory.newInstance();
        uow.registerNew(new Account(Name = 'Test Acc'));
        uow.commitWork();
        Account testAcc = [SELECT Name FROM Account Limit 1];
        System.assertEquals('Test Acc', testAcc.Name);

    }
    @IsTest
    static void testMyUOW(){
        List<SObjectType> types = new List<SObjectType>{Account.SObjectType, Contact.SObjectType};
        BasicUOW uow = new BasicUOW(types);
        uow.registerNew(new Account(Name = 'Test Acc'));
        uow.registerNew(new Contact(FirstName = 'Test', LastName = 'Contact'));
        uow.commitWork();
        Contact testCon = [Select FirstName, LastName FROM Contact LIMIT 1];
        System.assertEquals('Test', testCon.FirstName);
    }

    @IsTest
    static void itDoesUpdate(){
        Account acc = new Account(Name = 'Test Acc');
        insert acc;
        List<SObjectType> types = new List<SObjectType>{Account.SObjectType, Contact.SObjectType};
        BasicUOW uow = new BasicUOW(types);
        acc.Name = 'changed name';
        uow.registerChange(acc);
        uow.commitWork();
        Account updatedAcc = [SELECT Name FROM Account LIMIT 1];
        System.assertEquals('changed name', updatedAcc.Name);
    }

    @IsTest
    static void registerRelationship(){
        Account acc = new Account(Name = 'Test Acc');
        Contact con = new Contact(FirstName = 'Test', LastName = 'Contact');
        BasicUOW uow = new BasicUOW(new List<SObjectType>{Account.SObjectType, Contact.SObjectType});
        uow.registerNew(acc);
        uow.registerNew(con);
        uow.registerRelationship(con, Contact.AccountId, acc);
        uow.commitWork();
        Contact updatedCon = [SELECT Name, AccountId FROM Contact LIMIT 1];
        System.debug(updatedCon);
        System.debug(acc);
    }
}