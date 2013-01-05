<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="beans.*" %>
<%
	BoardBean bean = (BoardBean)request.getAttribute("boardContents");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글내용 보기</title>
		<!-- CSS Reset -->
    	<link rel="stylesheet" type="text/css" href="./css/myResetStyle.css" />
    	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts-grids/reset-fonts-grids.css" />
	    <!-- My CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/myStyle.css" />
	</head>
	<body>
		<div id="board_menu">
			<input type="button" value="목록보기" onclick="window.location.href='./boardDisplayAction.do?boardName=<%= request.getParameter("boardName") %>&page=1'" />
			<input type="button" value="수정" onclick="window.location.href='./moveModifyCheck.do?boardName=<%= request.getParameter("boardName") %>&index=<%= request.getParameter("index") %>'" />
			<input type="button" value="삭제" onclick="window.location.href='./moveDeleteCheck.do?boardName=<%= request.getParameter("boardName") %>&index=<%= request.getParameter("index") %>'"  />
		</div>
		<div id="view_content">
			<div class="title_bar">
				<div class="row">
					<div class="title"><span class="bold"><%= bean.getTitle() %></span></div>
					<div class="regid"><%= bean.getWriter() %></div>
					<div class="date"><%= bean.getDate().substring(0, 10) %></div>
				</div>
			</div>

			<div class="content"> 
				<div class="row">
					<div class="contents"><%= bean.getContents() %></div>
				</div>
			</div>
		</div>
	</body>
</html>