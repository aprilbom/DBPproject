<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>교수 정보 수정</title>
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
input[type=submit] {
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
<%@ include file="top_prof.jsp" %> 

<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
     <div class="w-100">
       <h2 style="height: 150px;">Modify</h2>


<%
if (session_id==null) {
	response.sendRedirect("login.jsp"); 
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
mySQL =  "select * from professor where p_id='" + session_id + "'" ; 
ResultSet rs = stmt.executeQuery(mySQL);
rs.next();
String p_name = rs.getString("p_name");
String p_id = rs.getString("p_id");
String p_pwd = rs.getString("p_pwd");
String p_major = rs.getString("p_major");
String p_email = rs.getString("p_email");
%>

&nbsp;

<% 
mySQL2 = "update professor set p_pwd = '" + p_pwd + "' p_email = '" + p_email + "' where  p_id='" + session_id + "'" ;
%>

<form method="post" action="update_verify.jsp">
<table width="50%" height="40%"><col width="120">
<tr>
	<th> ID </th>
	<td><%=session_id%></td>
</tr>
<tr>
	<th> Password </th>
	<td><input type="password" name="newpwd" id="newpwd" value="<%=p_pwd%>"></td>
</tr>
<tr>
	<th> Name </th>
	<td><%=p_name%></td>
</tr>
<tr>
	<th> Major </th>
	<td><%=p_major%></td>
</tr>
<tr>
	<th > Email </th>
	<td><input type="email" name="newemail" id="newemail" value="<%=p_email%>"></td>
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