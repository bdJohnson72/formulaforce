/**
 * Created by brooks.johnson on 4/22/2022.
 */

public with sharing class Accounts extends fflib_SObjectDomain {

    public Accounts(List<Account> accounts){
        super(accounts);
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable {

        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }

}