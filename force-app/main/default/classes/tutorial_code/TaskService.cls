/**
 * Created by brooks.johnson on 4/19/2022.
 */

public with sharing class TaskService implements ITaskService {


    public void createTasks(Set<Id> recordIds, Schema.SObjectType objectType) {
        //THE MAJOR DIFFERENCE IS HERE! Instead of using constructors to do dependency injection
        //we are initializing our classes using the fflib_Application factory class.
        //fflib_ISObjectDomain objectDomain = HelpDeskApplication.domain.newInstance(recordIds);
        //fflib_ISObjectSelector objectSelector = Application.selector.newInstance(objectType);
        fflib_ISObjectUnitOfWork unitOfWork = HelpDeskApplication.UOW.newInstance();
        List<SObject> objectsThatNeedTasks = new List<SObject>();
       /* if (objectSelector instanceof Task_Selector_Interface) {
            System.debug('Selector an instance of tsi');
            Task_Selector_Interface taskFieldSelector = (Task_Selector_Interface) objectSelector;
            objectsThatNeedTasks = taskFieldSelector.selectRecordsForTasks();
        } else {
            System.debug('Selector not an instance of tsi');
            objectsThatNeedTasks = objectSelector.selectSObjectsById(recordIds);
        }*/
       /* if (objectDomain instanceof Task_Creator_Interface) {
            System.debug('Domain an instance of tci');
            Task_Creator_Interface taskCreator = (Task_Creator_Interface) objectDomain;
            taskCreator.createTasks(objectsThatNeedTasks, unitOfWork);
        }*/
        try {
            unitOfWork.commitWork();
        } catch (Exception e) {
            throw e;
        }
    }
}