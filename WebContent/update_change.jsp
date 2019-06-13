<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>수강신청 사용자 정보 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
}
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 
a:hover {
 color:#ffffff;
 border-bottom:1px solid black;
}
table{
margin-top:80px;
border: 0px solid #0d0d5b;
text-align: center;
font-family: 'Nanum Gothic', sans-serif;
}
th{
background-color:  #8C8CF5;
color:white;
font-family: 'Nanum Gothic', sans-serif;
font-size:13px;
}
td{
border:1px solid #8C8CF5;
border-collapse: collapse;
font-family: 'Nanum Gothic', sans-serif;
font-size:13px;
color : #444444;
padding:10px;
}
.button {
background:#FFFFCC;
color:#444444;
border:none;
height:30px;
padding:0 10em;
cursor:pointer;
transition:800ms ease all;
outline:none;
align:center;
font-family: 'Nanum Gothic', sans-serif;
}

</style>
</head>
<body>
<%@ include file="top.jsp" %>
<%
if (session_id==null) {
	response.sendRedirect("login.jsp"); 
	%><script>alert("로그인 후 이용하세요");</script><%
	return;
}
%>

<%
Connection myConn = null;
Statement stmt = null;
String mySQL = null;
String mySQL2 = null; 
String result = null;
String dbdriver="oracle.jdbc.driver.OracleDriver";
String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
String user="dbp";
String passwd="dbp1615";
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();
%>

<%
String userID =request.getParameter("userID");
String userPassword =request.getParameter("userPassword");
mySQL =  "select * from student where s_id='" + session_id + "'" ; 
ResultSet rs = stmt.executeQuery(mySQL);
rs.next();
   String s_pwd = rs.getString("s_pwd");
   String s_name = rs.getString("s_name");
   String s_major = rs.getString("s_major");
   String s_grade = rs.getString("s_grade");
   String s_tel = rs.getString("s_tel");
   String s_addr = rs.getString("s_addr");
%>
&nbsp;
<% 
mySQL2 = "update student set s_pwd = '" + s_pwd + "' s_tel = '" + s_tel + "' where  s_id='" + session_id + "'" ;
%>

<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
      <div class="w-100">
        <h2 class="mb-5">Modify</h2>
	<form method="post" action="update_verify.jsp">
	<table width="50%" height="40%" >
	<col width="120">
	<tr>
	   <th> ID </th>
	   <td><%=session_id%></td>
	</tr>
	<tr>
	   <th> Password </th>
	   <td><input type="password" name="newpwd" id="newpwd" value="<%=s_pwd%>"></td>
	</tr>
	<tr>
	   <th> Name </th>
	   <td><%=s_name%></td>
	</tr>
	<tr>
	   <th> Major </th>
	   <td><%=s_major%></td>
	</tr>
	<tr>
	   <th> Grade </th>
	   <td><%=s_grade%></td>
	</tr>
	<tr>
	   <th> Tel No. </th>
	   <td><input type="text" name="newtel" id="newtel" value="<%=s_tel%>"></td>
	</tr>
	<tr>
	   <th> Address </th>
	   <td><input type="text" name="newaddr" id="newaddr" value="<%=s_addr%>"></td>
	</tr>
	
	<tr>
	   <td colspan="2" style="border-style: none"><input type="submit" value="확인"></td>
	</tr>

	
	
	</table>
	</form>
	</div>
</section>
	<%
	stmt.close();
	myConn.close();
	%>
	

</body>

</html>