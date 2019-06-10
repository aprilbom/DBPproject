<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>

<html><head><title>수강신청 입력</title>
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
}
tr, td{ 
border:1px solid #8C8CF5;
border-collapse: collapse;
font-family: 'Nanum Gothic', sans-serif;
color :#444444;
font-size:13px;
}
th{
font-family: 'Nanum Gothic', sans-serif;
color: white;
background-color: #8C8CF5;
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

.bottomleft {
position: absolute;
bottom: 0;
left: 0.5em;
width: 400px;
font-weight: bold;
color: #fff;
font-family: 'Nanum Gothic', sans-serif;
}
</style>
</head>

<body>
<%@ include file="top.jsp" %>
<% if (session_id==null) {
   response.sendRedirect("login.jsp");
   return;
}
%>

<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
      <div class="w-100">
        <h2 class="mb-5">Select Class</h2>
        
		<form method="post" action = "test.jsp"><div>
		<select name="select">
		<option value = "1">과목번호</option>
		<option value = "2" selected>과목명</option>
		<option value = "3">교수명</option></select>
		<input type="text" name="course_num">
		<input TYPE="SUBMIT" NAME="Submit"  VALUE="검색" style = " background:#FFFFCC; color:#444444; border:none;height:30px;
  font-size:13px; padding:0 0.5em; cursor:pointer; transition:800ms ease all; outline:none; align:center; font-family: 'Nanum Gothic', sans-serif;"> </div>
		</form>

		<table width="75%" height="100px" border="1">
		<tr>
		<th style="background-color: #8C8CF5; text-align :center"  >과목번호</th><th style="background-color: #8C8CF5; text-align :center" >과목명</th><th style="background-color: #8C8CF5; text-align :center">분반</th><th style="background-color: #8C8CF5; text-align :center">강의실</th><th style="background-color: #8C8CF5; text-align :center">시간</th>
		<th style="background-color: #8C8CF5; text-align :center">학점</th><th style="background-color: #8C8CF5; text-align :center">교수명</th><th width="70px" style="background-color: #8C8CF5; text-align :center">신청</th><th width="70px" style="background-color: #8C8CF5; text-align :center">정원</th><th width="80px" style="background-color: #8C8CF5; text-align :center">수강신청</th>
		</tr> 
		
		<%
		Connection myConn = null;
		Statement stmt = null;
		Statement stmt_comp = null;
		ResultSet myResultSet = null; 
		String mySQL0 = "";
		String mySQL1 = "";
		String mySQL = "";
		String mySQL2 = "";
		String dbdriver="oracle.jdbc.driver.OracleDriver";
		String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
		String user="dbp";
		String passwd="dbp1615";
		
		
		int[] c_id_comp=new int[100];
		String[] c_name_comp=new String[100];
		String[] c_class_comp=new String[100];
		String[] c_day_comp=new String[100];
		String[] c_time_comp=new String[100];
		String[] p_name_comp=new String[100];
		
		int tf=0;
		int i=0;
		
		
		try {
			Class.forName(dbdriver);
			myConn = DriverManager.getConnection (dburl, user, passwd);
			stmt = myConn.createStatement();
			stmt_comp = myConn.createStatement();
		} catch(SQLException ex) { System.err.println("SQLException: " + ex.getMessage()); }
		
		int snum = Integer.parseInt(request.getParameter("select"));
		String cnum =new String(request.getParameter("course_num").getBytes("8859_1"), "EUC-KR");
		System.out.println(cnum);
		
		mySQL0 = "{? = call Date2EnrollYear(SYSDATE)}";
		CallableStatement cstmt = myConn.prepareCall(mySQL0);
		cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
		cstmt.execute();
		int nYear = cstmt.getInt(1);
		
		mySQL1 = "{? = call Date2EnrollSemester(SYSDATE)}";
		CallableStatement cstmt2 = myConn.prepareCall(mySQL1);
		cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
		cstmt2.execute();
		int nSemester = cstmt2.getInt(1);
		
		
		if(snum == 1){ //과목번호
			mySQL = "select c_id, c_name, c_class, c_classroom, c_max, c_day, c_credit, c_time, p_name from course c, professor p where c.c_id = '"+ cnum + "' and c.p_id = p.p_id"; 
			mySQL2 = "select c_id, c_name, c_class, c_day, c_time, p_name from course c, professor p where c.p_id = p.p_id and c.c_id not in (select c_id from enroll where s_id='" + session_id + "')"; 
		}
		else if(snum == 2){ //과목명
			mySQL = "select c_id, c_name, c_class, c_classroom, c_max, c_day, c_credit, c_time, p_name from course c, professor p where c.c_name = '"+ cnum + "' and c.p_id = p.p_id"; 
			mySQL2 = "select c_id, c_name, c_class, c_day, c_time, p_name from course c, professor p where c.p_id = p.p_id and c.c_id not in (select c_id from enroll where s_id='" + session_id + "')";
		}
		else{ //교수명
			mySQL = "select c_id, c_name, c_class, c_classroom, c_max, c_day, c_credit, c_time, p_name from course c, professor p where p.p_name = '"+ cnum + "' and c.p_id = p.p_id"; 
			mySQL2 = "select c_id, c_name, c_class, c_day, c_time, p_name from course c, professor p where c.p_id = p.p_id and c.c_id not in (select c_id from enroll where s_id='" + session_id + "')"; 
		}
		ResultSet rs = stmt.executeQuery(mySQL);
		ResultSet rscomp = stmt_comp.executeQuery(mySQL2);
		
		if (rscomp != null) {
			   while (rscomp.next()) { 
			      c_id_comp[i] = rscomp.getInt("c_id");
			      c_name_comp[i] = rscomp.getString("c_name");
			      c_class_comp[i] = rscomp.getString("c_class");
			      c_day_comp[i] = rscomp.getString("c_day");
			      c_time_comp[i]  = rscomp.getString("c_time");
			      p_name_comp[i] = rscomp.getString("p_name");
			      i++;
			   }
		}
		if (rs != null) {
			   while (rs.next()) {
				  tf=0;
				  int c_id = rs.getInt("c_id");
				  String c_name = rs.getString("c_name");
			      String c_class = rs.getString("c_class");
			      String c_classroom = rs.getString("c_classroom");
			      int c_max = rs.getInt("c_max");
			      String c_day = rs.getString("c_day");
			      String c_time  = rs.getString("c_time");
			      int c_credit = rs.getInt("c_credit"); 
			      String p_name = rs.getString("p_name");
			   
			      CallableStatement cstmt3 = myConn.prepareCall("{call enrollcount(?,?,?,?,?)}");
			      cstmt3.setInt(1, c_id);
			      cstmt3.setString(2, c_class);
			      cstmt3.setInt(3, nYear);
			      cstmt3.setInt(4, nSemester);
			      cstmt3.registerOutParameter(5, java.sql.Types.VARCHAR);
			      cstmt3.execute();
			      int count = cstmt3.getInt(5);
		%>
		 
		<tr>
		<td align="center"><%=c_id%></td> 
		<td align="center"><%=c_name%></td>
		<td align="center"><%=c_class%></td>
		<td align="center"><%=c_classroom%></td>
		<td align="center"><%=c_day%><%=c_time%></td>
		<td align="center"><%=c_credit%></td>
		<td align="center"><%=p_name %></td>
		<td align="center"><%=count%></td>
		<td align="center"><%=c_max%></td>
		<% 
		
		for(int index=0; index<i; index++){
		   if(c_id == c_id_comp[index] && c_name.equals(c_name_comp[index]) && c_class.equals(c_class_comp[index]) && c_day.equals(c_day_comp[index]) && c_time.equals(c_time_comp[index]) && p_name.equals(p_name_comp[index])){
		      tf=1;
		      %>
		      <td align="center"> <a href="insert_verify.jsp?c_id=<%=c_id%>&c_class=<%=c_class%>"><button type="button" >신청</button></a></td>
		<% }else if (index==i-1 && tf==0){
		%> <td></td>
		<%   }
		} %>
		</tr>
		<%
			   }
		}
		stmt.close(); 
		stmt_comp.close();
		myConn.close();
		%>
	</table>
	</div>
	</section>
	</body>
</html> 