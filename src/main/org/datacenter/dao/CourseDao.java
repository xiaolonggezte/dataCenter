package org.datacenter.dao;

import org.apache.ibatis.annotations.Param;
import org.datacenter.entity.Course;

import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午10:01 18-10-10
 * @Desription:
 */
public interface CourseDao {
    List<Course> queryAll(@Param("offset") int offset,@Param("limit") int limit);
    void insertOne(@Param("one") Course course);
    void updateOne(@Param("one") Course course);
    void deleteOne(@Param("one") Course course);
}
