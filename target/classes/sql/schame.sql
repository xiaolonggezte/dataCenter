

CREATE DATABASE `datacenter`;

USE datacenter;

CREATE TABLE `user` (
  `user_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '用户id',
  `user_name` VARCHAR(50)  UNIQUE NOT NULL COMMENT '用户姓名',
  `password` VARCHAR(50) NOT NULL COMMENT '密码',
  `user_email` VARCHAR(50) DEFAULT NULL COMMENT '用户邮箱',
  `user_tel` VARCHAR(11) DEFAULT NULL COMMENT '用户电话',
  `user_admin` INT DEFAULT 0 COMMENT '用户权限,0代表普通用户,1代表管理员'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户表';

CREATE TABLE `lab` (
  `lab_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '实验室id',
  `lab_name` VARCHAR(50) DEFAULT NULL COMMENT '实验室名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '实验室';

CREATE TABLE `device` (
  `device_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '设备id',
  `is_used` VARCHAR(10) DEFAULT '未借用' COMMENT '设备使用情况：未借用;借用',
  `device_status` VARCHAR(10) DEFAULT '正常' COMMENT '设备状态:正常;损坏;遗失;报废',
  `device_category_id` VARCHAR(50) DEFAULT NULL COMMENT '设备类别id',
  `device_unit_id` INT COMMENT '领用单位',
  `device_unit_name` VARCHAR(50) COMMENT '领用单位名称',
  `device_number` INT COMMENT '仪器编号',
  `device_category_number` INT COMMENT '分类号',
  `device_name` VARCHAR(50) DEFAULT NULL COMMENT '仪器名称',
  `device_version` VARCHAR(20) COMMENT '仪器型号',
  `device_price` FLOAT COMMENT '单价',
  `device_menufactor` VARCHAR(20) COMMENT '生产厂家',
  `device_date` VARCHAR(20) COMMENT '购置日期',
  `device_getter` VARCHAR(20) COMMENT '领用人',
  `device_subject` VARCHAR(20) COMMENT '经费科目名',
  `device_use_deriction` VARCHAR(20) COMMENT '使用方向',
  `device_room` VARCHAR(20) COMMENT '使用房间',
  `device_hander` VARCHAR(20) COMMENT '经手人'

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '设备';


CREATE TABLE `course` (
  `course_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '课表id',
  `course_unit` VARCHAR(50) DEFAULT NULL COMMENT '开课单位',
  `course_number` VARCHAR(20) DEFAULT NULL COMMENT '课程编号',
  `course_name` VARCHAR(50) DEFAULT NULL COMMENT '课程名称',
  `course_project_number` VARCHAR(30) DEFAULT NULL COMMENT '项目编号',
  `course_project_name` VARCHAR(50) DEFAULT NULL COMMENT '项目名称',
  `course_week` INT COMMENT '周次',
  `course_day` VARCHAR(10) COMMENT '星期',
  `course_node` VARCHAR(10) COMMENT '节次',
  `course_place` VARCHAR(20) COMMENT '地点',
  `course_techer` VARCHAR(20) COMMENT '指导老师',
  `course_class` VARCHAR(20) COMMENT '学生班级',
  `course_count` INT COMMENT '学生人数',
  `course_is_close` VARCHAR(10) DEFAULT '否' COMMENT '是否停课'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '课表';


