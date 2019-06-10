<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수강신청 사용자 정보 수정</title>
<html><head><title>수강신청 입력</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Resume - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/resume.min.css" rel="stylesheet">
  
  <!--  layout  -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
    <a class="navbar-brand js-scroll-trigger" href="#page-top">
      <span class="d-block d-lg-none"></span>
      <span class="d-none d-lg-block">
        <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="img/snow.jpg" alt="">
      </span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="index.html">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="insert.jsp">Class Select</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="delete.jsp">Class Delete</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="select_search">My Class</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="timetable.jsp">My TimeTable</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="update.jsp">Modify</a>
        </li>
      </ul>
    </div>
  </nav>
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
	font-family: 'Nanum Gothic', sans-serif;

	}
	
th{
	background-color:  #8C8CF5;
	color:white;
	font-family: 'Nanum Gothic', sans-serif;
	font-size:13px;
	
	}
	td{
	border:1px solid #8C8CF5;
	border-collapse: collapse;
	font-family: 'Nanum Gothic', sans-serif;
	font-size:13px;
	color : #444444;
	}
#button {
  background:#FFFFCC;
  color:#444444;
  border:none;
  height:30px;
  font-size:14px;
  padding:0 8em;
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
}
%>

<%
Connection myConn = null;
Statement stmt = null;
String mySQL = null;
String mySQL2 = null; 
String result = null;
String dbdriver="oracle.jdbc.driver.OracleDriver";
String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
String user="dbp";
String passwd="dbp1615";
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();
%>

<%
String userID =request.getParameter("userID");
String userPassword =request.getParameter("userPassword");

mySQL =  "select * from student where s_id='" + session_id + "'" ; 

ResultSet rs = stmt.executeQuery(mySQL);
rs.next();
   String s_pwd = rs.getString("s_pwd");
   String s_name = rs.getString("s_name");
   String s_major = rs.getString("s_major");
   String s_grade = rs.getString("s_grade");
   String s_tel = rs.getString("s_tel");
   String s_addr = rs.getString("s_addr");
%>

&nbsp;

<% 
mySQL2 = "update student set s_pwd = '" + s_pwd + "' s_tel = '" + s_tel + "' where  s_id='" + session_id + "'" ;
%>

<!-- <h3 style="text-align: center;"><%=mySQL2%></h3>
<h3 style="text-align: center;"><%=s_pwd%></h3> -->

<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
      <div class="w-100">
        <h2 class="mb-5">Modify</h2>
	<form method="post" action="update_verify.jsp">
	<table width="50%" height="40%" >
	<col width="120">
	<tr>
	   <th> ID </th>
	   <td><%=session_id%></td>
	</tr>
	<tr>
	   <th> Password </th>
	   <td><input type="password" name="newpwd" id="newpwd" value="<%=s_pwd%>"></td>
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
	   <td><input type="text" name="newtel" id="newtel" value="<%=s_tel%>"></td>
	</tr>
	<tr>
	   <th> Address </th>
	   <td><input type="text" name="newaddr" id="newaddr" value="<%=s_addr%>"></td>
	</tr>
	
	<tr>
	   <td colspan="2" style="border-style: none"><input id = "button" type="submit" value="Done"></td>
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

