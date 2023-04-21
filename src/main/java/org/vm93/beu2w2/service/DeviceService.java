package org.vm93.beu2w2.service;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.vm93.beu2w2.model.Device;
import org.vm93.beu2w2.repo.DeviceDaoRepo;
import jakarta.persistence.EntityNotFoundException;

@Service
public class DeviceService {

	@Autowired private DeviceDaoRepo repo;
	
	@Autowired @Qualifier("FakeDevice") private ObjectProvider<Device> fakeDeviceProvider;
	
	public Device saveDevice(Device d) {
		repo.save(d);
		return d;
	}
	
	public void saveFakeDevice() {
		Device d = fakeDeviceProvider.getObject();
		saveDevice(d);
	}
	
	public String removeDevice(Long id) {
		if (!repo.existsById(id)) {
			throw new EntityNotFoundException("Device ID doesnt exists!!");
		}
		repo.deleteById(id);
		return "Device Deleted from DB!";
	}
	
	public Device updateDevice(Device d) {
		if (!repo.existsById(d.getId())) {
			throw new EntityNotFoundException("Device ID doesnt exists on No Id Specified!!");
		}
		repo.save(d);
		return d;
	}
	
	public Device findById(Long id) {
		if(!repo.existsById(id)) {
			throw new EntityNotFoundException("Device ID doesnt exists!!");
		}
		return repo.findById(id).get();	
	}

	public Page<Device> findAll(Pageable pageable){
		return (Page<Device>) repo.findAll(pageable);
	}
}
