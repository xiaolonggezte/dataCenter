

CREATE DATABASE `datacenter`;

USE datacenter;

CREATE TABLE `user` (
  `user_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '用户id',
  `user_name` VARCHAR(50) DEFAULT NULL COMMENT '用户姓名',
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
  `device_name` VARCHAR(50) DEFAULT NULL COMMENT '设备名称',
  `device_description` VARCHAR(200) DEFAULT NULL COMMENT '设备用途描述',
  `is_used` INT DEFAULT 0 COMMENT '设备使用情况：0,未被借用，1,被借用',
  `device_status` INT DEFAULT 1 COMMENT '设备状态:1,正常;2,损坏;3,遗失;4,报废',
  `device_category_id` VARCHAR(50) DEFAULT NULL COMMENT '设备类别id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '设备';


CREATE TABLE `device_category` (
  `device_category_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '设备类别id',
  `device_category_name` VARCHAR(50) UNIQUE COMMENT '设备类别名称',
  `device_category_price` FLOAT COMMENT '设备价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '设备类别';





