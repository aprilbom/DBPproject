<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수강신청 사용자 정보 수정</title>
</head>
<body>
<%@ include file="top.jsp" %> 
<h3 style="text-align: center;">수강신청 사용자 정보 수정</h3>

<%
if (session_id==null) {
	response.sendRedirect("login.jsp");  
}
%>

<%

Connection myConn = null;
Statement stmt = null;
String mySQL = null;
String result = null;
String dbdriver="oracle.jdbc.driver.OracleDriver";
String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
String user="dbp";
String passwd="dbp1615";
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();

String userID=session_id;
int prof = 0;
%>


<%
if(userID.startsWith("4") || userID.startsWith("0")) {
	prof = 1;
	String newpwd = request.getParameter("newpwd");
	String newemail = request.getParameter("newemail");
	mySQL = "update professor set p_pwd = '" + newpwd + "', p_email = '" + newemail + "' where  p_id='" + session_id + "'" ;
}
else{
	String newpwd = request.getParameter("newpwd");
	String newtel = request.getParameter("newtel");
	String newaddr = new String(request.getParameter("newaddr").getBytes("8859_1"), "EUC-KR");
	mySQL = "update student set s_pwd = '" + newpwd + "', s_tel = '" + newtel + "', s_addr = '" + newaddr + "' where  s_id='" + session_id + "'" ;
} %>

<% 
try {
ResultSet rs = stmt.executeQuery(mySQL);
rs.next();


if(prof == 1) {
%>
	<script>
		location.href="update_prof.jsp"; 
	</script>
<%
} else{
%>
	<script>
		location.href="update.jsp"; 
	</script>

<%}
} catch(SQLException ex) {
	String sMessage;
	if (ex.getErrorCode() == 20002) {
		sMessage="암호는 4자리 이상이어야 합니다"; %>
		<script>
		alert("<%=sMessage%>"); 
		location.href="update_change.jsp";
		</script>
	<%
	}else if (ex.getErrorCode() == 20003) { 
		sMessage="암호에 공란은 입력되지않습니다."; %>
		<script>
		alert("<%=sMessage%>"); 
		location.href="update_change.jsp"; 
		</script>
		<%
	}else {
		sMessage="잠시 후 다시 시도하십시오"; %>
		<script>
		alert("<%=sMessage%>"); 
		location.href="update_change.jsp"; 
		</script>
		<%
	}
}
%> 

</body>
</html>