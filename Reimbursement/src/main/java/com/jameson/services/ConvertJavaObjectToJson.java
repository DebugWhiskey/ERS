package com.jameson.services;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jameson.model.Person;


public class ConvertJavaObjectToJson {

	public static void main(String[] args) {
		ObjectMapper mapper = new ObjectMapper();
		Person person = new Person();
		
		try {
			mapper.writeValue(new File("person.json"), person);
			String jsonString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(person);
			System.out.println(jsonString);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static Person newPerson() {
		Person person = new Person();
		
		List<String> hobbies = new ArrayList<>();
		hobbies.add("Football");
		hobbies.add("Cooking");
		hobbies.add("Swimming");
		
		Map<String, String> languages = new HashMap<>();
		languages.put("French", "Beginner");
		languages.put("German", "Intermediate");
		languages.put("Spanish", "Advanced");
		
		person.setName("David");
		person.setAge(30);
		person.setHobbies(hobbies);
		person.setLanguages(languages);
		
		return person;
	}

}
