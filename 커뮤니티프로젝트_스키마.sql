-- ---------------------------------------- 객체와 시퀀스 제거 -----------------------------------------
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE board_reply CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE grade CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE image CASCADE CONSTRAINTS;
DROP TABLE image_reply CASCADE CONSTRAINTS;
DROP TABLE message CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;

DROP SEQUENCE board_seq;
DROP SEQUENCE board_reply_seq;
DROP SEQUENCE notice_seq;
DROP SEQUENCE image_seq;
DROP SEQUENCE image_reply_seq;
DROP SEQUENCE message_seq;
DROP SEQUENCE qna_seq;

-- ------------------------------------------ 스키마 생성 ------------------------------------------
-- board(게시판)
CREATE TABLE board(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL, -- 제목은 한글로 100자까지
content VARCHAR2(2000) NOT NULL,
writer VARCHAR2(30) NOT NULL, -- 작성자는 한글로 10자까지
writeDate DATE DEFAULT SYSDATE, 
hit NUMBER DEFAULT 0
);

-- board_reply(게사판 댓글)
CREATE TABLE board_reply(
rno NUMBER PRIMARY KEY,
no NUMBER REFERENCES board(no) ON DELETE CASCADE,
content VARCHAR2(1000) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE,
writeDate DATE DEFAULT SYSDATE
);

-- notice(공지사항) >> 번호, 제목, 내용, 작성일, 공지시작일, 공지종료일, 수정일
CREATE TABLE notice(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR(2000) NOT NULL,
startDate DATE DEFAULT SYSDATE,
endDate DATE DEFAULT '9999-12-30',
writeDate DATE DEFAULT SYSDATE,
updateDate DATE DEFAULT SYSDATE
);

-- grade(등급)
CREATE TABLE grade(
gradeNo NUMBER(2) PRIMARY KEY,
gradeName VARCHAR2(20)
);

-- member(회원관리)
CREATE TABLE member(
id VARCHAR2(20) PRIMARY KEY,
pw VARCHAR2(20) NOT NULL,
name VARCHAR2(30) NOT NULL,
gender VARCHAR2(6) NOT NULL CHECK (gender in('남자', '여자')),
birth DATE NOT NULL,
tel VARCHAR2(13),
email VARCHAR2(50) NOT NULL,
regDate DATE DEFAULT SYSDATE,
conDate DATE DEFAULT SYSDATE,
status VARCHAR2(6) DEFAULT '정상' CHECK (status in ('정상','강퇴','탈퇴','휴면')) ,
photo VARCHAR2(50) DEFAULT '/upload/member/noImage.jpg',
-- FK(Foriegn Key:참조키) - grade.gradeNo에 데이터가 없으면 입력 못함 null은 입력 가능.
-- 1: 일반회원, 9: 관리자
gradeNo NUMBER(2) DEFAULT 1 REFERENCES grade(gradeNo)
);

-- image(이미지)
CREATE TABLE image(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR2(2000) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES member(id),
writeDate DATE DEFAULT SYSDATE,
fileName VARCHAR2(50) NOT NULL
);

-- image(이미지 댓글)
CREATE TABLE image_reply(
    rno NUMBER,
    no NUMBER not null,
    reply VARCHAR2(1000) not null,
    replyer VARCHAR2(50) not NULL,
    replyDate DATE DEFAULT sysdate,
    updateDate DATE DEFAULT sysdate
);

-- message(메세지)
CREATE TABLE message(
no NUMBER PRIMARY KEY,
content VARCHAR2(2000) NOT NULL,
senderId VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE,
sendDate DATE DEFAULT SYSDATE,
accepterId VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE,
acceptDate DATE DEFAULT null,
allUser NUMBER(1) DEFAULT 0
);

-- qna(질문답변)
CREATE TABLE qna(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR2(2000) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES member(id),
writeDate DATE DEFAULT SYSDATE,
hit NUMBER DEFAULT 0,
refNo NUMBER REFERENCES qna(no), -- 관련 번호(1차 정렬)
ordNo NUMBER, -- 순서 번호(2차 정렬) 1 -> +1
levNo NUMBER, -- 들여쓰기 0 -> +1
parentNo NUMBER REFERENCES qna(no) ON DELETE CASCADE -- 부모글
);

-- ----------------------------------------- 제약 조건 추가 ----------------------------------------
-- image_reply 제약 조건 추가
ALTER TABLE image_reply
ADD CONSTRAINT image_reply_rno_pk PRIMARY KEY(rno);

ALTER TABLE image_reply
ADD CONSTRAINT image_reply_no_fk
FOREIGN KEY (no) REFERENCES image(no);

-- 페이지 처리를 위한 인덱스 생성
CREATE INDEX idx_image_reply ON image_reply(no DESC, rno DESC);

-- ------------------------------------------ 시퀀스 생성 ------------------------------------------
-- 번호(no)는 시퀀스로 처리
CREATE SEQUENCE board_seq;
CREATE SEQUENCE board_reply_seq;
CREATE SEQUENCE notice_seq;
CREATE SEQUENCE image_seq;
CREATE SEQUENCE image_reply_seq;
CREATE SEQUENCE message_seq;
CREATE SEQUENCE qna_seq;

-- --------------------------------------- 샘플 데이터 추가 ----------------------------------------
-- board
INSERT INTO board(no, title, content, writer)VALUES(board_seq.nextval, 'java', '자바입니다.','게스트1');
INSERT INTO board(no, title, content, writer)VALUES(board_seq.nextval, 'oracle', '오라클입니다.','게스트2');
INSERT INTO board(no, title, content, writer)VALUES(board_seq.nextval, 'web', '웹 입니다.','게스트3');

-- board_reply
INSERT INTO board_reply(rno, no, content, id) VALUES(board_reply_seq.nextval, 281, '좋아요', 'test');
INSERT INTO board_reply(rno, no, content, id) VALUES(board_reply_seq.nextval, 281, '댓글테스트', 'test');

-- notice
INSERT INTO notice(no, title, content, startDate, endDate) VALUES(notice_seq.nextval, '자바 개념', '자바입니다.', '2021-04-01', '2021-10-28');
INSERT INTO notice(no, title, content, startDate, endDate) VALUES(notice_seq.nextval, '오라클 개념', '오라클입니다.', '2021-05-15', '2021-06-01');
INSERT INTO notice(no, title, content, startDate, endDate) VALUES(notice_seq.nextval, '자바스크립트 개념', '자바스크립트입니다.', '2021-10-13', '2021-10-28');
INSERT INTO notice(no, title, content, startDate, endDate) VALUES(notice_seq.nextval, '자바 개념', '자바입니다.', '2022-11-01', '2023-10-28');
-- grade
INSERT INTO grade VALUES(1, '일반회원');
INSERT INTO grade VALUES(9, '관리자');

-- member 
-- 관리자 계정 - 등급번호 9로 반드시 지정
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo, gradeNo)
VALUES('admin', '1111', '홍길동', '남자', '1992-12-04', '010-1111-2222', 'hh@nate.com','/upload/member/undraw_profile_1.svg', 9);
-- 일반회원 계정 - 등급번호는 기본으로 1이 된다.
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo)
VALUES('test', '1111', '문길동', '여자', '1902-06-28', '010-3333-4444', 'mm@naver.com','/upload/member/undraw_profile_2.svg');

-- image 
-- 회원으로 등록되어 있는 아이디만 사용 가능 - test, admin
INSERT INTO image(no, title, content, id, fileName) VALUES(image_seq.nextval, '이미지', '꽃이미지', 'test', '/upload/image/1.jpg');
INSERT INTO image(no, title, content, id, fileName) VALUES(image_seq.nextval, '강아지', '귀여운강아지', 'admin', '/upload/image/2.jpg');
INSERT INTO image(no, title, content, id, fileName) VALUES(image_seq.nextval, '버스', '큰 버스', 'test2', '/upload/image/5.jpg');
commit;

-- message
-- test -> admin
INSERT INTO message(no, content, senderId, accepterId) VALUES(message_seq.nextval, '안녕하세요~', 'test', 'admin');
-- admin -> test
INSERT INTO message(no, content, senderId, accepterId) VALUES(message_seq.nextval, '반갑습니다.~', 'admin', 'test');


-- qna
-- 질문하기1
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, 'java란?', 'java란 무엇인가요?', 'test', qna_seq.nextval, 1, 0, null);
--질문하기2
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, 'oracle란?', 'oracle란 무엇인가요?', 'test', qna_seq.nextval, 1, 0, null);
-- 답변하기1
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, '[답변]java란?', '프로그램 언어', 'admin', 1, 2, 1, 1);
-- 답변하기1-1
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, '[답변][답변]java란?', '객체지향적 언어란?', 'test', 1, 3, 2, 5);
-- 답변하기2
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, '[답변]oracle이란?', '데이터베이스', 'admin', 3, 2, 1, 3);

