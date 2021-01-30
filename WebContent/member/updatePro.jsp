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
	//로그인 세션
	String id=(String) session.getAttribute("id");
	if(id==null){
		System.out.println("정보수정 ->로그인 페이지");
		response.sendRedirect("loginForm.jsp");
	}
	
	//수정할 정보를 모두 저장
	//액션태그
	
	%>
	<jsp:useBean id="updateMem" class="com.member.MemberBean"/>
	<jsp:setProperty property="*" name="updateMem"/>
	<% 
	System.out.println("수정할 정보:"+updateMem);
	
	//수정할 정보를 가지고 DB객체로 이동
	MemberDAO mdao=new MemberDAO();
	
	int check=mdao.updateMember(updateMem);
	
	System.out.println("pro: 수정결과 : "+check);
	
	if(check==1){
		%>
		<script type="text/javascript">
			alert("정보 수정 완료!");
			location.href="../index1.jsp";
		
		</script>
		<%
		
	}else if(check==0){
		%>
		<script type="text/javascript">
			alert("비밀번호 오류!");
			history.back();
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("회원정보 없음! 비회원 ");
			history.back();
			
		</script>
		<%
	}
	
	%>

</body>
</html>