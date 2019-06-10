<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title> 개설 강의 조회</title>
<style>
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
tr, td{ border:1px solid #8C8CF5;
border-collapse: collapse;
}
th{
color: white;
background-color: #8C8CF5;

}
</style>
</head>
<body>
<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
     <div class="w-100">
       <h2 class="mb-5">Select Class</h2>
	<%@ include file="top_prof.jsp"%>
	<%
		if (session_id == null)
			response.sendRedirect("login.jsp");
	%>
	<form id="my_form" action="see_course_prof.jsp" method="post">
		<table height="100px" width="75%" align="center" border>
			<br>
			<br>
			<br>
			<br>
			<tr>
				<th style = "text-align:center">과목번호</th>
				<th style = "text-align:center">분반</th>
				<th style = "text-align:center">과목명</th>
				<th style = "text-align:center">강의실</th>
				<th style = "text-align:center">시간</th>
				<th style = "text-align:center">학점</th>
				<th style = "text-align:center">교수명</th>
				<th style = "text-align:center">수강삭제</th>
			</tr>
			<%
				
			    int nYear = Integer.parseInt(request.getParameter("nYear"));
			    int nSemester = Integer.parseInt(request.getParameter("nSemester"));
				String result1 = null;
				String result2 = null;
				Connection myConn = null;
				Statement stmt = null;
				Statement stmt2 = null;
				ResultSet myResultSet = null;
				
				String mySQL = "";
				String mySQL2 = "";
				String mySQL3 = "";
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
				
				mySQL = "select c_id, c_name, c_class, c_classroom, c_day, c_credit, c_time, p_name from course c, professor p where c.p_id = p.p_id and (c.c_id, c.c_class) in (select c_id, c_class from open where e_year ="
						+ nYear + " and e_semester ="+ nSemester + " and p_id='"+ session_id + "')";
				myResultSet = stmt.executeQuery(mySQL);

				if (myResultSet != null) {
					while (myResultSet.next()) {
						int c_id = myResultSet.getInt("c_id");
						String c_name = myResultSet.getString("c_name");
						String c_class = myResultSet.getString("c_class");
						String c_classroom = myResultSet.getString("c_classroom");
						String c_credit = myResultSet.getString("c_credit");
						String p_name = myResultSet.getString("p_name");
						String c_dayAndTime = myResultSet.getString("c_day") + myResultSet.getString("c_time");
			%>

			<tr>
				<td align="center"><%=c_id%></td>
				<td align="center"><%=c_class%></td>
				<td align="center"><%=c_name%></td>
				<td align="center"><%=c_classroom%></td>
				<td align="center"><%=c_dayAndTime%></td>
				<td align="center"><%=c_credit%></td>
				<td align="center"><%=p_name%></td>
				</td>
			</tr>
			

			<%
				}
				}

				
				CallableStatement cstmt = myConn.prepareCall("{call SelectTimeTableprof(?,?,?,?,?)}");
				cstmt.setString(1, session_id);
				cstmt.setInt(2, nYear);
				cstmt.setInt(3, nSemester);
				cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
				cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
				try {
					cstmt.execute();
					result1 = cstmt.getString(4);
					result2 = cstmt.getString(5);
			%>
			
	
		
			<table width="75%" height="15%" align="center" style="border: none; ">
			<tr style="border: none;"><td style="border: none;">
			<%=nYear%>년도 <%=nSemester%>학기 강의 조회
			</td></tr>
			<tr style="border: none;">
				<td style="border: none;">● 총 <%=result1%> 과목을 개설했습니다.</td>
			</tr>
			</table>
			
			<table width="50%" align="center" style="border: none; ">
			<tr style="border: none;" >
				<td style="border: none;"><input type="text" id="nYear" name="nYear" value=<%=nYear%> /> 년도</td>
				<td style="border: none;"><input type="text" id="nSemester" name="nSemester" value=<%=nSemester%> />학기</td>
				<td style="border: none;"><input type="submit" value="조회" style=" border-color: #0d0d5b; color: black; padding-top:3px; border-radius: 4px;
    		cursor: pointer;  width: 70%;
    
    		font-size:15px;
    		align:center;"/></td>
			</tr>
			</table>


			<%
				} catch (SQLException ex) {
					System.err.println("SQLException: " + ex.getMessage());
				} finally {
					if (cstmt != null)
						try {
							myConn.commit();
							cstmt.close();
							myConn.close();
						} catch (SQLException ex) {
						}
				}
			%>
		</table>
		</form>
	</body>
</html>
