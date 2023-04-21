package org.vm93.beu2w2.config;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.vm93.beu2w2.model.Employee;

import com.github.javafaker.Faker;

@Configuration
public class EmployeeConfig {
	
	@Bean("CustomEmployee")
	@Scope("prototype")
	public Employee custEmployee(String name, String lastname, String email, String username) {
		return Employee.builder().firsname(name).lastname(lastname).email(email).username(username).build();
	}

	@Bean("FakeEmployee")
	@Scope("prototype")
	public Employee fakeEmployee() {
		Faker fake = Faker.instance(new Locale("it-IT"));
		String nome = fake.name().firstName();
		String cognome = fake.name().lastName();
		String user = nome.toLowerCase().charAt(0) + "." + cognome.toLowerCase();
		String email = user + "@example.com";
		Employee e = Employee.builder().firsname(nome).lastname(cognome).email(email).username(user).build();
		return e;
	}
	
}
