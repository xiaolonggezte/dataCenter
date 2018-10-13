package test.java.dao;

import org.datacenter.dao.CourseDao;
import org.datacenter.entity.Course;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午10:15 18-10-10
 * @Desription:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class CourseDaoTest {
    @Autowired
    private CourseDao courseDao;
    @Test
    public void queryAllTest() {
        List<Course> list = courseDao.queryAll(0,10,"");
        System.out.println(list);
    }
    @Test
    public void insertOneTest() {
        try {
            Course course = new Course();
            course.setCourseName("science");
            courseDao.insertOne(course);
            course.setCourseName("program");
            courseDao.insertOne(course);
        } catch (Exception e) {
            System.out.println("insert failed");
        }
    }
    @Test
    public void updateOneTest() {
        try {
            Course course = new Course();
            course.setCourseName("science");
            course.setCourseIsClose("是");
            courseDao.updateOne(course);
        } catch (Exception e) {
            System.out.println("update failed");
        }
    }
    @Test
    public void deleteOneTest() {
        Course course = new Course();
        course.setCourseName("science");
        course.setCourseId(1);
        courseDao.deleteOne(course);
    }
}
