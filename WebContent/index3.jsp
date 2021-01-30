<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>마켓</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/business-frontpage.css" rel="stylesheet">
</head>

<body>

  <!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.jsp">Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="index2.jsp">게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./member/signUp.jsp">회원가입</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./member/login.jsp">로그인</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
	<jsp:include page="/inc/header.jsp" />
	
	
  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-md-12 mb-5">
        <jsp:include page="/board/write.jsp" />    
      </div>
      </div>
    </div>
    <!-- /.row -->
  <!-- /.container -->

  <!-- Footer -->
	<jsp:include page="/inc/bottom.jsp" />
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<script type="text/javascript">
	
	</script>
</head>
<body>

</body>
</html>