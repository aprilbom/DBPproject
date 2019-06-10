<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>숙명여대 수강신청 시스템</title>

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
          <a class="nav-link js-scroll-trigger" href="jsp.html">Login</a>
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
        <div class="subheading mb-5">Sookmyung Women's University enrollment application system.</div>
        
        <div><b>로그인 후 이용하세요.</b></div>
        
        <div align = "left">
        <table width="75%" align="left" >
		<form method="post" action="login_verify.jsp" >
		<tr>
		<td><div>ID<input type="text" name="userID" style="vertical-align: 0px"></div></td>
		</tr>
		<tr>
		<td><div>PW<input type="password" name="userPassword" style="vertical-align: 1px">
		</div></td><br>
		</tr>
		<td>
		<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="로그인" >
		<INPUT TYPE="RESET" VALUE="취소" >
		</td>
		</form>
		</table>
        </div>
      </div>
    </section>

    <hr class="m-0">

    </div>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/resume.min.js"></script>
  
</body>

</html>
