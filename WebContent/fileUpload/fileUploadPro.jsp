<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String uploadPath=request.getRealPath("/upload");
	System.out.println("업로드 경로:"+uploadPath);
	
	//업로드 파일 크기 지정
	int fileSize=10*1024*1024;
	
	//파일 업로드 => 파일 업로드 객체 생성
	MultipartRequest multi
						=new MultipartRequest(
								request,
								uploadPath,
								fileSize,
								"UTF-8",
								new DefaultFileRenamePolicy()
								);
	System.out.println("파일 업로드 완료!");
	
	String name=multi.getParameter("name");
	String msg=multi.getParameter("msg");
	String filename=multi.getFilesystemName("filename");
	String oFileName=multi.getOriginalFileName("filename");
%>
	<h3>name : <%=name %></h3>
		<h3>msg : <%=msg %></h3>
	<h3>filename : <%=filename %></h3>
	<h3>oFilename : <%=oFileName %></h3>
	
	<form action="fileCheck.jsp" method="post">
		<input type="hidden" name="name" value="<%=name%>">
		<input type="hidden" name="msg" value="<%=msg%>">
		<input type="hidden" name="filename" value="<%=filename%>">
		<input type="hidden" name="oFileName" value="<%=oFileName%>">
		<input type="submit" value="확인 페이지 이동">
	</form>
	
</body>
</html>