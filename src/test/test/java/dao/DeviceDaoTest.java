package test.java.dao;

import org.datacenter.dao.DeviceDao;
import org.datacenter.entity.Device;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午5:18 18-10-9
 * @Desription:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class DeviceDaoTest {
    @Autowired
    private DeviceDao deviceDao;
    @Test
    public void queryAllTest() {
        List<Device> list = deviceDao.queryAll(0,10,-1);
        System.out.println(list);
    }
    @Test
    public void insertOneTest() {
        Device device = new Device();
        device.setDeviceNumber("2345");
        device.setDeviceName("matebook");

        try {
            deviceDao.insertOne(device);
        } catch (Exception e) {
            System.out.println("insert failed");
        }
    }

    @Test
    public void updateOneTest() {
        Device device = new Device();
        device.setDeviceNumber("2345");
        device.setDeviceName("matebook-fixed");
        try {
            deviceDao.updateOne(device);
        } catch (Exception e) {
            System.out.println("update failed");
        }

    }
    @Test
    public void deleteOneTest() {
        Device device = new Device();
        device.setDeviceNumber("2345");
        device.setDeviceName("matebook-fixed");
        try {
            deviceDao.deleteOne(device);
        } catch (Exception e) {
            System.out.println("delete failed");
        }

    }
}
