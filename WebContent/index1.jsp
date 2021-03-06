<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>--</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/business-frontpage.css" rel="stylesheet">
<style>

#slider{
  width: 100%;
  position:relative;
}
.slider__item{
  width: 100%;
  height: 500px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  font-size: 48px;
  position:absolute;
  top:0;
  z-index:0;
  opacity:0;
  transition: all 1s ease-in-out;
}
.slider__item:nth-child(odd){
  background-color:royalblue;
}
.slider__item:nth-child(even){
  background-color:blueviolet;
}
.showing{
  z-index:1;
  opacity:1;
}

</style>  

</head>

<body>
<%
		
		String id = (String)session.getAttribute("id");
	
		
	
	%>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">
      <% if(id != null){
    	  %>
    	    <%= id %> 님 환영합니다. 
      <%
      	}
      %>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="index2.jsp">게시판</a>
          </li>
          <%
          if(id!=null){
        	  %>
        	<li class="nav-item">
              <a class="nav-link" href="./member/update.jsp">정보수정</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="./member/delete.jsp">탈퇴하기</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="./member/logout.jsp">로그아웃</a>
            </li>
            
            <%
          		if(id.equals("admin")){
          			%>
          			<li class="nav-item">
                    <a class="nav-link" href="mailForm.jsp">메일 보내기</a>
                  </li>
          		<%
          		}

          }else{
            %>
         
          <li class="nav-item">
            <a class="nav-link" href="./member/signUp.jsp">회원가입</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./member/login.jsp">로그인</a>
          </li>
          <%	} %>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <jsp:include page="/inc/header.jsp" />
  <!-- Page Content -->
  <div class="container">
      <div class="col-md-7 mb-5">
        <h2>--</h2>
        <hr>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. A deserunt neque tempore recusandae animi soluta quasi? Asperiores rem dolore eaque vel, porro, soluta unde debitis aliquam laboriosam. Repellat explicabo, maiores!</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis optio neque consectetur consequatur magni in nisi, natus beatae quidem quam odit commodi ducimus totam eum, alias, adipisci nesciunt voluptate. Voluptatum.</p>
        <a class="btn btn-primary btn-lg" href="#">Call to Action &raquo;</a>
      </div>
      <div class="col-md-5 mb-5">
       
      </div>
    </div>
    <!-- /.row -->

    <div class="row">
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <img class="card-img-top" src="https://placehold.it/300x200" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque sequi doloribus.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <img class="card-img-top" src="https://placehold.it/300x200" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque sequi doloribus totam ut praesentium aut.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <img class="card-img-top" src="https://placehold.it/300x200" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

  </div>
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