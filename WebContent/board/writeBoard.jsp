<%@page import="com.member.BoardBean"%>
<%@page import="com.member.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Canvas</title>
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
	float: left;
	font-size: 10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable>li>ul>li:first-child {
	width: 10%;
} /*No 열 크기*/
#ulTable>li>ul>li:first-child+li {
	width: 45%;
} /*제목 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
	width: 20%;
} /*작성일 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li {
	width: 15%;
} /*작성자 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 10%;
} /*조회수 열 크기*/
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
</style>

</head>
<body>
	<%
		// DB정보를 가져와야함.
		//정보를 처리해주는 메서드를 생성 : getBoardCount()
		BoardDAO bdao = new BoardDAO();
		//DB에 글 정보가 있는지 체크
		int cnt = bdao.getBoardCount();
		System.out.println("pro:글개수" + cnt);

		// 페이징 처리 - 게시판에 보여질 글의 갯수를 페이징처리
		// 한 페이지에서 보여줄 글의 수
		int pageSize = 5;

		// 현재 페이지 정보 저장 -> 주소 + ?pageNum=2 붙여주면 다음 페이지 보여줌  
		String pageNum = request.getParameter("pageNum"); //파라미터로 넘기면 String이 됨.
		if (pageNum == null) {
			pageNum = "1";
		}

		//페이지 출력할 첫 행을 계산
		int currentPage = Integer.parseInt(pageNum); //현재페이지 정보를 숫자로 바꾼다.
		int startRow = (currentPage - 1) * pageSize + 1;

		///////////////////////////////////////////////////////////////////////

		ArrayList boardList = null;
		if (cnt != 0) {

			boardList = bdao.getBoardList(startRow, pageSize);
			System.out.println("pro:글목록 저장완료!");
		}
	%>
	<div id="mainWrapper">

		<ul>
			<!-- 게시판 제목 -->
			<li>게시판 Title</li>

			<!-- 게시판 목록  -->
			<li><br> <a class="btn btn-primary btn-sm"
				href="./index3.jsp">글쓰기 &raquo;</a></li>
				<li><br> <a class="btn btn-primary btn-sm"
				href="./index8.jsp">파일업로드 &raquo;</a></li>
				<ul id="ulTable">
					<li>
						<ul>
							<li>No</li>
							<li>제목</li>
							<li>작성일</li>
							<li>작성자</li>
							<li>조회수</li>
						</ul>
					</li>

					<%
						for (int i = 0; i < boardList.size(); i++) {
							BoardBean bb = (BoardBean) boardList.get(i);
					%>
					<!-- 게시물이 출력될 영역 -->
					<li>
						<ul>
							<li><%=bb.getNum()%></li>
							<li><!-- 답글 구현 -->

							<%
								int wid = 0;
									if (bb.getRe_lev() > 0) {
										wid = 10 * bb.getRe_lev();
									%>
									<img src="level.gif" height="10" width="<%=wid%>">
									<img src="re.gif" height="10">
									
							<% 
									}
							%>
							
							
							<a href="index4.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
									<%=bb.getSubject()%>
							</a></li>
							<li><%=bb.getDate()%></li>
							<li><%=bb.getName()%></li>
							<li><%=bb.getReadcount()%></li>
						</ul>
					</li>
					<%
						}
					%>
					<!-- 게시판 페이징 영역 -->
					<li>
						<div id="divPaging">

							<%
								if (cnt != 0) {

									//전체 페이지 수 계산하기
									int pageCount = cnt / pageSize + (cnt % pageSize == 0 ? 0 : 1);

									int pageBlock = 3;

									int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;

									int endPage = startPage + pageBlock - 1;

									if (endPage > pageCount) {
										endPage = pageCount;

									}
							%>
							<%
								if (startPage > pageBlock) {
							%>

							<a href="index2.jsp?pageNum=<%=startPage - pageBlock%>">◀ </a>
							<%
								}
							%>

							<%
								for (int i = startPage; i <= endPage; i++) {
							%>
							<a href="index2.jsp?pageNum=<%=i%>"><%=i%></a>
							<%
								}
							%>

							<%
								if (endPage < pageCount) {
							%>
							<a href="index2.jsp?pageNum=<%=startPage + pageBlock%>">▶ </a>
							<%
								}
							%>
						</div>
					</li>
					<%
						}
					%>
					<!-- 검색 폼 영역 -->
					<li id='liSearchOption'>
						<div>
							<select id='selSearchOption'>
								<option value='A'>제목+내용</option>
								<option value='T'>제목</option>
								<option value='C'>내용</option>
							</select> <input id='txtKeyWord' /> <input type='button' value='검색' />
						</div>

					</li>

				</ul>
	</div>
</body>
</html>