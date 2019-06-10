<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강사 정보 수정</title>
<style>
}
 
a:hover {
 color:#ffffff;
 border-bottom:1px solid black;
}

input[type=submit] {
    width: 50%;
    
    font-size:20px;
    border-color: #0d0d5b;
    color: #0d0d5b;
    background-color:white;
    margin-top:10px;
    padding-top:3px;
    border-radius: 4px;
    cursor: pointer;
    align:center;
}
table{
   margin-top:80px;
   border: 0px solid #8C8CF5;
   text-align: center;
   }
   
th{
   background-color:  #8C8CF5;
   color:white;
   }
   td{
   border:1px solid #8C8CF5;
   
   }
</style>
</head>
<body>
<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
     <div class="w-100">
       <h2 class="mb-5">Modify</h2>
<%@ include file="top_prof.jsp" %> 

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

mySQL =  "select * from professor where p_id='" + session_id + "'" ; 

ResultSet rs = stmt.executeQuery(mySQL);
rs.next();
String p_name = rs.getString("p_name");
String p_id = rs.getString("p_id");
String p_pwd = rs.getString("p_pwd");
String p_major = rs.getString("p_major");
String p_email = rs.getString("p_email");
%>

&nbsp;

<% 
mySQL2 = "update professor set p_pwd = '" + p_pwd + "' p_email = '" + p_email + "' where  p_id='" + session_id + "'" ;
%>

<!-- <h3 style="text-align: center;"><%=mySQL2%></h3>
<h3 style="text-align: center;"><%=p_pwd%></h3> -->

<form method="post" action="update_verify.jsp">
<table width="50%" height="40%" >
<col width="120">
<tr>
	<th> ID </th>
	<td><%=session_id%></td>
</tr>
<tr>
	<th> Password </th>
	<td><input type="text" name="newpwd" id="newpwd" value="<%=p_pwd%>"></td>
</tr>
<tr>
	<th> Name </th>
	<td><%=p_name%></td>
</tr>
<tr>
	<th> Major </th>
	<td><%=p_major%></td>
</tr>
<tr>
	<th > Email </th>
	<td><input type="text" name="newemail" id="newemail" value="<%=p_email%>"></td>
</tr>	

<tr>
   <td colspan="2" style="border-style: none"><input type="submit" value="확인"></td>
</tr>
</table>
</form>

<%
stmt.close();
myConn.close();
%>

</body>
</html>