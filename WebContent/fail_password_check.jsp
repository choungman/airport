<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		비밀번호가 틀렸습니다 비밀번호를 다시 확인후 시도해주십시오
		<input type="button" value="목록보기" onclick="window.location.href='./boardDisplayAction.do?boardName=<%= request.getParameter("boardName") %>&page=1'" />
	</body>
</html>