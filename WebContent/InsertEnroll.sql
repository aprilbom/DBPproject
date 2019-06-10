CREATE OR REPLACE PROCEDURE InsertEnroll(sStudentId IN NUMBER,
sCourseId IN NUMBER,
nCourseIdNo IN VARCHAR2,
result OUT VARCHAR2)
IS
too_many_sumCourseUnit EXCEPTION;
duplicate_courses EXCEPTION;
too_many_students EXCEPTION;
duplicate_time EXCEPTION;
nYear NUMBER;
nSemester NUMBER;
nSumCourseUnit NUMBER;
nCourseUnit NUMBER;
nCnt NUMBER;
nTeachMax NUMBER;
BEGIN
result := '';
DBMS_OUTPUT.put_line('#');
DBMS_OUTPUT.put_line(sStudentId || '�л� ���̵� ' || sCourseId ||
'�л� ���� ' || TO_CHAR(nCourseIdNo) || '�л� ������ȣ ��ȸ'); 

nYear := Date2EnrollYear(SYSDATE);
nSemester := Date2EnrollSemester(SYSDATE);

SELECT SUM(c.c_credit)
INTO nSumCourseUnit
FROM course c, enroll e
WHERE e.s_id = sStudentId and e.c_id = c.c_id and e.c_class = c.c_class and e_year =nYear and e_semester= nSemester;

SELECT c.c_credit
INTO nCourseUnit
FROM course c
WHERE c_id = sCourseId and c_class = nCourseIdNo;
IF (nSumCourseUnit + nCourseUnit > 18)
THEN
RAISE too_many_sumCourseUnit;
END IF;


SELECT COUNT(*)
INTO nCnt
FROM enroll
WHERE s_id = sStudentId and c_id = sCourseId and e_year = nYear and e_semester = nSemester;
IF (nCnt > 0)
THEN
RAISE duplicate_courses;
END IF;


SELECT c_max
INTO nTeachMax
FROM course
WHERE c_id = sCourseId and c_class= nCourseIdNo;

SELECT COUNT(*)
INTO nCnt
FROM enroll
WHERE c_id = sCourseId and c_class = nCourseIdNo and e_year = nYear and e_semester = nSemester;

IF (nCnt >= nTeachMax)
THEN
RAISE too_many_students;
END IF;

SELECT COUNT(*)
INTO nCnt
FROM
(SELECT c_day, c_time
FROM course
WHERE c_id = sCourseId and c_class = nCourseIdNo
INTERSECT
SELECT c.c_day, c.c_time
FROM course c, enroll e
WHERE e.s_id=sStudentId and
e.c_id=c.c_id and e.c_class=c.c_class and e.e_year = nYear and e.e_semester = nSemester
);

IF (nCnt > 0)
THEN
RAISE duplicate_time;
END IF;



INSERT INTO enroll(s_id, c_id, c_class, e_year, e_semester)
VALUES (sStudentId, sCourseId, nCourseIdNo, nYear, nSemester);
COMMIT;
result := '������û�� �Ϸ�Ǿ����ϴ�.';

EXCEPTION
WHEN too_many_sumCourseUnit THEN
result := '���������� ���� �ʰ�';
WHEN duplicate_courses THEN
result := '�ߺ��� ������û';
WHEN too_many_students THEN
result := '�����л� �� �ʰ�';
WHEN duplicate_time THEN
result := '�ߺ��� �ð��� ���� ����';
WHEN OTHERS THEN
ROLLBACK;
result := SQLCODE;
END;
/
