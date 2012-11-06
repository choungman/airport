<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>슬라이드</title>    
		
		<script type="text/javascript" src="./javascript/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="./javascript/jquery-ui-1.9.0.custom.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#slide_image").css('background-repeat', 'no-repeat');
				for(var i=1; i<=5; i++){
					$("#slide_number ul").append("<li><img src='./images/slide/image"+i+".jpg'></li>");
				}
				$("#slide_number ul li img").eq(0).css('border', '3px solid white');
				change_image(1);
			});

			var num_image = 5; //이미지 갯수
			function change_image(num){

				$("#slide_image").css('background-image', 'url(./images/slide/image'+num+'.jpg)');
				for(var i=0; i<num_image; i++){
					$("#slide_number ul li img").eq(i).css('border', 'none');
				}
					$("#slide_number ul li img").eq(num-1).css('border', '3px solid white');
				$("#slide_image").hide();
				$("#slide_image").fadeIn(1000);
				setTimeout(function(){$("#slide_image").fadeOut(1000);}, 6000);
				if(num < num_image){
					num++;
				}
				else{
					num = 1;
				}
				setTimeout("change_image("+num+")", 7000);
			}
				

		</script>
		<style type="text/css">
			#slide{
			position:relative;
			width:470px;
			height:310px;
			}
			#slide_image{
			width:470px;
			height:310px;
			}
			#slide_number{
			position:absolute;
			bottom:10px;
			right:10px;
			}
			#slide_number ul li{
			float:left;
			padding-left:10px;
			list-style:none;
			font-weight:bold;
			}
			#slide_number ul li img{
			width:50px;
			height:50px;
			}
		</style>
	</head>
	<body>
		<div id="slide">
			<div id="slide_image"></div>
			<div id="slide_number">
				<ul>
				</ul>
			</div>
		</div>
	</body>
</html>