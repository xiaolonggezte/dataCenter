package test.java.serive;

import org.datacenter.entity.Device;
import org.datacenter.service.DeviceService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午5:39 18-10-9
 * @Desription:
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml"})
public class DeviceServiceImplTest {

    @Autowired
    private DeviceService deviceService;

    @Test
    public void queryAllTest() {
        List<Device> list = deviceService.queryAll(0,10);
        System.out.println(list);
    }
}
