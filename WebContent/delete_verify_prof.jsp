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
	Statement stmt0 = null;
	ResultSet myResultSet = null; 
	ResultSet myResultSet0 = null; 
	String mySQL = "";
	String mySQL0 = "";
	String mySQL1 = "";
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbname = "dbp";
	String user = "dbp";
	String passwd = "dbp1615";
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	try {
	Class.forName(jdbc_driver);
	myConn = DriverManager.getConnection (dburl, user, passwd);
	stmt = myConn.createStatement();
	stmt0 = myConn.createStatement();
	} catch(SQLException ex) {
	System.err.println("SQLException: " + ex.getMessage());
	}
	
	int nCnt=0;
	mySQL0="select count(*) as cnt from enroll where c_id='" + c_id +"' and c_class='" + c_class+ "' and e_year='" + nYear + "' and e_semester='" + nSemester +"'";
	myResultSet0 = stmt0.executeQuery(mySQL0);
	if (myResultSet0 != null) {
		while (myResultSet0.next()) {
			nCnt = myResultSet0.getInt("cnt");
		}
	}
	if (nCnt > 0){
	%>
		<script>
		alert("강의삭제 불가 - 강의수강 중인 학생 존재");
			location.href = "see_course_prof.jsp";
		</script>
	<%
		return;
	}
	else{
	mySQL1 = "DELETE FROM open where c_id='" + c_id +"' and p_id='" + session_id + "' and c_class='" + c_class+ "' and e_year='" + nYear + "' and e_semester='" + nSemester +"'";
	myResultSet = stmt.executeQuery(mySQL1);
	mySQL = "DELETE FROM course where c_id='" + c_id +"' and p_id='" + session_id + "' and c_class='" + c_class+ "'";
	myResultSet = stmt.executeQuery(mySQL);
	%>
	<script>
	alert("강의삭제완료");
		location.href = "see_course_prof.jsp";
	</script>
	<%
	}
	stmt.close();
	myConn.close();
	}

  catch(Exception e){
  out.println(e);
 }
 %>
 