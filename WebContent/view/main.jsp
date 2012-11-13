<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BetWin</title>
		<!-- CSS Reset -->
    	<link rel="stylesheet" type="text/css" href="./css/myResetStyle.css">
    	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts-grids/reset-fonts-grids.css">
	    <!-- Layout CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/layout.css" />
	    <!-- My CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/myStyle.css" />
	</head>
	<body>
		<% 
			String page_name;
			if(request.getParameter("page") != null){
				page_name = request.getParameter("page");
			}
			else{
				page_name = "main";
			}
			String url = "./contents/"+page_name+".jsp";
		%>
		<div id="wrap">
			<div id="top"><jsp:include page="./top.jsp" /></div>
			<div id="center"><jsp:include page="<%= url %>" /></div>
			<div id="bottom"><jsp:include page="./bottom.jsp" /></div>
		</div>
	</body>
</html>