package com.grinco.simplecrm.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.grinco.simplecrm.model.Person;
 

 
@Repository
public class PersonService {
     
    @Autowired
    private MongoTemplate mongoTemplate;
     
    public static final String COLLECTION_NAME = "person";
     
    public void addPerson(Person person) {
        if (!mongoTemplate.collectionExists(Person.class)) {
            mongoTemplate.createCollection(Person.class);
        }      
        person.setId(UUID.randomUUID().toString());
        mongoTemplate.insert(person, COLLECTION_NAME);
    }
     
    public List<Person> listPerson() {
        return mongoTemplate.findAll(Person.class, COLLECTION_NAME);
    }
     
    public void deletePerson(Person person) {
        mongoTemplate.remove(person, COLLECTION_NAME);
    }
     
    public Person getPerson(String strId) {
//    	return mongoTemplate.findById(strId, Person.class); //alternative variant
    	Query query = new Query();
    	query.addCriteria(Criteria.where("id").is(strId));
    	return mongoTemplate.findOne(query, Person.class);
    }
    
    public void updatePerson(Person person) {
//        mongoTemplate.insert(person, COLLECTION_NAME);   
        Query query = new Query();
		query.addCriteria(Criteria.where("id").is(person.getId()));
 
		Update update = new Update();
		update.set("name", person.getName());
		update.set("email", person.getEmail());
        mongoTemplate.upsert(query, update, COLLECTION_NAME);
    }
}