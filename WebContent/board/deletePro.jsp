<%@page import="com.member.BoardDAO"%>
<%@page import="com.member.BoardBean"%>
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
	
	BoardBean bb=new BoardBean();
	bb.setNum(Integer.parseInt(request.getParameter("num")));
	bb.setPass(request.getParameter("pass"));
	
	System.out.println("pro(삭제할 번호, 비밀번호) :"+bb.toString());
	
	BoardDAO dbao=new BoardDAO();
	int check=dbao.deleteBoard(bb);
	
	if(check==1){
	
	%>
		<script type="text/javascript">
			alert("글 삭제 완료!");
			location.href="../index2.jsp?pageNum=<%=pageNum%>";
			</script>
			<%
		}else if(check==0){
			%>
			<script type="text/javascript">
			alert("글 삭제 오류:비밀번호 오류");
			history.back();
			
			</script>
			<%
		}else{ //check==-1;
			%>
			<script type="text/javascript">
			alert("글 삭제 오류: 게시글 오류");
			history.back();
			
			</script>
			<%
		}
		
		
	%>
</body>
</html>