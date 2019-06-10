<%@ page contentType="text/html; charset=EUC-KR" %>
<html><head>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>환영합니다!</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/resume.min.css" rel="stylesheet">

</head>

<body id="page-top">

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
          <a class="nav-link js-scroll-trigger" href="#skills">My Class</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#interests">My TimeTable</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#awards">Modify</a>
        </li>
      </ul>
    </div>
  </nav>

  <div class="container-fluid p-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="about">
      <div class="w-100">
        <h1 class="mb-0">Welecome To
          <span class="text-primary">SMU</span>
        </h1>
        <div class="subheading mb-5">Sookmyung Women's University enrollment application system.
        </div>		
		<body background="C:\apache-tomcat-7\webapps\ROOT\dbproject\WebContent\school.jpg" >
		<%@ include file="top.jsp" %>
		<table width="100%"  style="padding-top:20px;  text-align: center;">
		<% if (session_id!= null) { %>
		<tr>
		<td><b><%=session_id%></b> 님 방문을 환영합니다.</td>
		</tr>
		<% } else { %>
		<tr>
		<td>로그인한 후 사용하세요.</td>
		</tr>
		<%
		}
		%>
		</table>
		</body>
        </div>
      </div>
    </section>
<style>

</style></head>

</html>