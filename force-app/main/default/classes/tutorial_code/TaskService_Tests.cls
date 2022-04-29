/**
 * Created by brooks.johnson on 4/25/2022.
 */

@IsTest
private class TaskService_Tests {
    @IsTest
    static void createTasks_castTaskSuccess() {
        Id mockCaseId = fflib_IDGenerator.generate(Case.SObjectType);
        Set<Id> caseIds = new Set<Id>{mockCaseId};
        List<Case> cases = new List<Case>{new Case(Id = mockCaseId, Subject = 'test', Status = 'Open', Origin = 'Email' )};


    }
}