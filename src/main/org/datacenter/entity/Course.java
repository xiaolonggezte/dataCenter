package org.datacenter.entity;

/**
 * @Author: xiaolong
 * @Date: Created in 下午4:45 18-10-9
 * @Desription: course JAVABEAN
 */
public class Course {
    private int courseId;
    private String courseUnit;
    private String courseNumber;
    private String courseName;
    private String courseProjectNumber;
    private String courseProjectName;
    private String courseWeek;
    private String courseDay;
    private String courseNode;
    private String coursePlace;
    private String courseTecher;
    private String courseClass;
    private int courseCount;
    private String courseIsClose;

    @Override
    public String toString() {
        return "Course{" +
                "courseId=" + courseId +
                ", courseUnit='" + courseUnit + '\'' +
                ", courseNumber='" + courseNumber + '\'' +
                ", courseName='" + courseName + '\'' +
                ", courseProjectNumber='" + courseProjectNumber + '\'' +
                ", courseProjectName='" + courseProjectName + '\'' +
                ", courseWeek=" + courseWeek +
                ", courseDay='" + courseDay + '\'' +
                ", courseNode='" + courseNode + '\'' +
                ", coursePlace='" + coursePlace + '\'' +
                ", courseTecher='" + courseTecher + '\'' +
                ", courseClass='" + courseClass + '\'' +
                ", courseCount=" + courseCount +
                ", courseIsClose='" + courseIsClose + '\'' +
                '}';
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseUnit() {
        return courseUnit;
    }

    public void setCourseUnit(String courseUnit) {
        this.courseUnit = courseUnit;
    }

    public String getCourseNumber() {
        return courseNumber;
    }

    public void setCourseNumber(String courseNumber) {
        this.courseNumber = courseNumber;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseProjectNumber() {
        return courseProjectNumber;
    }

    public void setCourseProjectNumber(String courseProjectNumber) {
        this.courseProjectNumber = courseProjectNumber;
    }

    public String getCourseProjectName() {
        return courseProjectName;
    }

    public void setCourseProjectName(String courseProjectName) {
        this.courseProjectName = courseProjectName;
    }

    public String getCourseWeek() {
        return courseWeek;
    }

    public void setCourseWeek(String courseWeek) {
        this.courseWeek = courseWeek;
    }

    public String getCourseDay() {
        return courseDay;
    }

    public void setCourseDay(String courseDay) {
        this.courseDay = courseDay;
    }

    public String getCourseNode() {
        return courseNode;
    }

    public void setCourseNode(String courseNode) {
        this.courseNode = courseNode;
    }

    public String getCoursePlace() {
        return coursePlace;
    }

    public void setCoursePlace(String coursePlace) {
        this.coursePlace = coursePlace;
    }

    public String getCourseTecher() {
        return courseTecher;
    }

    public void setCourseTecher(String courseTecher) {
        this.courseTecher = courseTecher;
    }

    public String getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(String courseClass) {
        this.courseClass = courseClass;
    }

    public int getCourseCount() {
        return courseCount;
    }

    public void setCourseCount(int courseCount) {
        this.courseCount = courseCount;
    }

    public String getCourseIsClose() {
        return courseIsClose;
    }

    public void setCourseIsClose(String courseIsClose) {
        this.courseIsClose = courseIsClose;
    }
}
