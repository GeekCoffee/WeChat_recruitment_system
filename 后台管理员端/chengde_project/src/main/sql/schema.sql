-- 数据库初始化脚本

-- 创建数据库，自定义名字

-- 创建表 chengde_register
CREATE TABLE `chengde_register` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL DEFAULT '0' COMMENT '应聘人姓名',
  `sex` VARCHAR(50) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '年龄',
  `position` VARCHAR(50) NOT NULL DEFAULT '0' COMMENT '期待职位',
  `phone` VARCHAR(50) NOT NULL DEFAULT '0' COMMENT '电话',
  `speciality` VARCHAR(200) NULL DEFAULT '0' COMMENT '特长',
  `salary` VARCHAR(50) NOT NULL DEFAULT '0' COMMENT '期待工资',
  `treatment` VARCHAR(300) NOT NULL DEFAULT '0' COMMENT '期望待遇有哪些',
  `experience` TEXT NULL COMMENT '以往的经历',
  PRIMARY KEY (`user_id`)
)
  COMMENT='诚德应聘人员注册表'
  COLLATE='utf8_general_ci'
  ENGINE=InnoDB
  AUTO_INCREMENT=8
;



-- 初始化表 chengde_register
INSERT INTO
  chengde_register (name,sex,age,position,phone,speciality,salary,treatment,experience)
VALUES ('赵士玮','女',21,'董事长','13134439940','钢琴','5000','五险一金、房补','参与剑桥大学交换生项目');


-- 创建表 chengde_basic
CREATE TABLE `chengde_basic` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `root` VARCHAR(50) NOT NULL COMMENT '管理员帐号',
  `password` VARCHAR(50) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
)
  COMMENT='管理员登录使用'
  COLLATE='utf8_general_ci'
  ENGINE=InnoDB
;

-- 初始化 chengde_basic
INSERT INTO
  chengde_basic (root,password)
VALUES ('chengde2018','chengde2018');