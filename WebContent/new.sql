drop table teach;
drop table enroll;
drop table student;
drop table professor;
drop table course;

CREATE TABLE student
(
    s_id NUMBER(10),
    s_pwd VARCHAR2(10) not null,
    s_name VARCHAR2(50) not null,
    s_addr VARCHAR2(200),
    s_email VARCHAR2(100),
    s_tel VARCHAR2(100),
    s_grade NUMBER(1) not null,
    s_major VARCHAR2(50) not null,
    CONSTRAINT s_pk PRIMARY KEY (s_id)
);

INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_tel, s_grade, s_major) VALUES
('1312334', '1234', '신민아', '경기도 화성군 송산면 고성 5리 540-2', 'abcd@gmail.com', '010-4424-1121', 4, '컴퓨터과학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_tel, s_grade, s_major) VALUES
('1311223', 'gogomi', '박지연', '서울시 마포구 공덕동 12-98 공덕오피스타 1103호', 'gogomi@naver.com', '010-1122-3344', 4, '멀티미디어학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_tel, s_grade, s_major) VALUES
('1315842', 'abc1234', '신혜정', '서울시 관안구 남부순환로248-56', 'shinsy11@naver.com', '010-7271-2808', 4, '컴퓨터과학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_tel, s_grade, s_major) VALUES
('1412783', 'abcdefg', '김우진', '경기도 수원시 권선동 아이파크시티 103동 702호', 'woojin@gmail.com', '010-4244-1168', 3, '컴퓨터과학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_tel, s_grade, s_major) VALUES
('1545642', 'ab1234', '김지은', '서울시 영등포구 여의도동 540-2', 'micky@gmail.com', '010-4543-8767', 2, '멀티미디어학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_tel, s_grade, s_major) VALUES
('1316803', 'qwerty', '김지민', '서울시 송파구 가락로 6길 89 302호', 'hikoseom@naver.com', '010-4536-9879', 4, '컴퓨터과학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_tel, s_grade, s_major) VALUES
('1411543', 'ino08', '배인희', '서울시 송파구 올림픽로 435 파크타운 205동 104호', 'ino23@gmail.com', '010-3831-3652', 2, '무용과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_tel, s_grade, s_major) VALUES
('1543211', 'igogo', '나고은', '인천광역시 남동구 호구포로 803 롯데케슬 102동 501호', 'megogo@gmail.com', '010-9988-1122', 1, '미디어학부');


CREATE TABLE course
(
    c_id NUMBER(10),
    c_class NUMBER(1),
    c_name VARCHAR2(50),
    c_credit NUMBER(1),
    c_time VARCHAR2(20),
    c_day VARCHAR2(20),
    c_classroom VARCHAR2(50),
    c_max NUMBER(3),
    p_id NUMBER(10),
    CONSTRAINT c_pk PRIMARY KEY (c_id, c_class));

INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10045', 1, '컴퓨터구조', 3, '10:30-11:45', '화,목', '명신관411', 45, '004580');
INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10050', 1, '컴파일러', 3, '10:30-11:45', '월,수', '명신관202', 55, '004500');
INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10055', 1, '컴퓨터네트워크', 3, '15:00-16:15', '월,수', '명신관420', 60, '004525');
INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10365', 1, '웹시스템설계', 3, '15:00-16:15', '화,목', '명신관409', 30, '004545');
INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10070', 1, '프로그래밍언어', 3, '12:00-13:15', '화,목', '명신관405', 60, '004535');
INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10075', 1, '디지털논리회로', 3, '13:30-14:45', '월,수', '명신관413', 55, '004585');
INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10080', 1, '운영체제', 3, '15:00-16:15', '월,수', '명신관413', 60, '004585');
INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10085', 1, '영상정보처리', 3, '09:00-10:15', '월,수', '명신관315', 50, '004575');
INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10015', 1, '데이터사이언스개론', 3, '12:00-13:15', '화,목', '프라임관401', 70, '004590');
INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10072', 1, '데이터마이닝및분석', 3, '15:00-16:15', '화,목', '프라임관202', 70, '004590');
INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10099', 1, '사용자인터페이스', 3, '12:00-14:50', '금', '명신관408', 20, '004790');
INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id) VALUES ('10041', 1, '인공지능', 3, '09:00-10:15', '월,수', '명신관307', 40, '004990');


CREATE TABLE professor
(
    p_id NUMBER(10),
    p_pwd VARCHAR2(20) not null,
    p_name VARCHAR2(50) not null,
    p_major VARCHAR2(50) not null,
    p_email VARCHAR2(100),
    CONSTRAINT p_pk PRIMARY KEY (p_id)
);

INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004580', 'bhmoon', '문봉희', '컴퓨터과학과', 'moon@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004545', 'yhkim', '김윤희', '컴퓨터과학과', 'yulan@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004550', 'bmchang', '창병모', '컴퓨터과학과', 'chang@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004575', 'ywchoi', '최영우', '컴퓨터과학과', 'ywchoi@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004555', 'hjlee', '이현자', '컴퓨터과학과', 'hyunjalee@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004590', 'kylee', '이기용', '컴퓨터과학과', 'kiyonglee@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004595', 'yjkim', '김윤진', '컴퓨터과학과', 'ykim@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004530', 'sjyu', '유석종', '컴퓨터과학과', 'sjyu@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004535', 'sypark', '박숙영', '컴퓨터과학과', 'blue@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004585', 'jgkim',  '김주균', '컴퓨터과학과', 'jgkim@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004525', 'jwchoi', '최종원', '컴퓨터과학과', 'choejn@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004500', 'yhpark', '박영훈', '컴퓨터과학과', 'yh.park@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004790', 'yjjeong', '정영주', '컴퓨터과학과', 'yjeong@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_email) VALUES ('004990', 'hjchae', '채희준', '컴퓨터과학과', 'heechae@sm.ac.kr');


CREATE TABLE open
(
    p_id NUMBER(10),
    c_id NUMBER(10),
    c_class NUMBER(10),
    e_year NUMBER(4),
    e_semester NUMBER(1),
    CONSTRAINT o_p_id_fk FOREIGN KEY (p_id) REFERENCES professor (p_id),
    CONSTRAINT o_c_id_fk FOREIGN KEY (c_id, c_class) REFERENCES course (c_id, c_class)
);

INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4580', '10045', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4500', '10050', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4525', '10055', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4545', '10365', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4535', '10070', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4585', '10075', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4585', '10080', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4575', '10085', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4590', '10015', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4595', '10060', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4790', '10099', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4990', '10041', 1, 2019, 1);
INSERT INTO open(p_id, c_id, c_class, e_year, e_semester) VALUES ('4590', '10072', 1, 2019, 1);




CREATE TABLE enroll
(
    s_id NUMBER(10),
    c_id NUMBER(10),
    c_class NUMBER(1),
    e_year NUMBER(4),
    e_semester NUMBER(1),
    CONSTRAINT e_pk PRIMARY KEY (s_id, c_id, c_class),
    CONSTRAINT s_id_fk FOREIGN KEY (s_id) REFERENCES  student (s_id),
    CONSTRAINT e_c_id_fk FOREIGN KEY (c_id, c_class) REFERENCES  course (c_id, c_class)
);

INSERT INTO enroll(s_id, c_id, c_class, e_year, e_semester) VALUES ('1315842', '10055', 1, 2019, 1);
INSERT INTO enroll(s_id, c_id, c_class, e_year, e_semester) VALUES ('1315842', '10050', 1, 2019, 1);
INSERT INTO enroll(s_id, c_id, c_class, e_year, e_semester) VALUES ('1315842', '10045', 1, 2019, 1);
INSERT INTO enroll(s_id, c_id, c_class, e_year, e_semester) VALUES ('1312334', '10055', 1, 2019, 1);
INSERT INTO enroll(s_id, c_id, c_class, e_year, e_semester) VALUES ('1312334', '10085', 1, 2019, 1);
INSERT INTO enroll(s_id, c_id, c_class, e_year, e_semester) VALUES ('1312334', '10075', 1, 2019, 1);
INSERT INTO enroll(s_id, c_id, c_class, e_year, e_semester) VALUES ('1316803', '10070', 1, 2019, 1);
INSERT INTO enroll(s_id, c_id, c_class, e_year, e_semester) VALUES ('1316803', '10080', 1, 2019, 1);
INSERT INTO enroll(s_id, c_id, c_class, e_year, e_semester) VALUES ('1316803', '10015', 1, 2019, 1);


CREATE TABLE teach
(
    p_id NUMBER(10),
    c_id NUMBER(10),
    c_class NUMBER(1),
    t_year NUMBER(4),
    t_semester NUMBER(1),
    CONSTRAINT t_pk PRIMARY KEY (p_id, c_id, c_class, t_year, t_semester),
    CONSTRAINT p_id_fk FOREIGN KEY (p_id) REFERENCES professor (p_id),
    CONSTRAINT t_c_id_fk FOREIGN KEY (c_id, c_class) REFERENCES  course (c_id, c_class));

INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004545', '10050', 1, 2019, 1); 
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004575', '10055', 1, 2019, 1);
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004555', '10045', 1, 2019, 1);
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004595', '10060', 1, 2019, 1); 
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004550', '10070', 1, 2019, 1); 
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004575', '10085', 1, 2019, 1); 
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004545', '10365', 1, 2019, 1);
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004585', '10080', 1, 2019, 1); 
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004590', '10015', 1, 2019, 1); 
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004545', '10050', 1, 2019, 2); 
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004575', '10055', 1, 2019, 2); 
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004555', '10045', 1, 2019, 2);
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004550', '10070', 1, 2019, 2); 
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004575', '10085', 1, 2019, 2); 
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004545', '10365', 1, 2019, 2);
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004585', '10080', 1, 2019, 2); 
INSERT INTO teach(p_id, c_id, c_class, t_year, t_semester) VALUES ('004590', '10015', 1, 2019, 2); 

CREATE TABLE test
(
    id NUMBER(10),
    name VARCHAR2(10));


INSERT INTO test(id, name) VALUES ('1111', 'aaaa');
INSERT INTO test(id, name) VALUES ('2222', 'bbbb');
INSERT INTO test(id, name) VALUES ('3333', 'cccc');
INSERT INTO test(id, name) VALUES ('4444', 'dddd');
