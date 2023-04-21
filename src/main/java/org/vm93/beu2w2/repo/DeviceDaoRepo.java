package org.vm93.beu2w2.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.vm93.beu2w2.model.Device;

public interface DeviceDaoRepo extends CrudRepository<Device, Long>, PagingAndSortingRepository<Device, Long> {

}
