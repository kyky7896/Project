
<%@page import="com.member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
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
	
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	%>
	
	<jsp:useBean id="mb" class="com.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
	mb.setReg_date(new Timestamp(System.currentTimeMillis()));
	System.out.println("전달 정보"+mb);
	
	MemberDAO mao=new MemberDAO();
	mao.InsertMember(mb);
	
	

	%>
	<script type="text/javascript">
	alert("회원가입완료!");
	location.href="login.jsp";
	</script>
	
</body>
</html>