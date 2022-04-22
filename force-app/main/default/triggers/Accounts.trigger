/**
 * Created by brooks.johnson on 4/22/2022.
 */

trigger Accounts on Account (before insert, before update, after insert) {
    fflib_SObjectDomain.triggerHandler(Accounts.class);
}