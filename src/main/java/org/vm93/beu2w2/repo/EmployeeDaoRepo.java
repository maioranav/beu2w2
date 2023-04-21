package org.vm93.beu2w2.repo;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.vm93.beu2w2.model.Employee;

public interface EmployeeDaoRepo extends CrudRepository<Employee, Long>, PagingAndSortingRepository<Employee, Long> {

	boolean existsByEmail(String email);
	boolean existsByUsername(String username);
	Optional<Employee> findByEmail(String email);
	Optional<Employee> findByUsername(String username);
	
}
