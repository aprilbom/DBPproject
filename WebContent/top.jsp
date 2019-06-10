<%@ page contentType="text/html; charset=EUC-KR" %>
<%
String session_id= (String)session.getAttribute("userID");
String session_pwd = (String)session.getAttribute("userPassword");

String log;
String log2;
int login=0;
if (session_id==null) {
	log="index.html";
	log2="login";
}
else{
	log="logout.jsp";
	log2="logout";
	login=1;
}
%>
<nav><ul>



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
        <img class="img-fluid img-profile rounded-circle mx-auto mb-2" onclick="javascript:location.href='main.jsp'" src="img/snow.jpg" alt="" href="main.jsp">
      </span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav">
        <li class="nav-item">
        	<% if (login==1) {%>
        	<a class="nav-link"><%=session_id %> ¥‘ ¡¢º”¡ﬂ</a> <% }%>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="insert.jsp">Class Select</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="delete.jsp">Class Delete</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="select.jsp">My Class</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="timetable.jsp">My TimeTable</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="update.jsp">Modify</a>
        </li>
        <li class="nav-item">
        	<a class="nav-link js-scroll-trigger" href=<%=log %>><b><%=log2 %></b></a>
        </li>
      </ul>
    </div>
  </nav>


</ul></nav>