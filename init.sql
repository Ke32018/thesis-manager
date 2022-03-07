CREATE DATABASE `thesis_manager` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- thesis_manager.t_student definition

CREATE TABLE `t_student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `sex` int NOT NULL DEFAULT '0',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `profession` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专业',
  `idnumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号',
  `politics` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '政治面貌',
  `introduction` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `thesis_id` int DEFAULT NULL,
  `power` int NOT NULL DEFAULT '1' COMMENT '权限',
  `edu_system` int NOT NULL DEFAULT '4' COMMENT '学制',
  `passwd` varchar(20) NOT NULL DEFAULT '666666' COMMENT '密码',
  `class_id` int DEFAULT NULL,
  `major_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表中的属性总体来说可以分为两种：一种是不易变更或不可变更的，如果随意更改会引起管理混乱，如姓名、学号、性别等，这类属性一般由教学秘书等管理员批量导入；另一种属于学生自我评价或常用联系方式之类，可以允许学生自由变更，这样既可以使学生由一定的自主性，也可以减少管理者的工作量。\r\n下面是对表中一些说明不太明确的属性的详细介绍。\r\nsex：性别，int型数据，0代表女性，1代表男性，其他数字代表性别未知\r\nPower：权限，int型数据，代表学生具有的权限，1代表的权限最低，权限随功能需求的变化而变化具体权限为，学生<老师<管理员，管理员权限最高。\r\nEdu_system：学制，一般为4年，大四进行毕业论文设计。';


-- thesis_manager.t_teacher definition

CREATE TABLE `t_teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL COMMENT '工号',
  `passwd` varchar(20) DEFAULT NULL COMMENT '密码',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `sex` int DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `nation` varchar(10) DEFAULT NULL COMMENT '民族',
  `power` int DEFAULT NULL,
  `institute_id` int DEFAULT NULL COMMENT '学院序号',
  `title` varchar(10) DEFAULT NULL COMMENT '职称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Teacher表中的属性也可以分为两种：一种是不易变更或不可变更的，如姓名、工号、性别、职称等，这类属性一般由教学秘书等管理员批量导入；另一种属于老师的自我介绍或常用联系方式之类，可以自由变更以减少管理者的工作量。\r\n下面是对表中说明不太明确的属性的详细介绍。\r\nTitle：职称，在view层作输入控制，并由此决定其默认可以带的学生数上限。';


-- thesis_manager.t_admin definition

CREATE TABLE `t_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工号',
  `passwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `sex` int DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `nation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '民族',
  `power` int DEFAULT NULL,
  `institute_id` int DEFAULT NULL COMMENT '学院序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin表中的属性管理员（教秘等）可以全权变更，由于一般教学秘书不参与指导学生论文写作中来，所以相比老师而言，缺少了向学生展示的属性。';


-- thesis_manager.t_class definition

CREATE TABLE `t_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `major_id` int DEFAULT NULL,
  `institute_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- thesis_manager.t_major definition

CREATE TABLE `t_major` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `institute_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专业';


-- thesis_manager.t_thesis definition

CREATE TABLE `t_thesis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT NULL COMMENT '论文题目',
  `teacher_code` varchar(100) DEFAULT NULL COMMENT '老师工号',
  `content` varchar(100) DEFAULT NULL,
  `path` varchar(20) DEFAULT NULL COMMENT '存储路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论文表';


-- thesis_manager.t_institute definition

CREATE TABLE `t_institute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学院';


-- thesis_manager.t_start definition

CREATE TABLE `t_start` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stu_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学生学号',
  `teacher_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '老师工号',
  `thesis_id` int DEFAULT NULL COMMENT '论文序号',
  `content` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `source` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源',
  `other` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开题报告';


-- thesis_manager.t_middle definition

CREATE TABLE `t_middle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stu_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学生学号',
  `teacher_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '老师工号',
  `thesis_id` int DEFAULT NULL COMMENT '论文序号',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL COMMENT '时间',
  `other` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `place` varchar(20) DEFAULT NULL COMMENT '地点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中期检查';


-- thesis_manager.t_coach definition

CREATE TABLE `t_coach` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `content` varchar(100) DEFAULT NULL COMMENT '辅导内容',
  `Date` datetime DEFAULT NULL COMMENT '辅导时间',
  `thesis_id` int DEFAULT NULL COMMENT '论文id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='辅导记录';


-- thesis_manager.t_choose definition

CREATE TABLE `t_choose` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stu_code` varchar(20) DEFAULT NULL,
  `thesis_id` int DEFAULT NULL COMMENT '题目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='选题表';


-- thesis_manager.t_major_limit definition

CREATE TABLE `t_major_limit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_id` int DEFAULT NULL COMMENT '题目编号',
  `Major01` int DEFAULT NULL,
  `Major02` int DEFAULT NULL,
  `Major03` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专业限制，subject的major_limit属性为’1’时生效，此时，只有表中专业的学生可以选择本题目。';


-- thesis_manager.t_review definition

CREATE TABLE `t_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_idi` int DEFAULT NULL COMMENT '论文id',
  `success` int DEFAULT NULL COMMENT '审核通过否',
  `other` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导师审核';