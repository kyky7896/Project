<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {
	padding-top: 4.2rem;
	padding-bottom: 4.2rem;
	background: rgba(0, 0, 0, 0.76);
}

a {
	text-decoration: none !important;
}

h1, h2, h3 {
	font-family: 'Kaushan Script', cursive;
}

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
</style>
<title>회원에게 메일 보내기</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 mx-auto">
				<div id="second">
					<div class="myform form">
						<div class="logo mb-3">
							<div class="col-md-11 text-center">
								<h1>Send Mail</h1>
							</div>
						</div>
						<form action="mailSend" method="post"  >
							<div class="form-group">
								<label for="mailSender"> 보내는 사람 메일: </label>
								<input type="text" name="sender" class="form-control" 
									  value="kyky7896@gmail.com" readonly> 
							</div>
							<div class="form-group">
								<label for="mailReceiver">받는 사람 메일:</label> 
								<input type="text" name="receiver" 
									class="form-control" "
									placeholder="받는사람의 메일을 입력하세요.">
							</div>
							<div class="form-group">
								<label for="mailSubject">메일 제목</label> <input
									type="text" name="subject" 
									class="form-control" >
							</div>
							<div class="form-group">
								<label for="mailContext">내용</label> 
								<textarea name="content" class="form-control" ></textarea>
									
							</div>
							
							<div class="col-md-12 text-center mb-3">
								<input type="submit"
									class=" btn btn-block mybtn btn-primary tx-tfm" value="메일 보내기">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>