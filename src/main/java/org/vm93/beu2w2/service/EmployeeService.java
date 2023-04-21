package org.vm93.beu2w2.service;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.vm93.beu2w2.model.Employee;
import org.vm93.beu2w2.repo.DeviceDaoRepo;
import org.vm93.beu2w2.repo.EmployeeDaoRepo;

import jakarta.persistence.EntityExistsException;
import jakarta.persistence.EntityNotFoundException;

@Service
public class EmployeeService {

	@Autowired private EmployeeDaoRepo repo;
	@Autowired private DeviceDaoRepo devicerepo;
	
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
	
	public String removeEmployee(Long id) {
		if (!repo.existsById(id)) {
			throw new EntityNotFoundException("Employee ID doesnt exists!!");
		}
		if(devicerepo.findByEmployee(repo.findById(id).get()).size() > 0) {
			throw new EntityExistsException("Employee has Assigned Devices. Please return before.");
		}
		repo.deleteById(id);
		return "Employee Deleted from DB!";
	}
	
	public Employee updateEmployee(Employee e) {
		if (!repo.existsById(e.getId())) {
			throw new EntityNotFoundException("Employee ID doesnt exists on No Id Specified!!");
		}
		repo.save(e);
		e.setDevices(devicerepo.findByEmployee(e));
		return e;
	}
	
	public Employee findById(Long id) {
		if(!repo.existsById(id)) {
			throw new EntityNotFoundException("Employee ID doesnt exists!!");
		}
		return repo.findById(id).get();	
	}
	
	public Employee findByEmail(String email) {
		if(!repo.existsByEmail(email)) {
			throw new EntityNotFoundException("Employee Email doesnt exists!!");
		}
		return repo.findByEmail(email).get();	
	}
	
	public Employee findByUsername(String username) {
		if(!repo.existsByUsername(username)) {
			throw new EntityNotFoundException("Employee Username doesnt exists!!");
		}
		return repo.findByUsername(username).get();	
	}
	
	public Page<Employee> findAll(Pageable pageable){
		return (Page<Employee>) repo.findAll(pageable);
	}
}
