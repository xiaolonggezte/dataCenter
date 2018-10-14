package org.datacenter.service;

import org.datacenter.entity.Course;

import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午2:46 18-10-13
 * @Desription:
 */
public interface CourseService {
    List<Course> queryAll(int offset, int limit, String courseNumber, String courseWeek, String coursePlace);
    void insertOne(Course course);
    void updateOne(Course course);
    void deleteOne(Course course);
    List<Course> courseListInsert(List<Course> courseList);
}
