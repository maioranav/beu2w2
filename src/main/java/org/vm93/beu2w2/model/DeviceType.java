package org.vm93.beu2w2.model;

import java.util.Random;

public enum DeviceType {
SMARTPHONE, TABLET, LAPTOP;

private static final Random rand = new Random();

public static DeviceType randomDeviceType()  {
	DeviceType[] types = values();
    return types[rand.nextInt(types.length)];
}
}
