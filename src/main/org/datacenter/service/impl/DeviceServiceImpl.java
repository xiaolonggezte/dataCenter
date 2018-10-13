package org.datacenter.service.impl;

import org.datacenter.dao.DeviceDao;
import org.datacenter.entity.Device;
import org.datacenter.service.DeviceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午4:42 18-10-9
 * @Desription:
 */
@Service
public class DeviceServiceImpl implements DeviceService {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private DeviceDao deviceDao;
    public List<Device> queryAll(int offset,int limit,int deviceNumber) {
        List<Device> list = deviceDao.queryAll(offset,limit,deviceNumber);
        logger.info("DeviceList={}",list);
        return list;
    }


    public List<Device> deviceListInsert(List<Device> deviceList) {
        List<Device> remainDeviceList = new ArrayList<Device>();
        for(Device device : deviceList) {
            try {
                deviceDao.insertOne(device);
            } catch(Exception e){
                remainDeviceList.add(device);
            }
        }
        return remainDeviceList;
    }
}
