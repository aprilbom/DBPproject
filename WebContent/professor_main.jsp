<%@ page contentType="text/html; charset=EUC-KR" %> 
<html><head>
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

body {
 	
    background-size: 100% 50%;
    background-repeat: no-repeat;
    background-position: right 210px;
}
</style>
<title>������ ������û �ý��� �Դϴ�.</title></head>
<body background="C:\apache-tomcat-7\webapps\ROOT\dbproject\WebContent\school.jpg" >
<%@ include file="top_prof.jsp" %>
<table width="100%"  style="padding-top:20px;  text-align: center;">
<% if (session_id!= null) { %>
<tr>
<td><%=session_id%> �� �湮�� ȯ���մϴ�.</td>
</tr>
<% } else { %>
<tr>
<td>�α����� �� ����ϼ���.</td>
</tr>
<%
}
%>
</table>
<footer style="position:absolute;
    bottom:0;
    width:100%;
    height:70px;   
    background:#ccc;"> 
    <ul><li>
</ul>
<p align="center">  Copyright �� 2019 JUbomJU</p></footer>
</body>
</html>