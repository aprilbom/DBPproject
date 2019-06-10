<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html><head><title> 수강신청 입력 </title></head>
<body>
<%
String userID =  (String)session.getAttribute("userID");
int s_id = Integer.parseInt(userID);
int c_id = Integer.parseInt(request.getParameter("c_id"));
String c_class = request.getParameter("c_class");
%>

<%
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

CallableStatement cstmt = myConn.prepareCall("{call InsertEnroll(?,?,?,?)}");
cstmt.setInt(1, s_id);
cstmt.setInt(2, c_id);
cstmt.setString(3, c_class);
cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
try {
	
cstmt.execute();
result = cstmt.getString(4);
%>
<script>
alert("<%=result%>"); 
location.href="insert.jsp"; 
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