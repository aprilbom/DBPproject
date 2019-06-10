CREATE OR REPLACE PROCEDURE enrollcount
(cCourseId IN NUMBER,
cClass IN NUMBER,
nYear IN NUMBER,
nSemester IN NUMBER,
sStudent OUT NUMBER)
IS
   CURSOR enroll_count_student IS
      select s_name, s_id, s_major, s_grade, s_tel
      from student 
      where s_id IN(select s_id
                  from enroll
                  where e_year =nYear 
                  and e_semester = nSemester
                  and c_id = cCourseId 
                      and c_class = cClass);      
BEGIN
   sStudent := 0;
   FOR enroll_student_list IN enroll_count_student LOOP
      sStudent := sStudent + 1;
   END LOOP;
END;
/