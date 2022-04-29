/**
 * Created by brooks.johnson on 4/29/2022.
 */

public with sharing class ServiceDeskApplication {

    public static final fflib_Application.ServiceFactory service = new fflib_Application.ServiceFactory(new Map<ServiceTypes, Type>{
            ServiceTypes.B2B_SALES => HelpDeskB2BService.class,
            ServiceTypes.B2C_SALES => HelpDeskB2CService.class,
            ServiceTypes.MARKETING => HelpDeskMarketingService.class
    });

}