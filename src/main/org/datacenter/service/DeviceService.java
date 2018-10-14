package org.datacenter.service;

import org.datacenter.entity.Device;

import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午4:42 18-10-9
 * @Desription:
 */

public interface DeviceService {
    List<Device> queryAll(int offset,int limit, String deviceNumber,String deviceUseDeriction,String deviceRoom);
    List<Device> deviceListInsert(List<Device> deviceList);
    void updateOne(Device device);
    void deleteOne(Device device);
}
