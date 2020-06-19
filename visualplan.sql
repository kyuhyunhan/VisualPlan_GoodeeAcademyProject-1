SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS todo;
DROP TABLE IF EXISTS stage;
DROP TABLE IF EXISTS plan;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE board
(
	-- 1. 공지사항(notice)
	-- 2. 자유게시판(freeboard)
	btype int NOT NULL COMMENT '1. 공지사항(notice)
2. 자유게시판(freeboard)',
	boardno int NOT NULL,
	id varchar(20) NOT NULL,
	title varchar(50) NOT NULL,
	boarddate datetime,
	content varchar(4000),
	readcnt int,
	PRIMARY KEY (btype, boardno)
);


CREATE TABLE member
(
	id varchar(20) NOT NULL,
	password varchar(20),
	name varchar(10),
	email varchar(30),
	PRIMARY KEY (id)
);


CREATE TABLE plan
(
	planno int NOT NULL,
	id varchar(20) NOT NULL,
	title varchar(20) NOT NULL,
	detail varchar(200),
	PRIMARY KEY (planno)
);


CREATE TABLE reply
(
	-- 1. 공지사항(notice)
	-- 2. 자유게시판(freeboard)
	btype int NOT NULL COMMENT '1. 공지사항(notice)
2. 자유게시판(freeboard)',
	boardno int NOT NULL,
	replyno int NOT NULL,
	id varchar(20) NOT NULL,
	comment varchar(500),
	replydate datetime,
	PRIMARY KEY (btype, boardno, replyno)
);


CREATE TABLE stage
(
	planno int NOT NULL,
	stageno int NOT NULL,
	stagetitle varchar(20),
	percentage int(10),
	PRIMARY KEY (stageno)
);


CREATE TABLE todo
(
	planno int NOT NULL,
	stageno int NOT NULL,
	no int NOT NULL,
	item varchar(20),
	checked boolean,
	PRIMARY KEY (no)
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (btype, boardno)
	REFERENCES board (btype, boardno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE plan
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE stage
	ADD FOREIGN KEY (planno)
	REFERENCES plan (planno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE todo
	ADD FOREIGN KEY (planno)
	REFERENCES plan (planno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE todo
	ADD FOREIGN KEY (stageno)
	REFERENCES stage (stageno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



