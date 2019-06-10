<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<%
 String session_id = (String)session.getAttribute("userID");
 String c_class = request.getParameter("c_class"); 
 int c_id = Integer.parseInt(request.getParameter("c_id"));
 
 try{
	Connection myConn = null; 
	Statement stmt = null;	
	ResultSet myResultSet = null; 
	String mySQL = "";
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbname = "dbp";
	String user = "dbp";
	String passwd = "dbp1615";
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	try {
	Class.forName(jdbc_driver);
	myConn = DriverManager.getConnection (dburl, user, passwd);
	stmt = myConn.createStatement();
	} catch(SQLException ex) {
	System.err.println("SQLException: " + ex.getMessage());
	}
	
	mySQL = "DELETE FROM enroll where c_id=" + c_id +" and s_id=" + session_id + "and c_class='" + c_class+"'";
	myResultSet = stmt.executeQuery(mySQL);
	%>
	<script>
	alert("수강취소완료");
		location.href = "delete.jsp";
	</script>
	<%
	stmt.close();
	myConn.close();
	}

  catch(Exception e){
  out.println(e);
 }
 %>
 