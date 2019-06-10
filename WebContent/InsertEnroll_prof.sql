CREATE OR REPLACE PROCEDURE InsertEnrollprof(
	profId IN NUMBER,
	courseId IN NUMBER,
	courseClass IN NUMBER,
	courseCredit IN NUMBER,
	courseName IN VARCHAR2,
	courseTime in VARCHAR2,
	courseDay in VARCHAR2,
	courseClassroom in VARCHAR2,
	courseMax in VARCHAR2,
	result OUT VARCHAR2)
	IS
	too_many_sumCourseUnit_prof EXCEPTION;
	duplicate_courses_prof EXCEPTION;
	nYear NUMBER;
	nSemester NUMBER;
	nSumCourseUnit NUMBER;
	nCourseUnit NUMBER;
	nCnt NUMBER;
	nTeachMax NUMBER;
BEGIN
result := '';
DBMS_OUTPUT.put_line('#');
DBMS_OUTPUT.put_line(profId || '강사 아이디 ' || courseId ||
'과목 코드' || TO_CHAR(courseClass) || '수강번호 조회'); 

nYear := Date2EnrollYear(SYSDATE);
nSemester := Date2EnrollSemester(SYSDATE);

SELECT SUM(c.c_credit)
INTO nSumCourseUnit
FROM open o, course c
WHERE o.p_id = profId and o.c_id = c.c_id and o.c_class = c.c_class and e_year = nYear and e_semester = nSemester;

SELECT c.c_credit
INTO nCourseUnit
FROM course c
WHERE c.c_id = CourseId and c.c_class = courseClass;
IF (nSumCourseUnit + nCourseUnit > 12)
THEN
RAISE too_many_sumCourseUnit_prof;
END IF;


SELECT COUNT(*)
INTO nCnt
FROM open
WHERE p_id = profId and c_id = CourseId and e_year = nYear and e_semester = nSemester;
IF (nCnt > 0)
THEN
RAISE duplicate_courses_prof;
END IF;



INSERT INTO open(p_id, c_id, c_class, e_year, e_semester)
VALUES (profId, courseId, courseClass, nYear, nSemester);
COMMIT;

INSERT INTO course(c_id, c_class, c_name, c_credit, c_time, c_day, c_classroom, c_max, p_id)
VALUES (courseId, courseClass, courseName, courseCredit, courseTime, courseDay, courseClassroom, courseMax, profId);
COMMIT;


result := '강의 개설이 완료되었습니다.';

EXCEPTION
WHEN too_many_sumCourseUnit_prof THEN
result := '개설 가능한 강의 초과';
WHEN duplicate_courses_prof THEN
result := '중복된 강의 개설';
WHEN OTHERS THEN
ROLLBACK;
result := SQLCODE;
END;
/