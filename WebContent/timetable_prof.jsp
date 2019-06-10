<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>시간표</title>
<style>
#container {
	display: flex;
	justify-content: center;
	align-items: center;
}
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
table {
   width: 750px;
   margin-left: auto;
   margin-right: auto;
   border: 0px solid #0d0d5b;
      text-align: center;
}
.table_style1{
   width: 620px;
   margin-top: 20px;
   text-align: center;
}
button { width: 80px; height: 25px; }
div{
	font-size:12px;
   	border: 1px solid;
   	text-align: center;
}
.schedule {
   position: relative; 
   width: 620px; 
   margin-left: auto;
   margin-right: auto;
   border-color: #D8D8D8;
}
.time{
   width:20px;
   height:80px;
   border-color: #D8D8D8;
}
.course{
   width: 120px;
   position: absolute;
   border-color: #D8D8D8;
}
</style>
</head>
<body>
<%@ include file="top_prof.jsp" %>
<%!
public int getDayValue(String str){
   if(str.equals("월"))
      return 0;
   else if(str.equals("화"))
      return 1;
   else if(str.equals("수"))
      return 2;
   else if(str.equals("목"))
      return 3;
   else if(str.equals("금"))
      return 4;
   else return -1;
}
%>
<% 
if(session_id == null)
   response.sendRedirect("login.jsp");

Connection myConn = null;
Statement stmt = null;
Statement stmt2 = null;
String mySQL = "";
String mySQL2 = "";
String mySQL3 = ""; 
String result = null;
String result1 = null;
String result2 = null;
ResultSet myResultSet = null;


String dbdriver="oracle.jdbc.driver.OracleDriver";
String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
String user="dbp";
String passwd="dbp1615";
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();


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



String p_id = session_id;

int totalEnrolledClass = 0;
int totalEnrolledUnit = 0;
String color[] = {"#adc87a", "#90cec1", "#83a3e3", "#f0ad72", "#e18b7b", "#e5c476", "#9a87db", "#8ac88e"};
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();
mySQL = "select * from course where p_id IN (select p_id from open where p_id = '" + session_id + "' and e_year ='" + nYear + "'and e_semester = '" + nSemester +"')";
myResultSet = stmt.executeQuery(mySQL);
%>
<table id=timetable align="center" class="table_style1">
   <tr><td><form method="post" action="timetable_prof.jsp">
   학년도: <select name="year" id="yearSelect"><option value="2014">2014학년도</option>
               <option value="2015">2015학년도</option>
               <option value="2016">2016학년도</option>
               <option value="2017">2017학년도</option>
               <option value="2017">2018학년도</option>
               <option value="2018">2019학년도</option></select>
      학기:   <select name="semester" id="semesterSelect" style="width:80px;"><option value="1">1학기</option>
                     <option value="2">2학기</option></select>
        <button>검색</button></form></td></tr></table>
<script>
   document.getElementById("yearSelect").value = <%= nYear %>;
   document.getElementById("semesterSelect").value = <%= nSemester %>;
</script>
<table border= "1" class="table_style1">
   <tr><td width="20px"></td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td></tr>
</table>
<div class="schedule">
<%
   int endHr = 14;
   int y = 0;
   while(myResultSet.next() != false){
      String c_id="", c_class="", c_name="", c_day="", c_time="", c_classroom="", p_name="";
      int c_credit=0;
      c_id = myResultSet.getString("c_id");
      c_class = myResultSet.getString("c_class");
      c_day =  myResultSet.getString("c_day");
      c_time =  myResultSet.getString("c_time");
      c_classroom =  myResultSet.getString("c_classroom");
      c_name =  myResultSet.getString("c_name");
      
      stmt2 = myConn.createStatement();
      mySQL2 = "select * from course where c_id = '" + c_id + "' and c_class = '" + c_class + "'";
      ResultSet myResultSet2 = stmt2.executeQuery(mySQL2);
      if(myResultSet2.next()){
         c_name =  myResultSet2.getString("c_name");
         c_credit =  myResultSet2.getInt("c_credit");
      }else{
         %>course table을 불러올 수 없음<%
         break;
      }
      
      int hr = Integer.parseInt(c_time.substring(0, 2));
      int min = Integer.parseInt(c_time.substring(3, 5));
      int startTime = hr*4+min/15;
      hr = Integer.parseInt(c_time.substring(6, 8));
      min = Integer.parseInt(c_time.substring(9, 11));
      System.out.println("hh" + hr + min + startTime);
      if(endHr < hr)
         endHr = hr;
      int endTime = hr*4+min/15;
      int startPos = (startTime - 36)*20;
      int height = (endTime - startTime)*20;
      
      mySQL2 = "select * from professor where p_id='" + p_id + "'";
      myResultSet2 = stmt2.executeQuery(mySQL2);
      if(myResultSet2.next()){
         p_name =  myResultSet2.getString("p_name");
      }else{
         %>professor table을 불러올 수 없음<%
         break;
      }
      
      int len = c_day.length();
      for(int i=0; i<len; i+=2){
         int dayPos = 20 + 120*getDayValue(c_day.substring(i, i+1));
         %><div id='container' class="course" style="top:<%=startPos%>px; left:<%=dayPos%>px; height:<%=height%>px;
         background-color:<%=color[totalEnrolledClass%8]%>">
         <%=c_name%><br>
         <%=c_time%><br>
         <%=c_classroom %>
         </div><%
      }
      totalEnrolledClass += 1;
      totalEnrolledUnit += c_credit;
   }
   for(int i=9; i<=endHr; i++){%>
   <div class="time" style="top:<%=y%>; left:0;"><%=i%></div><%
   y += 80;
}
%> 
</div>
<table>
   <tr><td width= "65%"></td><td>총 개설과목: <%= totalEnrolledClass %></td><td>총 개설학점: <%= totalEnrolledUnit %></td></tr>
</table>

</body>
</html>