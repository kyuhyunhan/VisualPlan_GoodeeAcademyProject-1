SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS board;
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
	id varchar(20) NOT NULL,
	planno int NOT NULL,
	title varchar(20) NOT NULL,
	detail varchar(200),
	PRIMARY KEY (id, planno)
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
	id varchar(20) NOT NULL,
	planno int NOT NULL,
	stageno int NOT NULL,
	stagetitle varchar(20),
	percentage int(10),
	-- 메모, 확인사항
	memo varchar(500) COMMENT '메모, 확인사항',
	checked boolean,
	PRIMARY KEY (id, planno, stageno)
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
	ADD FOREIGN KEY (id, planno)
	REFERENCES plan (id, planno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



