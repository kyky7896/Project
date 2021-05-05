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
	<%
	request.setCharacterEncoding("UTF-8");
	
	String pageNum=request.getParameter("pageNum");
	
	//num, re_ref, re_lev, re_seq, name, pass, subject, content저장
	%>
	<jsp:useBean id="bb" class="com.member.BoardBean" />
	<jsp:setProperty property="*" name="bb"/>
	
	
	<%
	System.out.println("pro(답글) :"+bb);
	BoardDAO bdao=new BoardDAO();
	bdao.reInsertBoard(bb);
	
	response.sendRedirect("../index2.jsp?pageNum="+pageNum);
	%>


</body>
</html>