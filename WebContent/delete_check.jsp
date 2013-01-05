<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 삭제하기</title>
		<!-- CSS Reset -->
    	<link rel="stylesheet" type="text/css" href="./css/myResetStyle.css" />
    	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts-grids/reset-fonts-grids.css" />
	    <!-- My CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/myStyle.css" />
	</head>
	<body>
		<form method="post" action="./deleteBoardAction.do?boardName=<%= request.getParameter("boardName") %>&index=<%= request.getParameter("index") %>">
			<div id="board_menu">
				<input type="button" value="목록보기" onclick="window.location.href='./boardDisplayAction.do?boardName=<%= request.getParameter("boardName") %>&page=1'" />
			</div>
			<div id="password_check_form">
				<div class="row">
					<div class="password">비밀 번호</div>
					<div class="password_text"><input type="password" name="password" /> <input type="submit" value="확인" /></div>
				</div>
			</div>
		</form>
	</body>
</html>