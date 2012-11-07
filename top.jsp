<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Top Menu</title>
		<!-- CSS Reset -->
    	<link rel="stylesheet" type="text/css" href="./styleSheet/myResetStyle.css">
    	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts-grids/reset-fonts-grids.css">
		<!-- Bootstrap -->
		<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
		<link href="./css/bootstrap-responsive.css" rel="stylesheet">
		
	    <script type="text/javascript" src="./js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="./js/bootstrap.js"></script>
	</head>
	<body>
		<img src="./img/title.png" alt="타이틀" />
		<div class="navbar">
			<div class="navbar-inner">
				<ul class="nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Home</a></li>
					<li><a href="#">Home</a></li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							Dropdown
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">aa</a></li>
							<li><a href="#">bb</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</body>
</html>