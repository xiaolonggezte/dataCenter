package org.datacenter.service.impl;

import org.datacenter.dao.CourseDao;
import org.datacenter.entity.Course;
import org.datacenter.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午2:46 18-10-13
 * @Desription:
 */
@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;
    public List<Course> queryAll(int offset, int limit, String courseNumber) {
        List<Course> courseList = courseDao.queryAll(offset, limit, courseNumber);
        return courseList;
    }

    public void insertOne(Course course) {
        courseDao.insertOne(course);
    }

    public void updateOne(Course course) {
        courseDao.updateOne(course);
    }

    public void deleteOne(Course course) {
        courseDao.deleteOne(course);
    }

    public List<Course> courseListInsert(List<Course> courseList) {
        List<Course> remainCourseList = new ArrayList<Course>();
        for(Course course : courseList) {
            try {
                courseDao.insertOne(course);
            } catch(Exception e){
                remainCourseList.add(course);
            }
        }
        return remainCourseList;
    }
}
