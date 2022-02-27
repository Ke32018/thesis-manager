CREATE TABLE thesis_manager.student (
	stuid int auto_increment NOT NULL,
	stuname varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	stuno varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '学号',
	sex int NULL,
	phone varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	email varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	address varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	profession varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '专业',
	idnumber varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '身份证号',
	politics varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '政治面貌',
	introduction varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	thesis_id int NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (stuid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci
COMMENT='';
