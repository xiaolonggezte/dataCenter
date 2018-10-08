package test.java.dao;

import org.datacenter.dao.UserDao;
import org.datacenter.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Author: xiaolong
 * @Date: Created in 下午1:16 18-10-7
 * @Desription:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserDaoTest {
    @Autowired
    private UserDao userDao;
    @Test
    public void queryByIdTest() {
        User user = userDao.queryById(2);
        System.out.println(user);
    }
    @Test
    public void queryByNameTest() {
        User user = userDao.queryByName("xiaolong");
        System.out.println(user);
    }

}
