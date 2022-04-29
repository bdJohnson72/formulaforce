/**
 * Created by brooks.johnson on 4/29/2022.
 */

public with sharing class HelpDeskMarketingService implements IServiceDesk{


    public List<Case> startEntitlementProcess(Case cs) {
        System.debug('Called marketing startEntitlementProcess');
        return null;
    }

    public List<Case> stopEntitlementProcess(Case cs) {
        System.debug('Called marketing stopEntitlementProcess');
        return null;
    }
}