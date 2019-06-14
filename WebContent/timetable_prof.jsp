<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>

<html><head><title>�ð�ǥ</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<style>
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
button{
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
<%@ include file="top_prof.jsp" %>

<%
if (session_id==null) {
   response.sendRedirect("index.html");
   %><script>alert("�α��� �� �̿��ϼ���");</script><%
   return;
}
%>

<%!
public int getDayValue(String str){
   if(str.equals("��"))
      return 0;
   else if(str.equals("ȭ"))
      return 1;
   else if(str.equals("��"))
      return 2;
   else if(str.equals("��"))
      return 3;
   else if(str.equals("��"))
      return 4;
   else return -1;
}
%>

<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
<div class="w-100">
  <h2 class="mb-5">Timetable</h2>
  
  
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
   �г⵵: <select name="year" id="yearSelect">
               <option value="2019">2019�г⵵</option>
               <option value="2018">2018�г⵵</option>
               <option value="2017">2017�г⵵</option>
               <option value="2016">2016�г⵵</option></select>
      �б�:   <select name="semester" id="semesterSelect" style="width:80px;"><option value="1">1�б�</option>
                     <option value="2">2�б�</option></select>
        <button>�˻�</button></form></td></tr>
</table>
<script>
   document.getElementById("yearSelect").value = <%= nYear %>;
   document.getElementById("semesterSelect").value = <%= nSemester %>;
</script>
<table border= "1" class="table_style1">
   <tr><td width="20px"></td><td>��</td><td>ȭ</td><td>��</td><td>��</td><td>��</td></tr>
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
         %>course table�� �ҷ��� �� ����<%
         break;
      }
      
      int hr = Integer.parseInt(c_time.substring(0, 2));
      int min = Integer.parseInt(c_time.substring(3, 5));
      int startTime = hr*4+min/15;
      hr = Integer.parseInt(c_time.substring(6, 8));
      min = Integer.parseInt(c_time.substring(9, 11));
      
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
         %>professor table�� �ҷ��� �� ����<%
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
   <tr><td width= "65%"></td><td>�� ��������: <%= totalEnrolledClass %></td><td>�� ��������: <%= totalEnrolledUnit %></td></tr>
</table>
</div>
</section>
</body>
</html>