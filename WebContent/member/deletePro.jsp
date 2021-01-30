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
	<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String id=(String)session.getAttribute("id");
	
	if(id==null){
		System.out.println("삭제 페이지-> 로그인페이지");
		response.sendRedirect("login.jsp");
	}
	
	
	
	//삭제할 계정 정보를 받아서 처리
	String pw=request.getParameter("pw");
	
	//DAO객체 생성-DeleteMember(id,pw);
	MemberDAO mdao=new MemberDAO();
	int check=mdao.deleteMember(id, pw);
	
	if(check==1){
		session.invalidate();
		%>
		<script type="text/javascript">
			alert("회원 탈퇴 완료!");
			location.href = "index.jsp";
		</script>
		<%
	}else if(check==0){
		%>
		<script type="text/javascript">
			alert("비밀번호 에러!");
			history.back();
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("회원 정보 없음!");
			history.back();
		</script>
		<%
		
	}
	
	%>

</body>
</html>