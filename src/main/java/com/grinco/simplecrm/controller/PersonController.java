package com.grinco.simplecrm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.grinco.simplecrm.model.Person;
import com.grinco.simplecrm.service.PersonService;
 
@Controller   
public class PersonController { 
    
    @Autowired
    private PersonService personService;
     
    @RequestMapping(value = "/", method = RequestMethod.GET) 
    public String getPersonList(ModelMap model) { 
        model.addAttribute("personList", personService.listPerson()); 
        return "output"; 
    } 
     
    @RequestMapping(value = "/output", method = RequestMethod.GET) 
    public View returnToMain(ModelMap model) { 
    	return new RedirectView("/");
    } 
    
    @RequestMapping(value = "/save", method = RequestMethod.POST) 
    public View createPerson(@ModelAttribute Person person, ModelMap model) {
        if(StringUtils.hasText(person.getId())) {
            personService.updatePerson(person);
        } else {
            personService.addPerson(person);
        }
        return new RedirectView("/");
    }
      
    @RequestMapping(value = "/update", method = RequestMethod.POST) 
    public View updatePerson(@ModelAttribute Person person, ModelMap model) {
        if(StringUtils.hasText(person.getId())) {
            personService.updatePerson(person);
        } else {
            personService.addPerson(person);
        }
        return new RedirectView("/");
    }
    
    @RequestMapping(value = "/edit", method = RequestMethod.GET) 
    public String editPerson(@ModelAttribute Person person, ModelMap model) {
    	model.addAttribute("person", personService.getPerson(person.getId()));
        return "edit";
    }
    
    @RequestMapping(value = "/view", method = RequestMethod.GET) 
    public String viewPerson(@ModelAttribute Person person, ModelMap model) {
    	model.addAttribute("person", personService.getPerson(person.getId()));
        return "view";
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.GET) 
    public View deletePerson(@ModelAttribute Person person, ModelMap model) { 
        personService.deletePerson(person); 
        return new RedirectView("/");
    }   
}