<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="beans.*" %>
<%
	BoardBean bean = (BoardBean)request.getAttribute("modifyContents");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글쓰기</title>
		<!-- CSS Reset -->
    	<link rel="stylesheet" type="text/css" href="./css/myResetStyle.css" />
    	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts-grids/reset-fonts-grids.css" />
	    <!-- My CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/myStyle.css" />
	</head>
	<body>
		<form method="post" action="./modifyBoardAction.do?boardName=<%= request.getParameter("boardName") %>&index=<%= request.getParameter("index") %>">
			<div id="board_menu">
				<input type="submit" value="등록" /> <input type="button" value="목록보기" onclick="window.location.href='./boardDisplayAction.do?boardName=<%= request.getParameter("boardName") %>&page=1'" />
			</div>
			<div id="write_board_form">
				<div class="row">
					<div class="title">제목</div>
					<div class="title_text"><input type="text" name="title" value="<%= bean.getTitle() %>" /></div>
				</div>
				<div class="row">
					<div class="writer">작성자</div>
					<div class="writer_text"><input type="text" name="writer" value="<%= bean.getWriter() %>" /></div>
				</div>
				<div class="row">
					<div class="contents">내용</div>
					<div class="contents_text"><textarea name="contents"><%= bean.getContents() %></textarea></div>
				</div>
			</div>
		</form>
	</body>
</html>