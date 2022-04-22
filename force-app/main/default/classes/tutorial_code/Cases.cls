/**
 * Created by brooks.johnson on 4/19/2022.
 */

public  inherited sharing class Cases extends fflib_SObjectDomain implements ITaskCreator {

    public Cases(List<Case> caseRecords){
        super(caseRecords);
        Cases.getTriggerEvent(Cases.class).disableBeforeInsert();
    }


    public fflib_ISObjectUnitOfWork createTasks(List<SObject> recordsToCreateTasksFor, fflib_ISObjectUnitOfWork uow) {
        return null;
    }
}