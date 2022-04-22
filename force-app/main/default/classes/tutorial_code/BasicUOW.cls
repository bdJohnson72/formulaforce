/**
 * Created by brooks.johnson on 4/20/2022.
 */

public with sharing class BasicUOW {

    List<SObjectType> types;
    Map<String, List<SObject>> newListByType;
    Map<String, List<SObject>> changedListByType;
    Map<String, Relationships> relationships;


    public BasicUOW(List<SObjectType> types){
        this.types = types;
        this.newListByType = new Map<String, List<SObject>>();
        this.changedListByType = new Map<String, List<SObject>>();
        this.relationships = new Map<String, Relationships>();
        for( SObjectType type : types){
            handleRegisterType(type);
        }
    }

    private void handleRegisterType(Schema.SObjectType sobjType){
        System.debug(sobjType);
        System.debug(sobjType.getDescribe().getName());
        newListByType.put(sobjType.getDescribe().getName(), new List<SObject>());
        changedListByType.put(sobjType.getDescribe().getName(), new List<SObject>());
        relationships.put(sobjType.getDescribe().getName(), new Relationships());
    }

    public void registerNew(SObject obj){
        String sobjType = obj.getSObjectType().getDescribe().getName();
        newListByType.get(sobjType).add(obj);
    }

    public void registerChange(SObject obj){
        String sobjType = obj.getSObjectType().getDescribe().getName();
        changedListByType.get(sobjType).add(obj);
    }

    public void registerRelationship(SObject record, Schema.SObjectField relationshipField, SObject relatedTo){
        String sobjectType = record.getSObjectType().getDescribe().getName();
        relationships.get(sobjectType).add(record, relationshipField, relatedTo);
    }

    public void commitWork(){
        Savepoint sp = Database.setSavepoint();
        try {

            doInsert();
            doUpdate();
        } catch (Exception e) {
            System.debug(e);
        }
    }

    private void doInsert() {
        for(SObjectType type : types){
            this.relationships.get(String.valueOf(type)).resolve();
            insert newListByType.get(String.valueOf(type));
        }
    }

    private void doUpdate(){
        for( SObjectType type : types){
            update changedListByType.get(String.valueOf(type));
        }
    }

    private class Relationships {
        List<Relationship> relationshipList;

        public Relationships(){
            this.relationshipList = new List<BasicUOW.Relationship>();
        }

        public void add(SObject record, SObjectField relatedField, SObject relatedTo){
            Relationship relationship = new Relationship(record, relatedField, relatedTo);
            relationshipList.add(relationship);
        }

        public void resolve(){
            for(Relationship relationship : relationshipList){
                relationship.resolve();
            }
        }
    }



    private class Relationship {
        public SObject record;
        public SObjectField relatedToField;
        public SObject relatedTo;

        public Relationship(Sobject record, SObjectField relatedToField, SObject relatedTo){
            this.record = record;
            this.relatedToField = relatedToField;
            this.relatedTo = relatedTo;
        }

        public void resolve(){
            this.record.put(this.relatedToField, this.relatedTo.Id);
        }

    }

}