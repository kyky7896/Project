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
    String name = request.getParameter("name");
    String msg = request.getParameter("msg");
    String filename = request.getParameter("filename");
    String OFileName = request.getParameter("oFileName");
  
  %>
  
  
  <h2> 파일 업로드 확인 & 다운로드 </h2>
  
  <h3>이름 : <%=name %> </h3>
  <h3>메세지 : <%=msg %> </h3>
  <h3>파일이름 :
     <a href="filedown.jsp?filename=<%=filename%>"><%=filename %></a>
  </h3>
   <h3>파일이름(upload) :
     <a href="../upload/<%=filename%>"><%=filename %></a>
  </h3>
  <h3>원본파일이름 : <%=OFileName %></h3>

</body>
</html>