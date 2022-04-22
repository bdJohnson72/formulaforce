/**
 * Created by brooks.johnson on 4/20/2022.
 */

public with sharing class UOW_Example {

    public void objectCreator(){
        fflib_ISObjectUnitOfWork unitOfWork = HelpDeskApplication.uow.newInstance();

        List<Contact> contactList = new List<Contact>{new Contact(FirstName = 'Cool', LastName = 'Dude')};
        unitOfWork.registerNew(contactList);
        List<Case> caseList = new List<Case>{new Case(Subject = 'Danger', Status = 'New')};
        unitOfWork.registerNew(caseList);
        unitOfWork.registerRelationship(caseList[0], Case.ContactId, contactList[0]);
        unitOfWork.commitWork();
        System.debug(caseList[0].Id);
    }

}