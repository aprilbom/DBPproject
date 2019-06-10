<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>수강신청 조회</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>수강신청 조회</title>
<style>
}
a:hover {
 color:#ffffff;
 border-bottom:1px solid black;
}

table{
margin-top:40px;
border:none;
border-collapse: collapse;
font-family: 'Nanum Gothic', sans-serif;
}
tr, td{ border:1px solid #8C8CF5;
border-collapse: collapse;
font-family: 'Nanum Gothic', sans-serif;
font-size:13px;
color : #444444;
}
th{
color: white;
background-color: #8C8CF5;
font-family: 'Nanum Gothic', sans-serif;
font-size:13px

}
button {
    width: 70%;
    font-size:15px;
    border-color: #0d0d5b;
    color: black;
    padding-top:3px;
    border-radius: 4px;
    cursor: pointer;
    align:center;
}
</style>
</head>
<body>
	<%@ include file="top.jsp"%>
	<% if (session_id==null) {
		response.sendRedirect("index.html");
		return;
	}
	%>
	<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
      <div class="w-100">
        <h2 class="mb-5">My Class</h2>
		<form id="my_form" action="select_search.jsp" method="post"></form>
	
	<table height="100px" width="75%"  border>
		<br>
		<br>
		<br>
		<br>
		<tr>
			<th style="text-align : center;">과목번호</th>
			<th style="text-align : center;">분반</th>
			<th style="text-align : center;">과목명</th>
			<th style="text-align : center;">강의실</th>
			<th style="text-align : center;">시간</th>
			<th style="text-align : center;">학점</th>
			<th style="text-align : center;">교수명</th>
		</tr>
		<%
		  
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
		</tr>
		
		
		
<%      
		}
		}
			
			
			CallableStatement cstmt = myConn.prepareCall("{call SelectTimeTable(?,?,?,?,?)}");
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
				
			
			<table width="75%" height="15%"  style="border: none; ">
			<tr style="border: none; font-family: 'Nanum Gothic', sans-serif; font-size:13px"><td style="border: none;">
			<b><%=nYear%></b>년도 <b><%=nSemester%></b>학기 수강조회
			</td></tr>
			<tr style="border: none; font-family: 'Nanum Gothic', sans-serif; font-size:13px">
				<td style="border: none;">● 총 <b><%=result1%></b> 과목을 신청했습니다.</td>
			</tr>
			
			<tr style="border: none;font-family: 'Nanum Gothic', sans-serif; font-size:13px">
				<td style="border: none;">● 총 <b><%=result2%></b> 학점을 신청했습니다.</td>
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
</form>
	</table>
</body>
</html>
