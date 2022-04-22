/**
 * Created by brooks.johnson on 4/19/2022.
 */

public interface ITaskCreator {

    fflib_ISObjectUnitOfWork createTasks(List<SObject> recordsToCreateTasksFor, fflib_ISObjectUnitOfWork uow);

}