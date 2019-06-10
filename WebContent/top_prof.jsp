<%@ page contentType="text/html; charset=EUC-KR" %>
<%
String session_id= (String)session.getAttribute("userID");
String session_pwd = (String)session.getAttribute("userPassword");

String log;
if (session_id==null) log="<a href=login.jsp  >로그인</a>";
else log="<a href=logout.jsp>로그아웃</a>";

%>
<nav><ul>



<li style="text-decoration:none; color:#ffffff;  "><b><%=log%></b></li>
<li><b><a href="insert_prof.jsp" style="text-decoration:none; color:#ffffff;">강의 개설</a></b></li>
<li><b><a href="see_course_prof.jsp" style="text-decoration:none; color:#ffffff;">강의 조회 </a></b></li>
<li><b><a href="select_stu_prof.jsp" style="text-decoration:none; color:#ffffff;">수강학생 조회</a></b></li>
<li><b><a href="timetable_prof.jsp" style="text-decoration:none; color:#ffffff;">시간표</a></b></li>
<li><b><a href="update_prof.jsp" style="text-decoration:none; color:#ffffff;">강사 정보 수정</a></b></li>



</ul></nav>