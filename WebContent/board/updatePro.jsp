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
<h1>WebContent/board/updatePro.jsp</h1>

	<%
	
	request.setCharacterEncoding("UTF-8");
	
	String pageNum=request.getParameter("pageNum");
	
	//글번호, 글쓴이, 비밀번호, 제목, 내용 저장(액션태그)
	%>
	<jsp:useBean id="bb" class="com.member.BoardBean" />
	<jsp:setProperty property="*" name="bb"/>
	<%
	
	System.out.println("@@@@@pro:수정할 정보->"+bb);
	 BoardDAO bdao=new BoardDAO();
	 int check=bdao.updateBoard(bb);
	
	 System.out.println("pro: 수정정보 check->"+check);
	 
	 //결과에 따라 페이지 이동
	 if(check==1){
	%>
	<script type="text/javascript">
	alert("수정 성공!");
	location.href="../index2.jsp?pageNum=<%=pageNum%>";
	
	</script>
	<%}else if(check==0){ %>
	<script type="text/javascript">
	alert("비밀번호 오류");
	history.back();
	</script>
	<%}else{ %>
	<script type="text/javascript">
	alert("게시글 없음");
	history.back();
	</script>
	<%} %>
</body>
</html>