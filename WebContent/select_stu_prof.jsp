<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>수강학생 조회</title>
<style>
}
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 
a:hover {
color:#ffffff;
border-bottom:1px solid black;
}
table{
margin-top:70px;
border:none;
border-collapse: collapse;
}
tr, td{
border:1px solid #3366CC;
border-collapse: collapse;
font-family: 'Nanum Gothic', sans-serif;
font-size:13px;
color:#444444;
}

th{
color: white;
background-color: #3366CC;
font-family: 'Nanum Gothic', sans-serif;
font-size:13px;
}

input[type=submit] {
  background:#FFFFCC;
  color:#444444;
  border:none;
  height:25px;
  font-size:14px;
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
<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
     <div class="w-100">
       <h2 class="mb-5">My Student</h2>
	<%@ include file="top_prof.jsp"%>
	
	<% if (session_id==null) {
		response.sendRedirect("login.jsp");
		return;
	}
	
	String coursenum = "";
	String value = "";
	String pid = "";
	%>

	<form method="post" action = "select_search_stu_prof.jsp" id="my_form">
		<td>과목번호 <input type="text" id="coursenum" name="coursenum" value=<%=coursenum%>></td>
		<td><input type="submit" value="조회"></td>
	</form>

	
	<table height="100px" width="75%">
		<tr>
			<th style = "text-align : center">학번</th>
			<th style = "text-align : center">이름</th>
			<th style = "text-align : center">학과</th>
			<th style = "text-align : center">학년</th>
			<th style = "text-align : center">전화번호</th>
			<th style = "text-align : center">이메일</th>
			<th style = "text-align : center">주소</th>
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
				mySQL = "select s_id, s_name, s_major, s_grade, s_email, s_tel, s_addr from student where (s_id) IN (select s_id from enroll where c_id = '" + coursenum + "')";
				myResultSet = stmt.executeQuery(mySQL);
			}
						
			if (myResultSet != null) {
				while (myResultSet.next()) {
					int s_id = myResultSet.getInt("s_id");
					String s_name = myResultSet.getString("s_name");
					String s_major = myResultSet.getString("s_major");
					String s_grade = myResultSet.getString("s_grade");
					String s_email = myResultSet.getString("s_email");
					String s_tel = myResultSet.getString("s_tel");
					String s_addr = myResultSet.getString("s_addr");
		%>

		<tr>
			<td align="center"><%=s_id%></td>
			<td align="center"><%=s_name%></td>
			<td align="center"><%=s_major%></td>
			<td align="center"><%=s_grade%></td>
			<td align="center"><%=s_tel%></td>
			<td align="center"><%=s_email%></td>
			<td align="center"><%=s_addr%></td>
		</tr>
<%      
				}
			}
		%>
			</table>

			<table width="75%" height="15%">
			<tr style="border: none; font-family: 'Nanum Gothic', sans-serif; font-size:13px">
				<td style="border: none;"><%=coursename%> 수강생 조회</td>
			</tr>
			<tr style="border: none; font-family: 'Nanum Gothic', sans-serif; font-size:13px">
				<td style="border: none;">● 총 <%=result1%> 명이 수강중 입니다.</td>
			</tr>
			</table>

		</div>
	</section>
</body>
</html>