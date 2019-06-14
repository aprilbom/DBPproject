<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강의 개설</title>
<style>
}
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 
a:hover {
 color:#ffffff;
 border-bottom:1px solid black;
}

input[type=submit] {
background:#FFFFCC;
color:#444444;
border:none;
height:30px;
padding:0 10em;
cursor:pointer;
transition:800ms ease all;
outline:none;
align:center;
font-family: 'Nanum Gothic', sans-serif;
}
table{
   margin-top:80px;
   border: 0px solid #8C8CF5;
   text-align: center;
   }
   
th{
   background-color:  #8C8CF5;
   color:white;
   font-family: 'Nanum Gothic', sans-serif;
   font-size:13px;
   }
   td{
   border:1px solid #8C8CF5;
   font-family: 'Nanum Gothic', sans-serif;
   font-size:13px;
   color:#444444;
   padding:15px;
   }
   
#button {
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
       <h2 class="mb-5">Open Class</h2>
		<%@ include file="top_prof.jsp" %>
		<% if (session_id==null) {
		   response.sendRedirect("login.jsp");
		   return;
		}
		
		
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
		<table width="60%" height="40%">
		<col width="120">
		<tr>
		   <th> ID </th>
		   <td><%=session_id%></td>
		</tr>
		<tr>
		   <th> 과목명 </th>
		   <td><input type="text" name="coursename" id="coursename"></td>
		</tr>
		<tr>
		   <th> 과목번호 </th>
		   <td><input type="text" name="courseid" id="courseid" ></td>
		</tr>
		<tr>
		   <th> 분반 </th>
		   <td><input type="text" name="courseclass" id="courseclass" ></td>
		</tr>
		<tr>
			<th> 학점 </th>
		   <td><input type="text" name="coursecredit" id="coursecredit"></td>
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