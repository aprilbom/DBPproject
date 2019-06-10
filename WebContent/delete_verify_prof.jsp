<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<%
 String session_id = (String)session.getAttribute("userID");
 String c_class = request.getParameter("c_class"); 
 int c_id = Integer.parseInt(request.getParameter("c_id"));
 int nYear = Integer.parseInt(request.getParameter("nYear"));
 int nSemester = Integer.parseInt(request.getParameter("nSemester"));
 
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
	
	mySQL = "DELETE FROM open where c_id='" + c_id +"' and p_id='" + session_id + "' and c_class='" + c_class+ "' and e_year='" + nYear + "' and e_semester='" + nSemester +"'";
	myResultSet = stmt.executeQuery(mySQL);
	mySQL = "DELETE FROM course where c_id='" + c_id +"' and p_id='" + session_id + "' and c_class='" + c_class+ "'";
	myResultSet = stmt.executeQuery(mySQL);
	%>
	<script>
	alert("강의삭제완료");
		location.href = "see_course_prof.jsp";
	</script>
	<%
	stmt.close();
	myConn.close();
	}

  catch(Exception e){
  out.println(e);
 }
 %>
 