<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String pageName = (String)request.getAttribute("page");
	String top_url = null;
	String subMenu_url = null;
	String contents_url = null;
	if(request.getAttribute("main") != null && request.getAttribute("sub") != null) {
		String main = (String)request.getAttribute("main");
		String sub = (String)request.getAttribute("sub");
		
		top_url = "./top.jsp?selected=" + main;
		subMenu_url = "./sub_menu.jsp?main=" + main + "&sub=" + sub;
	}
	else {
		top_url = "./top.jsp";
	}
	contents_url = "./contents/" + pageName + ".jsp";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>명지항공예약시스템</title>
		<!-- CSS Reset -->
    	<link rel="stylesheet" type="text/css" href="./css/myResetStyle.css" />
    	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts-grids/reset-fonts-grids.css" />
	    <!-- Layout CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/layout.css" />
	    <!-- My CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/myStyle.css" />
	    <!-- external CSS-->
	    <link rel="stylesheet" type="text/css" href="./css/externalStyle.css" />
	    
	    <!-- Jquery -->
	    <script src='./js/jquery-1.7.2.js'></script>
	</head>
	<body>
		<div id="wrap">
			<div id="top"><jsp:include page="<%= top_url %>" /></div>
			<div id="center">
				<div id="left">
<%
					if(subMenu_url != null) {
%>
						<div id="login_form">
							<jsp:include page="./login_form.jsp" />
						</div>
						<div id="submenu">
							<jsp:include page="<%= subMenu_url %>" />
<%
					}
%>
						</div>
				</div>
				<div id="right">
					<jsp:include page="<%= contents_url %>" />
				</div>
			</div>
			<div id="bottom"><jsp:include page="./bottom.jsp" /></div>
		</div>
	</body>
</html>