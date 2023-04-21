package org.vm93.beu2w2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.vm93.beu2w2.model.Device;
import org.vm93.beu2w2.model.DeviceStatus;
import org.vm93.beu2w2.model.DeviceType;
import org.vm93.beu2w2.model.Employee;
import org.vm93.beu2w2.service.DeviceService;
import org.vm93.beu2w2.service.EmployeeService;

import jakarta.persistence.EntityNotFoundException;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/device")
public class DeviceController {
	
	@Autowired
	DeviceService deviceService;
	
	@Autowired
	EmployeeService employeeService;
	
	@GetMapping
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> getAllDevices(Pageable pageable){
		return new ResponseEntity<>(deviceService.findAll(pageable), HttpStatus.OK);
	}
	
	@GetMapping(path = "/available")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<?> getAvailableDevices(Pageable pageable){
		return new ResponseEntity<>(deviceService.findByStatus(DeviceStatus.AVAILABLE, pageable), HttpStatus.OK);
	}
	
	@GetMapping(path = "/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> getById(@PathVariable(name = "id") Long id){
		return new ResponseEntity<>(deviceService.findById(id), HttpStatus.OK);
	}
	
	@GetMapping(path = "/available/{type}")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<?> getAvailableDevicesType(@PathVariable(name = "type") String type, Pageable pageable){
		return new ResponseEntity<>(deviceService.findByStatusAndType(DeviceStatus.AVAILABLE, DeviceType.valueOf(type.toUpperCase()), pageable), HttpStatus.OK);
	}
	
	@GetMapping(path = "/{stat}/{type}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> getDevicesStatusType(@PathVariable(name = "stat") String status, @PathVariable(name = "type") String type, Pageable pageable){
		return new ResponseEntity<>(deviceService.findByStatusAndType(DeviceStatus.valueOf(status.toUpperCase()), DeviceType.valueOf(type.toUpperCase()), pageable), HttpStatus.OK);
	}
	
	@PostMapping
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> createDevice(@RequestBody Device d){
		return new ResponseEntity<>(deviceService.saveDevice(d), HttpStatus.CREATED);
	}
	
	@PutMapping
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> updateDevice(@RequestBody Device d){
		if (!d.getStatus().equals(DeviceStatus.ASSIGNED)) {
			d.setEmployee(null);
		}
		return new ResponseEntity<>(deviceService.updateDevice(d), HttpStatus.OK);
	}
	
	@PutMapping(path = "/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> updateEmployeeForDevice(@RequestBody Employee e, @PathVariable(name = "id") Long id){
		Device d = deviceService.findById(id);
		if (!d.getStatus().equals(DeviceStatus.AVAILABLE)) {
			throw new EntityNotFoundException("Device not available: " + d.getStatus());
		}
		Employee eDb = employeeService.findById(e.getId());
		d.setEmployee(eDb);
		return new ResponseEntity<>(deviceService.updateDevice(d), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> deleteById(@PathVariable Long id){
			return new ResponseEntity<>(deviceService.removeDevice(id), HttpStatus.OK);
	}

}
