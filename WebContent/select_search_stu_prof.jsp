<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>수강학생 조회</title>
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
a:hover {
 color:#ffffff;
 border-bottom:1px solid black;
}
table{
margin-top:70px;
border:none;
border-collapse: collapse;
}
tr, td{ border:1px solid black;
border-collapse: collapse;
}
th{
color: white;
background-color: #0d0d5b;

}
</style>
</head>
<body>
	<%@ include file="top_prof.jsp"%>
	&nbsp;
	<h3 style="text-align: center;">수강학생 조회</h3>
	<%
		if (session_id == null)
			response.sendRedirect("login.jsp");
   		String coursenum = request.getParameter("coursenum");
		String value = "";
		String pid = "";
		%>
		
		<form id="my_form" action="select_search_stu_prof.jsp" method="post">
		
		<form method="post" action ="select_search_stu_prof.jsp"><div align="center">
			<td style="border: none;">과목번호 <input type="text" id="coursenum" name="coursenum" value=<%=coursenum%>></td>
			<td style="border: none;"><input type="submit" value="조회" style=" border-color: black; color: black; top:3px; radius: 4px;
			cursor: pointer;  width: 10%;
	    
	   		font-size:15px;
	    	align:center;"/>
		</form>

	
		<table height="100px" width="75%" align="center" border>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
				<th>이메일</th>
			</tr>
			<%
				

				String result1 = null;
				Connection myConn = null;
				Statement stmt = null;
				Statement stmt2 = null;
				ResultSet myResultSet = null;
				
				String mySQL = "";
				String mySQL2 = "";
				String mySQL3 = "";
				String mySQL4 = "";
				String mySQL5 = "";
				String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
				String dbname = "dbp";
				String user = "dbp";
				String passwd = "dbp1615";
				String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
				String coursename = "";
				try {
				Class.forName(jdbc_driver);
				myConn = DriverManager.getConnection (dburl, user, passwd);
				stmt = myConn.createStatement();
				} catch(SQLException ex) {
				System.err.println("SQLException: " + ex.getMessage());
				}
				
				mySQL4 = "select c_name, p_id from course where c_id = '" + coursenum + "'";
				myResultSet = stmt.executeQuery(mySQL4);
				if (myResultSet != null) {
					while (myResultSet.next()) {
						coursename = myResultSet.getString("c_name");
						pid = myResultSet.getString("p_id");
					}
				}
				
				mySQL5 = "select count(*) from enroll where c_id = '" + coursenum + "'";
				myResultSet = stmt.executeQuery(mySQL5);
				if (myResultSet != null) {
					while (myResultSet.next()) {
						result1 = myResultSet.getString("count(*)");
					}
				}
				
				if (pid.equals(session_id)){
					mySQL = "select s_id, s_name, s_major, s_grade, s_email from student where (s_id) IN (select s_id from enroll where c_id = '" + coursenum + "')";
					myResultSet = stmt.executeQuery(mySQL);
				}
							
				if (myResultSet != null) {
					while (myResultSet.next()) {
						int s_id = myResultSet.getInt("s_id");
						String s_name = myResultSet.getString("s_name");
						String s_major = myResultSet.getString("s_major");
						String s_grade = myResultSet.getString("s_grade");
						String s_email = myResultSet.getString("s_email");
			%>

			<tr>
				<td align="center"><%=s_id%></td>
				<td align="center"><%=s_name%></td>
				<td align="center"><%=s_major%></td>
				<td align="center"><%=s_grade%></td>
				<td align="center"><%=s_email%></td>
			</tr>
			

			<%
				}
				}
			%>
			
	
		
			<table width="75%" height="15%" align="center" style="border: none; ">
			<tr style="border: none;"><td style="border: none;">
			<%=coursename%> 수강생 조회
			</td></tr>
			<tr style="border: none;">
				<td style="border: none;">●총 <%=result1%> 명이 수강중 입니다.</td>
			</tr>
		</table>
		</form>
	</body>
</html>
