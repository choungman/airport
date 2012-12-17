<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String selectedNum = null;
	if(request.getParameter("selected") != null) {
		selectedNum = request.getParameter("selected");
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Top Menu</title>
	    <script type="text/javascript">
	    	$('document').ready(function(){
	    		$('ul.semiopaquemenu li a').removeClass('selected');
<%
				if(selectedNum != null){
%>
					$('ul.semiopaquemenu li a').eq(<%= selectedNum %>-1).addClass('selected');
<%
				}
%>
	    	});
	    </script>
	</head>
	<body>
		<div id="title_image">
			<a href="./moveHome.do"><img src="./img/title.png" alt="title_image" /></a>
		</div>
		<div id="top_nav">
			<ul class="semiopaquemenu">
				<li><a href="./moveHome.do" class="selected menu1">Home</a></li>
				<li><a href="./moveFindAirplain.do" class="menu2">항공권예약</a></li>
				<li><a href="./moveNotice.do" class="menu3">공지사항</a></li>
				<li><a href="./moveBoard.do" class="menu4">커뮤니티</a></li>
				<li><a href="./moveConfirmReserve.do" class="menu5">Mypage</a></li>
				<li><a href="./moveQnA.do" class="menu6">Q&A문의</a></li>
			</ul>
			<div class="bottombar"></div>
		</div>
	</body>
</html>