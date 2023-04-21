package org.vm93.beu2w2.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.vm93.beu2w2.model.Employee;

public interface EmployeeDaoRepo extends CrudRepository<Employee, Long>, PagingAndSortingRepository<Employee, Long> {

}
