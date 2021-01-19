<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
/* padding: content와 boreder 사이의 공간 */
body {
	padding-top: 4.2rem;
	padding-bottom: 4.2rem;
	background: rgba(0, 0, 0, 0.76);
}
/* text-decoration: 선으로 텍스트를 꾸밀 수 있게 해주는 속성 */
/* none : 선을 만들지 않습니다. */
a {
	text-decoration: none !important;
}
/* h1,h2,h3에 다른 기본 글꼴 사용. */
h1, h2, h3 {
	font-family: 'Kaushan Script', cursive;
}

/* position: 요소에 사용될 위치 확인 방법의 타입을 지정 
         	-static / relative / fixed / absolute / sticky */
/* flex 속성 : 길이를 유연하게 설정 */
/* -ms-flex: 1; / IE 10 에서  */
/* flex-direction: column -> 어떻게 flex item들을 flex container안에 두는지
          	https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction */
/* width : 너비 꽉(100%) 채워서 */
/* pointer-events: auto 가까이가면 손모양으로 나오게 */
/* background-clip : padding-box 배경이 가장자리 안쪽에 뻗히게 */
/* max-width:요소의 최대너비 150픽셀 */
.myform {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	padding: 1rem;
	-ms-flex-direction: column;
	flex-direction: column;
	width: 100%;
	pointer-events: auto;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid rgba(0, 0, 0, .2);
	border-radius: 1.1rem;
	outline: 0;
	max-width: 500px;
}

/*텍스트 변환:대문자 */
.tx-tfm {
	text-transform: uppercase;
}

.mybtn {
	border-radius: 50px;
}
/*margin top:elements의 위쪽 마진 */
.login-or {
	position: relative;
	color: #aaa;
	margin-top: 10px;
	margin-bottom: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}
/*text-align : 텍스트 정렬을 설정*/
.span-or {
	display: block;
	position: absolute;
	left: 50%;
	top: -2px;
	margin-left: -25px;
	background-color: #fff;
	width: 50px;
	text-align: center;
}

.hr-or {
	height: 1px;
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}

.singUp {
	color: #666;
	width: 100%;
	height: 40px;
	text-align: center;
	outline: none;
	border: 1px solid lightgrey;
}

form .error {
	color: #ff0000;
}

#second {
	display: none;
}
</style>
<title>Insert title here</title>
</head>
<body>
<!--  Bootstrap 그리드의 기본 구조  -->
<!-- 
	<div class="container">
	  <div class="row">
	    <div class="col-*-*"></div>
	    <div class="col-*-*"></div>
	  </div>
	 </div>
   -->
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div id="first">
					<div class="myform form ">
					<!-- mb-3 : 밑의 컨테이너와 적절한 거리 유지 -->
						<div class="logo mb-3">
					<!-- 부트스트랩 그리드 시스템  
						https://poiemaweb.com/bootstrap-grid-system  -->
							<div class="col-md-12 text-center">
								<h1>login</h1>
							</div>
						</div>
						<form action="loginPro.jsp" method="post" name="login">
							<div class="form-group">
								<label for="id">아이디</label> 
								<input type="text" name="id" class="form-control" id="id"
									 placeholder="아이디를 입력하세요">
							</div>
							<div class="form-group">
								<label for="pw">비밀번호</label> <input
									type="password" name="pw" id="password" class="form-control"
									placeholder="비밀번호를 입력하세요">
							</div>
							<div class="col-md-12 text-center ">
								<button type="submit"
									class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
							</div>
							<div class="col-md-12">
								<div class="login-or">
									<hr class="hr-or">
									<span class="span-or"></span>
								</div>
							</div>
						</form>
						<div class="col-md-12 mb-3">
							<p class="text-center">
								<a href="signUp.jsp" class="singUp btn mybtn"> 회원가입 </a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>