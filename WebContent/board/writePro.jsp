<%@page import="com.member.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%	//한글처리
			request.setCharacterEncoding("UTF-8");
		
			//전달정보 저장
			%>
			<jsp:useBean id="bb" class="com.member.BoardBean"/>
			<jsp:setProperty property="*" name="bb"/>
			
			<%
		String ip=request.getRemoteAddr();
		bb.setIp(ip);
		
		//전달된 정보 확인
		System.out.println("전달된 정보:"+bb.toString());
		
		BoardDAO bdao=new BoardDAO();
		bdao.insertBoard(bb);
		
		
		response.sendRedirect("../index2.jsp");
		
		
		%>
</body>
</html>