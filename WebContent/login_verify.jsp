<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Verify</title>
</head>
<body>
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
%>

<%
String userID =request.getParameter("userID");
String userPassword =request.getParameter("userPassword");
int prof=0;

if(userID.startsWith("1")) {
	mySQL = "select s_id from student where s_id='" + userID + "' and s_pwd='"+ userPassword +"'";
}
else{
	mySQL = "select p_id from professor where p_id='" + userID + "' and p_pwd='"+ userPassword +"'";
	prof = 1;
}

ResultSet myResultSet = stmt.executeQuery(mySQL);

Boolean isLogin = false;
if(myResultSet.next()) {
	isLogin = true;
}

if(isLogin) {
	session.setAttribute("userID", userID);
	session.setAttribute("userPassword", userPassword);
	if (prof==1) {
	%>
	<script>
		alert("Welcome <%=userID%> !");
		location.href ="professor_main.jsp";
	</script>
	<%
	}else {
	%>
	<script>
		alert("Welcome <%=userID%> !");
		location.href = "main.jsp";
	</script>
	<%
	}
}
else { %>
	<script>
	alert("Login Fail");
	location.href = "login.jsp";
	</script>
<% } %>	

stmt.close();
myConn.close();
%>
</body>
</html>