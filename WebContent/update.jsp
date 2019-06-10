<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>

<html><head><title>수강신청 입력</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Resume - Start Bootstrap Theme</title>

<style>
}
a:hover {
 color:#ffffff;
 border-bottom:1px solid black;
}
table{
	margin-top:80px;
	border: 0px solid #0d0d5b;
	text-align: center;

	}
	
th{
	background-color:  #8C8CF5;
	color:white;
	
	}
	td{
	border:1px solid #8C8CF5;
	border-collapse: collapse;
	
	}
button {
    width: 50%;
    font-size:20px;
    border-color: #0d0d5b;
    color: #0d0d5b;
    margin-top:10px;
    padding-top:3px;
    border-radius: 4px;
    cursor: pointer;
    align:center;
}

</style>
</head>
<body>
<%@ include file="top.jsp" %>
<%
if (session_id==null) {
	response.sendRedirect("index.html");  
	return;
}
%>

<%
Connection myConn = null;
Statement stmt = null;
String mySQL = null;
String mySQL2 = null;
String dbdriver="oracle.jdbc.driver.OracleDriver";
String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
String user="dbp";
String passwd="dbp1615";
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();

String userID =request.getParameter("userID");
String userPassword =request.getParameter("userPassword");

mySQL =  "select * from student where s_id='" + session_id + "'" ; 
%>

<%
ResultSet rs = stmt.executeQuery(mySQL);
rs.next();
String s_pwd = rs.getString("s_pwd");
String s_name = rs.getString("s_name");
String s_major = rs.getString("s_major");
String s_grade = rs.getString("s_grade");
String s_tel = rs.getString("s_tel");
String s_addr = rs.getString("s_addr");
%>

<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
      <div class="w-100">
        <h2 class="mb-5">Modify</h2>
        <form method="post" action="update_change.jsp">
		<table width="50%" height="40%" >
		<tr>
			<th> ID </th>
			<td><%=session_id%></td>
		</tr>
		<tr>
			<th> Password </th>
			<td><%=s_pwd%></td>
		</tr>
		<tr>
			<th> Name </th>
			<td><%=s_name%></td>
		</tr>
		<tr>
			<th> Major </th>
			<td><%=s_major%></td>
		</tr>
		<tr>
			<th> Grade </th>
			<td><%=s_grade%></td>
		</tr>
		<tr>
			<th> Tel No. </th>
			<td><%=s_tel%></td>
		</tr>
		<tr>
			<th > Address </th>
			<td><%=s_addr%></td>
		</tr>	
		
		<tr>
			
			<td colspan="2" style="border-style: none;"><a href="update_change.jsp" ><button type="button" >수정하기</button></a></td>
		</tr>
		</table>
		</form>
		
		<%
		stmt.close();
		myConn.close();
		%>
        

</body>
</div>
</section>
 </html>


<style>




