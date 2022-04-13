/**
 * Created by bjohnson on 4/13/2022.
 */

public interface ITaskService {
	void createTasks(Set<Id> recordIds, Schema.SObjectType objectType);
}