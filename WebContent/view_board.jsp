<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="beans.*"  %>
<% 
	int pageNum;
	if(request.getParameter("page") != null) {
		pageNum = Integer.parseInt(request.getParameter("page"));
	}
	else {
		pageNum = 1;
	}
	String boardName = (String)request.getAttribute("boardName");
	ArrayList<BoardBean> list = (ArrayList<BoardBean>)request.getAttribute("boardList");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 화면입니다</title>
		<!-- CSS Reset -->
    	<link rel="stylesheet" type="text/css" href="./css/myResetStyle.css" />
    	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts-grids/reset-fonts-grids.css" />
	    <!-- My CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/myStyle.css" />
	        
	    <!-- Jquery -->
	    <script src='./js/jquery-1.7.2.js'></script>
		<script type="text/javascript">
			$(document).ready(function(){
<%
				if(pageNum == 1) {
%>
					$('#page_nav a').eq(1).addClass('selected');
<%
				}
				else if(pageNum == 2) {
%>
					$('#page_nav a').eq(2).addClass('selected');
<%
				}
				else {
%>
					$('#page_nav a').eq(3).addClass('selected');
<%
				}
%>
			});
		</script>
	</head>
	<body>
		<div id="borad_wrap">
			<div id="board_menu">
				<input type="button" value="글쓰기" onclick="window.location.href='./moveWriteBoard.do?boardName=<%= boardName %>'"/>
			</div>
			<div id="board_list">
				<div class="title_bar">
					<div class="row">
						<div class="number">번호</div>
						<div class="title">제목</div>
						<div class="regid">작성자</div>
						<div class="date">날짜</div>
						<div class="click_count">조회수</div>
					</div>
				</div>
	
				<div class="content"> 
<%
					for(int i = 0; i < list.size(); i++) {
						BoardBean bean = new BoardBean();
						bean = list.get(i);
						String date = bean.getDate().substring(0, 10);
						String title = bean.getTitle();
						if(bean.getTitle().length() > 25) {
							title = bean.getTitle().substring(0, 25) + "...";
						}
						String writer = bean.getWriter();
						if(bean.getWriter().length() > 4) {
							writer = bean.getWriter().substring(0, 4) + "..";
						}
%>	
						<div class="row">
							<div class="number"><%= bean.getIndex() %></div>
							<div class="title"><a href="ContentsDisplayAction.do?boardName=<%= boardName %>&index=<%= bean.getIndex() %>"><%= title %></a></div>
							<div class="regid"><%= writer %></div>
							<div class="date"><%= date %></div>
							<div class="click_count"><%= bean.getClickCount() %></div>
						</div>
<%
					}
%>			
				</div>
			</div>
			<div id="page_nav">
<%
				if(pageNum == 1) {
%>
					<a href="#" class="direction"><span>&lsaquo;</span>이전</a>
<%				
				}
				else {
%>
					<a href="./boardDisplayAction.do?boardName=<%= boardName %>&page=<%= pageNum - 1 %>" class="direction"><span>&lsaquo;</span>이전</a>
<%
				}

				if(pageNum != 1 && pageNum != 2) {
%>
					<a href="./boardDisplayAction.do?boardName=<%= boardName %>&page=<%= pageNum - 2 %>"><%= pageNum - 2 %></a>
<%
				}
				if(pageNum != 1) {
%>
					<a href="./boardDisplayAction.do?boardName=<%= boardName %>&page=<%= pageNum - 1 %>"><%= pageNum - 1 %></a>
<%
		
				}
%>
					<a href="./boardDisplayAction.do?boardName=<%= boardName %>&page=<%= pageNum %>"><%= pageNum %></a>
					<a href="./boardDisplayAction.do?boardName=<%= boardName %>&page=<%= pageNum + 1 %>"><%= pageNum + 1 %></a>
					<a href="./boardDisplayAction.do?boardName=<%= boardName %>&page=<%= pageNum + 2 %>"><%= pageNum + 2 %></a>
<%
				if(pageNum == 1 || pageNum == 2) {
%>
					<a href="./boardDisplayAction.do?boardName=<%= boardName %>&page=<%= pageNum + 3 %>"><%= pageNum + 3 %></a>				
<%
				}
				if(pageNum == 1) {
%>
					<a href="./boardDisplayAction.do?boardName=<%= boardName %>&page=<%= pageNum + 4 %>"><%= pageNum + 4 %></a>				
<%
				}
%>
				<a href="./boardDisplayAction.do?boardName=<%= boardName %>&page=<%= pageNum + 1 %>" class="direction">다음 <span>&rsaquo;</span></a>
			</div>
		</div>
	</body>
</html>