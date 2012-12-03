<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- CSS Reset -->
    	<link rel="stylesheet" type="text/css" href="./css/myResetStyle.css" />
    	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts-grids/reset-fonts-grids.css" />
	    <!-- My CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/myStyle.css" />
	</head>
	<body>
		<form method="post" action="./writeBoardAction.do?boardName=<%= request.getParameter("boardName") %>">
			<div id="board_menu">
				<input type="submit" value="등록" /> <input type="button" value="목록보기" onclick="window.location.href='./boardDisplayAction.do?boardName=<%= request.getParameter("boardName") %>&page=1'" />
			</div>
			<div id="write_board_form">
				<div class="row">
					<div class="title">제목</div>
					<div class="title_text"><input type="text" name="title" /></div>
				</div>
				<div class="row">
					<div class="writer">작성자</div>
					<div class="writer_text"><input type="text" name="writer" /></div>
				</div>
				<div class="row">
					<div class="password">비밀번호</div>
					<div class="password_text"><input type="password" name="password" /></div>
				</div>
				<div class="row">
					<div class="contents">내용</div>
					<div class="contents_text"><textarea name="contents"></textarea></div>
				</div>
			</div>
		</form>
	</body>
</html>