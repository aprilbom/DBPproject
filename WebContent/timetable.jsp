<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>

<html><head><title>수강신청 입력</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>시간표</title>


<style>

a:hover {
 color:#ffffff;
 border-bottom:1px solid black;
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
   border-color: #ffffff;
}

.schedule {
   position: relative; 
   width: 620px; 
   margin-left: auto;
   margin-right: auto;
   border-color: #D8D8D8;
   font-size:12px;
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
   text-align: center;
}
#container {
   display: flex;
   justify-content: center;
   align-items: center;
   color: #ffffff;
}

</style>
</head>
<body>
<%@ include file="top.jsp" %>
<%
if (session_id==null) {
   response.sendRedirect("index.html");
   %><script>alert("로그인 후 이용하세요");</script><%
   return;
}
%>

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


<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
<div class="w-100">
  <h2 class="mb-5">My Timetable</h2>
  
<%
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



String s_id = session_id;

int totalEnrolledClass = 0;
int totalEnrolledUnit = 0;
String color[] = {"#adc87a", "#90cec1", "#83a3e3", "#f0ad72", "#e18b7b", "#e5c476", "#9a87db", "#8ac88e"};
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();
mySQL = "select * from course where c_id IN (select c_id from enroll where s_id = '" + session_id + "' and e_year ='" + nYear + "'and e_semester = '" + nSemester +"')";
myResultSet = stmt.executeQuery(mySQL);
%>


<table width="50%" align="center" style="border: none; ">
         <tr style="border: none;" >
            <td style="border: none;"><input type="text" id="nYear" name="nYear" value=<%=nYear%> /> 년도</td>
            <td style="border: none;"><input type="text" id="nSemester" name="nSemester" value=<%=nSemester%> />학기</td>
            <td style="border: none;"><input type="submit" value="조회" style=" border-color: #8C8CF5; color: black; padding-top:3px; border-radius: 4px;
          cursor: pointer;  width: 70%;
          font-size:15px;
          align:center;"/></td>
         </tr>
         </table>


<table border= "1" class="table_style1">
   <tr><td width="20px"></td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td></tr>
</table>

<div class="schedule">
<%
   int endHr = 14;
   int y = 0;
   while(myResultSet.next() != false){
      String c_id="", c_class="", c_name="", c_day="", c_time="", c_classroom="", s_name="";
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
      
      mySQL2 = "select * from student where s_id='" + s_id + "'";
      myResultSet2 = stmt2.executeQuery(mySQL2);
      if(myResultSet2.next()){
         s_name =  myResultSet2.getString("s_name");
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
   <tr><td width= "65%"></td><td>총 수강과목: <%= totalEnrolledClass %></td><td>총 수강학점: <%= totalEnrolledUnit %></td></tr>
</table>

</div>
</section>

</body>

</html>