/**
 * Created by brooks.johnson on 4/29/2022.
 */

public with sharing class HelpDeskB2CService implements IServiceDesk {


    public List<Case> startEntitlementProcess(Case cs) {
        System.debug('Called b2c startEntitlementProcess');
        return null;
    }

    public List<Case> stopEntitlementProcess(Case cs) {
        System.debug('Called b2c stopEntitlementProcess');
        return null;
    }
}