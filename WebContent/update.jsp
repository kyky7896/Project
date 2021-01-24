<%@page import="com.member.MemberBean"%>
<%@page import="com.member.MemberDAO"%>
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
<title>회원정보 수정</title>
</head>
<body>
	<%
		//한글처리
		request.setCharacterEncoding("UTF-8");
		String id=(String)session.getAttribute("id");
		if(id==null){
			System.out.println("아이디 없을때 : 로그인페이지");
			response.sendRedirect("login.jsp");
		}
		
		MemberDAO mdao=new MemberDAO();
		//회원정보 가져오는 메서드 호출
		MemberBean mb =mdao.getMember(id);
		
		if(mb.getGender()==null){
			mb.setGender("남자");
		}
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 mx-auto">
				<div id="second">
					<div class="myform form">
						<div class="logo mb-3">
							<div class="col-md-11 text-center">
								<h1>Member</h1>
							</div>
						</div>
						<form action="updatePro.jsp" method="post">
							<div class="form-group">
								<label for="id"> 아이디 </label>
								<input type="text" name="id" class="form-control" readonly
									  value="<%=mb.getId() %>" placeholder="아이디를 입력하세요."> 
							</div>
							<div class="form-group">
								<label for="pwd">비밀번호</label> 
								<input type="password" name="pw" 
									class="form-control" 
									placeholder="비밀번호를 입력하세요.">
							</div>
							<div class="form-group">
								<label for="name">이름</label> 
								<input type="text" name="name" class="form-control" 
									 value="<%=mb.getName() %>" placeholder="이름을 입력하세요.">
							</div>
							<div class="form-group">
								<label for="gender">성별</label> <br>
								남자 <input type="radio" name="gender" value="남자"
								<%if(mb.getGender().equals("남자")){ %>
								checked="checked"
								<%} %>
								> 
								여자 <input type="radio" name="gender" value="여자"
								<%if(mb.getGender().equals("여자")){ %>
								checked="checked"
								<%} %>
								> 
								
							</div>
							<div class="form-group">
								<label for="phone">전화번호</label> 
								<input type="text" name="phonenumber" class="form-control" 
									 value="<%=mb.getPhonenumber() %>" placeholder="전화번호를 입력하세요">
							</div>
							
							<div class="form-group">
								<label for="email">이메일</label> 
								<input type="email" name="email" class="form-control" 
									 value="<%=mb.getEmail() %>" placeholder="이메일을 입력하세요">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">우편번호</label>
								<input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호">
								<input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" name=address1 class="form-control" value="<%=mb.getAddress1() %>" placeholder="주소"><br>
								<input type="text" id="sample6_detailAddress" name=address2 class="form-control" value="<%=mb.getAddress2() %>" placeholder="상세주소">
								<input type="text" id="sample6_extraAddress" name=address3 class="form-control" placeholder="참고항목">
							</div>
							<div class="col-md-12 text-center mb-3">
								<input type="submit"
									class=" btn btn-block mybtn btn-primary tx-tfm" value="회원 정보 수정">
							</div>
	
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    
    
</script>

</body>
</html>