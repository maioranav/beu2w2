package org.vm93.beu2w2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.vm93.beu2w2.model.DeviceStatus;
import org.vm93.beu2w2.model.DeviceType;
import org.vm93.beu2w2.service.DeviceService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/device")
public class DeviceController {
	
	@Autowired
	DeviceService deviceService;
	
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

}
