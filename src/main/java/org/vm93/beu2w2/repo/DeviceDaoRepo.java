package org.vm93.beu2w2.repo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.vm93.beu2w2.model.Device;
import org.vm93.beu2w2.model.DeviceStatus;
import org.vm93.beu2w2.model.DeviceType;
import org.vm93.beu2w2.model.Employee;

public interface DeviceDaoRepo extends CrudRepository<Device, Long>, PagingAndSortingRepository<Device, Long> {

	Page<Device> findByStatus(DeviceStatus status, Pageable pageable);
	Page<Device> findByType(DeviceType type, Pageable pageable);
	Page<Device> findByStatusAndType(DeviceStatus status, DeviceType type, Pageable pageable);
	List<Device> findByEmployee(Employee e);
	
}
