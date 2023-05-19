-- ---------------------------------------- ��ü�� ������ ���� -----------------------------------------
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

-- ------------------------------------------ ��Ű�� ���� ------------------------------------------
-- board(�Խ���)
CREATE TABLE board(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL, -- ������ �ѱ۷� 100�ڱ���
content VARCHAR2(2000) NOT NULL,
writer VARCHAR2(30) NOT NULL, -- �ۼ��ڴ� �ѱ۷� 10�ڱ���
writeDate DATE DEFAULT SYSDATE, 
hit NUMBER DEFAULT 0
);

-- board_reply(�Ի��� ���)
CREATE TABLE board_reply(
rno NUMBER PRIMARY KEY,
no NUMBER REFERENCES board(no) ON DELETE CASCADE,
content VARCHAR2(1000) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE,
writeDate DATE DEFAULT SYSDATE
);

-- notice(��������) >> ��ȣ, ����, ����, �ۼ���, ����������, ����������, ������
CREATE TABLE notice(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR(2000) NOT NULL,
startDate DATE DEFAULT SYSDATE,
endDate DATE DEFAULT '9999-12-30',
writeDate DATE DEFAULT SYSDATE,
updateDate DATE DEFAULT SYSDATE
);

-- grade(���)
CREATE TABLE grade(
gradeNo NUMBER(2) PRIMARY KEY,
gradeName VARCHAR2(20)
);

-- member(ȸ������)
CREATE TABLE member(
id VARCHAR2(20) PRIMARY KEY,
pw VARCHAR2(20) NOT NULL,
name VARCHAR2(30) NOT NULL,
gender VARCHAR2(6) NOT NULL CHECK (gender in('����', '����')),
birth DATE NOT NULL,
tel VARCHAR2(13),
email VARCHAR2(50) NOT NULL,
regDate DATE DEFAULT SYSDATE,
conDate DATE DEFAULT SYSDATE,
status VARCHAR2(6) DEFAULT '����' CHECK (status in ('����','����','Ż��','�޸�')) ,
photo VARCHAR2(50) DEFAULT '/upload/member/noImage.jpg',
-- FK(Foriegn Key:����Ű) - grade.gradeNo�� �����Ͱ� ������ �Է� ���� null�� �Է� ����.
-- 1: �Ϲ�ȸ��, 9: ������
gradeNo NUMBER(2) DEFAULT 1 REFERENCES grade(gradeNo)
);

-- image(�̹���)
CREATE TABLE image(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR2(2000) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES member(id),
writeDate DATE DEFAULT SYSDATE,
fileName VARCHAR2(50) NOT NULL
);

-- image(�̹��� ���)
CREATE TABLE image_reply(
    rno NUMBER,
    no NUMBER not null,
    reply VARCHAR2(1000) not null,
    replyer VARCHAR2(50) not NULL,
    replyDate DATE DEFAULT sysdate,
    updateDate DATE DEFAULT sysdate
);

-- message(�޼���)
CREATE TABLE message(
no NUMBER PRIMARY KEY,
content VARCHAR2(2000) NOT NULL,
senderId VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE,
sendDate DATE DEFAULT SYSDATE,
accepterId VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE,
acceptDate DATE DEFAULT null,
allUser NUMBER(1) DEFAULT 0
);

-- qna(�����亯)
CREATE TABLE qna(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR2(2000) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES member(id),
writeDate DATE DEFAULT SYSDATE,
hit NUMBER DEFAULT 0,
refNo NUMBER REFERENCES qna(no), -- ���� ��ȣ(1�� ����)
ordNo NUMBER, -- ���� ��ȣ(2�� ����) 1 -> +1
levNo NUMBER, -- �鿩���� 0 -> +1
parentNo NUMBER REFERENCES qna(no) ON DELETE CASCADE -- �θ��
);

-- ----------------------------------------- ���� ���� �߰� ----------------------------------------
-- image_reply ���� ���� �߰�
ALTER TABLE image_reply
ADD CONSTRAINT image_reply_rno_pk PRIMARY KEY(rno);

ALTER TABLE image_reply
ADD CONSTRAINT image_reply_no_fk
FOREIGN KEY (no) REFERENCES image(no);

-- ������ ó���� ���� �ε��� ����
CREATE INDEX idx_image_reply ON image_reply(no DESC, rno DESC);

-- ------------------------------------------ ������ ���� ------------------------------------------
-- ��ȣ(no)�� �������� ó��
CREATE SEQUENCE board_seq;
CREATE SEQUENCE board_reply_seq;
CREATE SEQUENCE notice_seq;
CREATE SEQUENCE image_seq;
CREATE SEQUENCE image_reply_seq;
CREATE SEQUENCE message_seq;
CREATE SEQUENCE qna_seq;

-- --------------------------------------- ���� ������ �߰� ----------------------------------------
-- board
INSERT INTO board(no, title, content, writer)VALUES(board_seq.nextval, 'java', '�ڹ��Դϴ�.','�Խ�Ʈ1');
INSERT INTO board(no, title, content, writer)VALUES(board_seq.nextval, 'oracle', '����Ŭ�Դϴ�.','�Խ�Ʈ2');
INSERT INTO board(no, title, content, writer)VALUES(board_seq.nextval, 'web', '�� �Դϴ�.','�Խ�Ʈ3');

-- board_reply
INSERT INTO board_reply(rno, no, content, id) VALUES(board_reply_seq.nextval, 281, '���ƿ�', 'test');
INSERT INTO board_reply(rno, no, content, id) VALUES(board_reply_seq.nextval, 281, '����׽�Ʈ', 'test');

-- notice
INSERT INTO notice(no, title, content, startDate, endDate) VALUES(notice_seq.nextval, '�ڹ� ����', '�ڹ��Դϴ�.', '2021-04-01', '2021-10-28');
INSERT INTO notice(no, title, content, startDate, endDate) VALUES(notice_seq.nextval, '����Ŭ ����', '����Ŭ�Դϴ�.', '2021-05-15', '2021-06-01');
INSERT INTO notice(no, title, content, startDate, endDate) VALUES(notice_seq.nextval, '�ڹٽ�ũ��Ʈ ����', '�ڹٽ�ũ��Ʈ�Դϴ�.', '2021-10-13', '2021-10-28');
INSERT INTO notice(no, title, content, startDate, endDate) VALUES(notice_seq.nextval, '�ڹ� ����', '�ڹ��Դϴ�.', '2022-11-01', '2023-10-28');
-- grade
INSERT INTO grade VALUES(1, '�Ϲ�ȸ��');
INSERT INTO grade VALUES(9, '������');

-- member 
-- ������ ���� - ��޹�ȣ 9�� �ݵ�� ����
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo, gradeNo)
VALUES('admin', '1111', 'ȫ�浿', '����', '1992-12-04', '010-1111-2222', 'hh@nate.com','/upload/member/undraw_profile_1.svg', 9);
-- �Ϲ�ȸ�� ���� - ��޹�ȣ�� �⺻���� 1�� �ȴ�.
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo)
VALUES('test', '1111', '���浿', '����', '1902-06-28', '010-3333-4444', 'mm@naver.com','/upload/member/undraw_profile_2.svg');

-- image 
-- ȸ������ ��ϵǾ� �ִ� ���̵� ��� ���� - test, admin
INSERT INTO image(no, title, content, id, fileName) VALUES(image_seq.nextval, '�̹���', '���̹���', 'test', '/upload/image/1.jpg');
INSERT INTO image(no, title, content, id, fileName) VALUES(image_seq.nextval, '������', '�Ϳ������', 'admin', '/upload/image/2.jpg');
INSERT INTO image(no, title, content, id, fileName) VALUES(image_seq.nextval, '����', 'ū ����', 'test2', '/upload/image/5.jpg');
commit;

-- message
-- test -> admin
INSERT INTO message(no, content, senderId, accepterId) VALUES(message_seq.nextval, '�ȳ��ϼ���~', 'test', 'admin');
-- admin -> test
INSERT INTO message(no, content, senderId, accepterId) VALUES(message_seq.nextval, '�ݰ����ϴ�.~', 'admin', 'test');


-- qna
-- �����ϱ�1
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, 'java��?', 'java�� �����ΰ���?', 'test', qna_seq.nextval, 1, 0, null);
--�����ϱ�2
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, 'oracle��?', 'oracle�� �����ΰ���?', 'test', qna_seq.nextval, 1, 0, null);
-- �亯�ϱ�1
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, '[�亯]java��?', '���α׷� ���', 'admin', 1, 2, 1, 1);
-- �亯�ϱ�1-1
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, '[�亯][�亯]java��?', '��ü������ ����?', 'test', 1, 3, 2, 5);
-- �亯�ϱ�2
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, '[�亯]oracle�̶�?', '�����ͺ��̽�', 'admin', 3, 2, 1, 3);

