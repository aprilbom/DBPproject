<%@ page contentType="text/html; charset=EUC-KR" %>
<%
String session_id= (String)session.getAttribute("userID");
String session_pwd = (String)session.getAttribute("userPassword");

String log;
if (session_id==null) log="<a href=login.jsp  >�α���</a>";
else log="<a href=logout.jsp>�α׾ƿ�</a>";

%>
<nav><ul>



<li style="text-decoration:none; color:#ffffff;  "><b><%=log%></b></li>
<li><b><a href="insert_prof.jsp" style="text-decoration:none; color:#ffffff;">���� ����</a></b></li>
<li><b><a href="see_course_prof.jsp" style="text-decoration:none; color:#ffffff;">���� ��ȸ </a></b></li>
<li><b><a href="select_stu_prof.jsp" style="text-decoration:none; color:#ffffff;">�����л� ��ȸ</a></b></li>
<li><b><a href="timetable_prof.jsp" style="text-decoration:none; color:#ffffff;">�ð�ǥ</a></b></li>
<li><b><a href="update_prof.jsp" style="text-decoration:none; color:#ffffff;">���� ���� ����</a></b></li>



</ul></nav>