<%@page import="com.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>loginPro.jsp</h1>
	<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	//입력정보 ID,PW에 저장
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	
	//MemberDAO 객체 생성 -idCheck(id,pw)
	MemberDAO mdao = new MemberDAO();
	int check=mdao.idCheck(id, pw);
	
	System.out.println("로그인 체크값:"+check);
	
	//로그인 성공 -[1]
	//비밀번호 오류 -[0]
	//아이디가 없는 경우 -[-1]
			
	if(check==1){
		//로그인 성공
		session.setAttribute("id", id);
		//메인 페이지로 이동
		%>
		<script type="text/javascript">
		alert("로그인 성공!");
		location.href="../index1.jsp"
		</script>
		<%
		
	}else if(check==0){
		//비밀번호 오류
		%>
		<script type="text/javascript">
		alert("비밀번호 오류!");
		history.back();
		</script>
		<%
		
	}else{//check==-1
		
		%>
		<script type="text/javascript">
		alert("아이디가 없습니다. 회원가입 하세요");
		history.back()
		</script>
		<%
	}
	
	
	
	
	%>

</body>
</html>