<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>

<html><head><title>수강 취소</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>수강 취소</title>

<style>
}
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
a:hover {
 color:#ffffff;
 border-bottom:1px solid black;
 font-family: 'Nanum Gothic', sans-serif;
}

table{
margin-top:40px;
border:none;
border-collapse: collapse;
font-family: 'Nanum Gothic', sans-serif;
padding:10px;
}
tr, td{ 
border:1px solid #8C8CF5;
border-collapse: collapse;
font-family: 'Nanum Gothic', sans-serif;
color :#444444;
font-size:13px;
padding:10px;
}
th{
font-family: 'Nanum Gothic', sans-serif;
color: white;
background-color: #8C8CF5;
padding:10px;
}
button {
  background:#FFFFCC;
  color:#444444;
  border:none;
  height:25px;
  font-size:1.6em;
  padding:0 0.5em;
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
	return;
}
%>
<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
      <div class="w-100">
        <h2 class="mb-5">Delete Class</h2>
		        <form action="delete_verify.jsp" method="post">
		<table width="90%" height="120px"  border>
		<tr><th style="text-align : center;">과목번호</th><th style="text-align : center;">과목명</th><th style="text-align : center;">분반</th><th style="text-align : center;">강의실</th><th style="text-align : center;">시간</th><th style="text-align : center;">학점</th><th>교수명</th><th style="text-align : center;">수강취소</th></tr>
		<%	
			Connection myConn = null; 
			Statement stmt = null;	
			ResultSet myResultSet = null; 
			String mySQL = "";
			String mySQL2 = "";
			String mySQL3 = "";
		
			String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbname = "db01";
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
			
			mySQL2 = "{? = call Date2EnrollYear(SYSDATE)}";
			CallableStatement cstmt1 = myConn.prepareCall(mySQL2);
			cstmt1.registerOutParameter(1,java.sql.Types.INTEGER);
			cstmt1.execute();
			int nYear = cstmt1.getInt(1);
			
			
		 	
		 	mySQL3 = "{? = call Date2EnrollSemester(SYSDATE)}";
			CallableStatement cstmt2 = myConn.prepareCall(mySQL3);
			cstmt2.registerOutParameter(1,java.sql.Types.INTEGER);
			cstmt2.execute();
			int nSemester = cstmt2.getInt(1);
		
			
			mySQL = "select c_id, c_name, c_class, c_classroom, c_day, c_credit, c_time, p_name from course c, professor p where c.p_id = p.p_id and (c.c_id, c.c_class) in (select c_id, c_class from enroll where e_year ="
					+ nYear + " and e_semester ="+ nSemester + " and s_id='" + session_id + "')";
			myResultSet = stmt.executeQuery(mySQL);	
			if (myResultSet != null) {
				while (myResultSet.next()) {
					int c_id = myResultSet.getInt("c_id");	
					String c_name = myResultSet.getString("c_name");
					String c_class = myResultSet.getString("c_class");	
					String c_classroom = myResultSet.getString("c_classroom");
					String c_credit = myResultSet.getString("c_credit");
					String p_name = myResultSet.getString("p_name");
					String c_dayAndTime = myResultSet.getString("c_day")+myResultSet.getString("c_time");
		%>
			<tr>
			  <td align="center"><%= c_id %></td>
			  <td align="center"><%= c_name %></td>
			  <td align="center"><%= c_class %></td>
			  <td align="center"><%= c_classroom %></td>
			  <td align="center"><%= c_dayAndTime %></td>
			  <td align="center"><%= c_credit %></td>
			  <td align="center"><%= p_name %></td>
			  <td align="center">
				<a href="delete_verify.jsp?c_id=<%= c_id %>&c_class=<%= c_class %>" ><button type="button" >삭제</button></a>
			 </td>
			</tr>
			
			
		<%
		}
	}
	stmt.close(); 
	myConn.close();
%>
</table>
</form>
</div>
</section>
</body>
 </html>