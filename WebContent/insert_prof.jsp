<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강사 정보 수정</title>
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
   border: 0px solid #0d0d5b;
   text-align: center;
   }
   
th{
   background-color:  #0d0d5b;
   color:white;
   }
   td{
   border:1px solid #0d0d5b;
   
   }
</style>
</head>

<body>
<%@ include file="top_prof.jsp" %>
&nbsp;
<h3 style="text-align: center;">신규 강의 개설</h3>
<% if (session_id==null) {
   response.sendRedirect("login.jsp");
   return;
}


//String coursename= request.getParameter("coursename");
//String courseid= request.getParameter("courseid");
//String courseclass= request.getParameter("courseclass");
//String coursecredit= request.getParameter("coursecredit");
//String courseclassroom= request.getParameter("courseclassroom");
//String coursemax= request.getParameter("coursemax");



%>
<script>
function check() {
  if(table.coursename.value == "") {
    alert("강의명을 입력해 주세요.");
    table.coursename.focus();
    return false;
  }
  else if(table.courseid.value == "") {
    alert("과목코드를 입력해 주세요.");
    table.courseid.focus();
    return false;
  }
  else if(table.courseclass.value == "") {
	    alert("분반을 입력해 주세요.");
	    table.courseclass.focus();
	    return false;
	  }
  else if(table.coursecredit.value == "") {
	    alert("학점 입력해 주세요.");
	    table.coursecredit.focus();
	    return false;
	  }
  else if(table.courseclassroom.value == "") {
	    alert("강의장소를 입력해 주세요.");
	    table.courseclassroom.focus();
	    return false;
	  }
  else if(table.coursemax.value == "") {
	    alert("최대정원을 입력해 주세요.");
	    table.coursemax.focus();
	    return false;
	  }
  else return true;
}

</script>
<form name="table" method="post" action="insert_verify_prof.jsp" onsubmit="return check()">
<table width="50%" height="40%" align="center">
<col width="120">
<tr>
   <th> ID </th>
   <td><%=session_id%></td>
</tr>
<tr>
   <th> 과목 이름 </th>
   <td><input type="text" name="coursename" id="coursename"></td>
</tr>
<tr>
   <th> 과목 코드 </th>
   <td><input type="text" name="courseid" id="courseid" ></td>
</tr>
<tr>
   <th> 분반 </th>
   <td><input type="text" name="courseclass" id="courseclass" ></td>
</tr>
<tr>
	<th> 학점 </th>
   <td><input type="text" name="coursecredit" id="coursecredit" ></td>
</tr>
<tr>
   <th> 강의 요일 </th>
   <td><select name="courseday">
	 			<option value="월,수">월,수</option>
	 			<option value="화,목">화,목</option>
				<option value="금">금</option></select></tr>
<tr>
   <th> 강의 시간 </th>
   <td><select name="coursetime">
	 			<option value="09:00-10:15">09:00-10:15</option>
	 			<option value="10:30-11:45">10:30-11:45</option>
				<option value="12:00-13:15">12:00-13:15</option>
				<option value="13:30-14:45">13:30-14:45</option>
				<option value="15:00-16:15">15:00-16:15</option>
				<option value="16:30-17:45">16:30-17:45</option>
				<option value="18:00-19:15">18:00-19:15</option></select></tr>

<tr>
   <th> 강의 장소 </th>
   <td><input type="text" name="courseclassroom" id="courseclassroom" ></td>
</tr>
<tr>
   <th> 최대 정원 </th>
   <td><input type="text" name="coursemax" id="coursemax" ></td>
</tr>

<tr>
   <td colspan="2" style="border-style: none"><input type="submit" value="확인" align="center"></td>
</tr>
</table>
</form>

<table width="75%" height="100px" align="center" border>
<br>
</table>
</body>
</html> 
