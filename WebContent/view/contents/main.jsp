<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>main page</title>
		<!-- CSS Reset -->
    	<link rel="stylesheet" type="text/css" href="./css/myResetStyle.css">
    	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts-grids/reset-fonts-grids.css">
	    <!-- Layout CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/layout.css" />
	    <!-- My CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/myStyle.css" />
	</head>
	<body>
		<div id="main_wrap">
			<div class="left">
<%
				if(session.getAttribute("ID") == null) {
%>
					<div class="login_form">
						<form method="post" action="../model/login.jsp">
							<table>
								<tr>
									<th>ID : </th>
									<td><input type="text" name="id" /></td>
									<td rowspan="2"><input type="submit" value="로그인" /></td>
								</tr>
								<tr>
									<th>PW : </th>
									<td><input type="password" name="password" /></td>
								</tr>
								<tr>
									<td colspan="3">
										<input type="button" value="회원가입" onclick="location.href='./main.jsp?page=join_member'" />
										<input type="button" value="ID/PW찾기" />
									</td>
								</tr>
							</table>
						</form>
					</div>
<%
				}
				else {
%>
					<div class="logout_form">
						<form method="post" action="../model/logout.jsp">
							<table>
								<tr>
									<th colspan="2"><%= session.getAttribute("nickName") %>님 환영합니다</th>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="로그아웃" /></td>
								</tr>
							</table>
						</form>
					</div>
<%
				}
%>
				<div class="quick_nav">
					<ul>
						<li>캐쉬충전</li>
						<li>서비스소개</li>
					</ul>
				</div>
				<div class="banner">
					<ul>
						<li>배너1</li>
						<li>배너2</li>
					</ul>
				</div>
			</div>
			<div class="center">
				<div class="game_information">
					<div class="new_game">
						<table>
							<thead>
								<tr>
									<th>게임종류</th>
									<th>발매회차</th>
									<th>발표일</th>
									<th>적중결과</th>
								</tr>
							<thead>
							<tbody>
								<tr>
									<td>프로토 승부식</td>
									<td>12년 104회차</td>
									<td>12-11-02</td>
									<td>-</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="new_livescore">
						라이브스코어
					</div>
				</div>
				<div class="hot_news">
					핫뉴스<input type="text" value="뉴스어쩌고저쩌고" readonly />
				</div>
			</div>
		</div>
	</body>
</html>