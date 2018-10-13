package org.datacenter.web;

import org.datacenter.dto.LoadResponse;
import org.datacenter.entity.Course;
import org.datacenter.service.CourseService;
import org.datacenter.utils.ReadExcel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午2:44 18-10-13
 * @Desription:
 */
@Controller
public class CourseController {

    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CourseService courseService;
    @Autowired
    private ReadExcel readExcel;

    @RequestMapping("/data/course")
    @ResponseBody
    public List<Course> queryAll(@RequestParam("page") int page, @RequestParam("limit") int limit,
                                 @RequestParam(value = "courseNumber", required = false, defaultValue = "") String courseNumber) {
        logger.info("offset={},limit={}, courseNumber ={}",page,limit,courseNumber);
        int offset = (page - 1) * limit;
        return courseService.queryAll(offset, limit, courseNumber);
    }
    @RequestMapping(value = "/course/upload",method = RequestMethod.POST)
    @ResponseBody
    public LoadResponse deviceUpload(@RequestParam("file") MultipartFile file) {
        logger.info("start upload course_file");
        if(file==null) return new LoadResponse(404,"error");
        //获取文件名
        String name=file.getOriginalFilename();
        //进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
        long size=file.getSize();
        if(name==null || ("").equals(name) && size==0) return new LoadResponse(404,"error");

        List<Course> courseList = readExcel.getCourseList(file);
        logger.info("courseList.size() = {}",courseList == null ?  0 : courseList.size());
        List<Course> remainCourseList = courseList == null ? null : courseService.courseListInsert(courseList);
        logger.info("remainDeviceList.size() = {}",remainCourseList == null ? 0 : remainCourseList.size());
        return new LoadResponse(0,"success");
    }
}
