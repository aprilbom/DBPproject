<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강사 정보 수정</title>
<style>
ul{text-align: center; color:#ffffff;}
ul li {display:inline-block; margin-right: 60px; color:#ffffff;}
ul li:LAST-CHILD{ margin-right: 0;}
nav{
margin-top:100px;
padding:1px 0;
background-color:#0d0d5b;
border-top: 1px solid #0d0d5b;
border-bottom: 1px solid #0d0d5b;

color:#ffffff;

}
 button {
    width: 50%;
    
    font-size:20px;
    border-color: #0d0d5b;
    color: #0d0d5b;
    
    margin-top:10px;
    padding-top:3px;
    border-radius: 4px;
    cursor: pointer;
    align:center;
}
a:hover {
 color:#ffffff;
 border-bottom:1px solid black;
}
table{
	margin-top:80px;
	border: 0px solid #0d0d5b;
	text-align: center;

	}
	
th{
	background-color:  #0d0d5b;
	color:white;
	
	}
	td{
	border:1px solid #0d0d5b;
	border-collapse: collapse;
	
	}

</style>
</head>

<body>
<%@ include file="top_prof.jsp" %> 


&nbsp;
<h3 style="text-align: center;">강사 정보</h3>

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
String dbdriver="oracle.jdbc.driver.OracleDriver";
String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
String user="dbp";
String passwd="dbp1615";
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();

String userID =request.getParameter("userID");
String userPassword =request.getParameter("userPassword");

mySQL =  "select * from professor where p_id='" + session_id + "'" ; 
%>

<%
ResultSet rs = stmt.executeQuery(mySQL);
rs.next();
String p_name = rs.getString("p_name");
String p_id = rs.getString("p_id");
String p_pwd = rs.getString("p_pwd");
String p_major = rs.getString("p_major");
String p_email = rs.getString("p_email");
%>

&nbsp;
 
<form method="post" action="update_change_prof.jsp">
<table width="50%" height="40%" align="center">
<tr>
	<th> ID </th>
	<td><%=session_id%></td>
</tr>
<tr>
	<th> Password </th>
	<td><%=p_pwd%></td>
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
	<td><%=p_email%></td>
</tr>	

<tr>
	<td colspan="2" style="border-style: none;"><a href="update_change_prof.jsp" ><button type="button" >강사 정보 수정</button></a></td>
</tr>
</table>
</form>

<%
stmt.close();
myConn.close();
%>

</body>
</html>