package org.vm93.beu2w2.service;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.vm93.beu2w2.model.Employee;
import org.vm93.beu2w2.repo.EmployeeDaoRepo;

import jakarta.persistence.EntityExistsException;

@Service
public class EmployeeService {

	@Autowired private EmployeeDaoRepo repo;
	
	@Autowired @Qualifier("FakeEmployee") private ObjectProvider<Employee> fakeEmployeeProvider;
	
	public Employee saveEmployee(Employee e) {
		if(repo.existsByEmail(e.getEmail()) || repo.existsByUsername(e.getUsername())) {
			throw new EntityExistsException("Username or Email already exists!!");
		}
		repo.save(e);
		return e;
	}
	
	public void saveFakeEmployee() {
		Employee e = fakeEmployeeProvider.getObject();
		saveEmployee(e);
	}
	
}
