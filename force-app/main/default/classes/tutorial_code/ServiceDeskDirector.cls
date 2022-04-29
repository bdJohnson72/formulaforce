/**
 * Created by brooks.johnson on 4/29/2022.
 */

public with sharing class ServiceDeskDirector {

    private static final Map<String, ServiceTypes> serviceClassByRecordType = new Map<String, ServiceTypes>{
        'B2B' => ServiceTypes.B2B_SALES,
        'B2C' => ServiceTypes.B2C_SALES,
        'Marketing' => ServiceTypes.MARKETING
    };
    public List<Case> startEntitlementProcess(List<Case> cases){
        List<Case> caseList = new List<Case>();
        for(Case c : cases){
            String recordType = Schema.SObjectType.Case.getRecordTypeInfosById().get(c.RecordTypeId).getName();
            System.debug(c.RecordType);
            caseList.addAll(service(serviceClassByRecordType.get(recordType)).startEntitlementProcess(c));
        }
        return caseList;
    }

    public List<Case> stopEntitlementProcess(List<Case> cases){
        List<Case> caseList = new List<Case>();
        for(Case c : cases){

            caseList.addAll(service(serviceClassByRecordType.get(c.RecordType.Name)).stopEntitlementProcess(c));
        }
        return caseList;
    }

    private  static IServiceDesk service(ServiceTypes serviceType){
        return (IServiceDesk) ServiceDeskApplication.service.newInstanceByRecordType(serviceType);
    }
}