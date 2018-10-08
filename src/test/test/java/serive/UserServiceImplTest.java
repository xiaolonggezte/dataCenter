package test.java.serive;

import org.datacenter.entity.User;
import org.datacenter.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Author: xiaolong
 * @Date: Created in 下午7:25 18-10-7
 * @Desription:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml"})
public class UserServiceImplTest {

    @Autowired
    private UserService userService;
    @Test
    public void Test() {
        User user = userService.queryByName("admin");
        System.out.println(user);
    }

}
