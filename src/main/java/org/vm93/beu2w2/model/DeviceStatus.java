package org.vm93.beu2w2.model;

import java.util.Random;

public enum DeviceStatus {
AVAILABLE, ASSIGNED, MAINTENANCE, OUTOFORDER;
	
	private static final Random rand = new Random();

    public static DeviceStatus randomDeviceStatus()  {
    	DeviceStatus[] statuses = values();
        return statuses[rand.nextInt(statuses.length)];
    }
}
