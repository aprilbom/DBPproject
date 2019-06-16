<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>신규 강의 개설</title>

</head>
<body>
<%
String userID =  (String)session.getAttribute("userID");
int p_id=Integer.parseInt(userID);
int courseid= Integer.parseInt(request.getParameter("courseid"));
int courseclass= Integer.parseInt(request.getParameter("courseclass"));
int coursecredit= Integer.parseInt(request.getParameter("coursecredit"));
String coursename= new String(request.getParameter("coursename").getBytes("8859_1"), "EUC-KR");
String coursetime= new String(request.getParameter("coursetime").getBytes("8859_1"), "EUC-KR");
String courseday= new String(request.getParameter("courseday").getBytes("8859_1"), "EUC-KR");
String courseclassroom= new String(request.getParameter("courseclassroom").getBytes("8859_1"), "EUC-KR");
int coursemax= Integer.parseInt(request.getParameter("coursemax"));


Connection myConn = null; 
String result = null;
String dbdriver="oracle.jdbc.driver.OracleDriver";
String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
String user="dbp";
String passwd="dbp1615";

try {
Class.forName(dbdriver);
myConn = DriverManager.getConnection (dburl, user, passwd);
} catch(SQLException ex) {
System.err.println("SQLException: " + ex.getMessage());
} 

CallableStatement cstmt = myConn.prepareCall("{call InsertEnrollprof(?,?,?,?,?,?,?,?,?,?)}");
cstmt.setInt(1, p_id);
cstmt.setInt(2, courseid);
cstmt.setInt(3, courseclass);
cstmt.setInt(4, coursecredit);
cstmt.setString(5, coursename);
cstmt.setString(6, coursetime);
cstmt.setString(7, courseday);
cstmt.setString(8, courseclassroom);
cstmt.setInt(9, coursemax);
cstmt.registerOutParameter(10, java.sql.Types.VARCHAR);
try {
cstmt.execute();
result = cstmt.getString(10);
%>

<script>
alert("<%=result%>"); 
location.href="insert_prof.jsp"; 
</script>
<% 
} catch(SQLException ex) {
System.err.println("SQLException: " + ex.getMessage());
} finally {
if (cstmt != null)
try { myConn.commit(); cstmt.close(); myConn.close(); }
catch(SQLException ex) { } 
}
%>
</form></body></html>