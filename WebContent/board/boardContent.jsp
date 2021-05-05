<%@page import="com.member.BoardBean"%>
<%@page import="com.member.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style type="text/css">
body {
	line-height: 2em;
	font-family: "맑은 고딕";
}

ul, li {
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
}

#mainWrapper {
	width: 800px;
	margin: 0 auto; /*가운데 정렬*/
}

#mainWrapper>ul>li:first-child {
	text-align: center;
	font-size: 14pt;
	height: 40px;
	vertical-align: middle;
	line-height: 30px;
}

#ulTable {
	margin-top: 10px;
}

#ulTable>li:first-child>ul>li {
	background-color: #c9c9c9;
	font-weight: bold;
	text-align: center;
}

#ulTable>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 40px;
}

#ulTable>li>ul>li {
	float: none;
	font-size: 8-10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable>li>ul>li:first-child {
	width: 100%;
} /*No 열 크기*/

#divPaging {
	clear: both;
	margin: 0 auto;
	width: 220px;
	height: 50px;
}

#divPaging>div {
	float: left;
	width: 30px;
	margin: 0 auto;
	text-align: center;
}

#liSearchOption {
	clear: both;
}

#liSearchOption>div {
	margin: 0 auto;
	margin-top: 30px;
	width: auto;
	height: 100px;
}

.left {
	text-align: left;
}

.right {
	text-align: right;
}
</style>

</head>
<body>
	<%
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		
		BoardDAO bdao=new BoardDAO();
		bdao.updateReadCount(num);
		
		BoardBean bb=bdao.getBoard(num);
		System.out.println("pro:"+bb);
		
		String content=bb.getContent();
		if(content != null){
			content=content.replace("\r\n", "<br>");
		}
	%>
	<div id="mainWrapper">
		<ul>
			<!-- 게시판 제목 -->
			<li>글쓰기</li>

			<!-- 게시판 목록  -->
					<ul id="ulTable">
						<li>
							<ul>
								<li>게시판 본문보기</li>

							</ul>
						</li>
						<!-- 게시물이 출력될 영역 -->
						<li>
							<ul>
								<li>글번호: <%=bb.getNum() %>
								<br>
									조회수:	<%=bb.getReadcount() %>
								</li>
							</ul>
						</li>

						<li>
							<ul>
								<li>글쓴이: <%=bb.getName() %>
								<br>
									작성일: <%=bb.getDate() %>
								</li>
							</ul>
						</li>

						<li>
							<ul>
								<li>제목 : <%=bb.getSubject() %>
								</li>
							</ul>
						</li>

						<li>
							<ul>
								<li>내용 : <%=bb.getContent() %><br>
								
								</li>
							</ul>
						</li>
					</ul>
				</li>
			<div>
				<input type="button" value="수정하기"
					onclick="location.href='index5.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="삭제하기"
					onclick="location.href='index6.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="답글쓰기"
					onclick="location.href='index7.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum %>&re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
				<input type="button" value="목록으로"
					onclick="location.href='index2.jsp?pageNum=<%=pageNum%>'">
			</div>
				

			<!-- 게시판 페이징 영역 -->



		</ul>
	</div>
</body>
</html>