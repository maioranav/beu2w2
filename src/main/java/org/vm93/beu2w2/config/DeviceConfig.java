package org.vm93.beu2w2.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.vm93.beu2w2.model.Device;
import org.vm93.beu2w2.model.DeviceStatus;
import org.vm93.beu2w2.model.DeviceType;

@Configuration
public class DeviceConfig {
	
	@Bean("CustomDevice")
	@Scope("prototype")
	public Device custDevice() {
		return Device.builder().build();
	}
	
	@Bean("FakeDevice")
	@Scope("prototype")
	public Device fakeDevice() {
		DeviceType type = DeviceType.randomDeviceType();
		DeviceStatus status = DeviceStatus.ASSIGNED;
		while (status.equals(DeviceStatus.ASSIGNED)) {
			status = DeviceStatus.randomDeviceStatus();
		}
		return Device.builder().type(type).status(status).build();
	}
	
}
