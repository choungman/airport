<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mainNum = null;
	String subNum = null;
	if(request.getParameter("main") != null && request.getParameter("sub") != null){
		mainNum = request.getParameter("main");
		subNum = request.getParameter("sub");
	}
%>
	<script type="text/javascript">
		$('document').ready(function(){
			$('div.urbangreymenu ul li a').removeClass('selected');
<%
			if(subNum != null) {
%>
				$('div.urbangreymenu ul li a').eq(<%= subNum %>-1).addClass('selected');
<%
			}
%>
		});
	</script>
	<div class="urbangreymenu">
		<h3 class="headerbar"><span class="title">subMenu</span></h3>
		<ul>
<%
			if(mainNum != null){
				if(mainNum.equals("1")) { 
%>
					<li><a href="./moveHome.do" class="selected">HOME</a></li>
					<li><a href="./moveHelp.do">서비스소개</a></li>
<%
				}
				else if(mainNum.equals("2")) {		//항공기예약 서브메뉴
%>					<li><a href="./moveFindAirport.do" class="selected">항공기 검색</a></li>

<%
				}
				else if(mainNum.equals("3")) {		//공지사항 서브메뉴
%>					
					<li><a href="./moveNotice.do" class="selected">공지사항</a></li>
					
<%
				}
				else if(mainNum.equals("4")) {		//커뮤니티 서브메뉴
%>				
					<li><a href="./moveBoard.do" class="selected">자유게시판</a></li>
					
<%
				}
				else if(mainNum.equals("5")) {		//MyPage 서브메뉴
%>				
					<li><a href="./moveInfoModify.do" class="selected">회원정보수정</a></li>

<%
				}
				else if(mainNum.equals("6")) {		//Q&A 문의 서브메뉴
%>				
					<li><a href="./moveQnA.do" class="selected">Q&A</a></li>

<%
				}
			}
%>
		</ul>
	</div>	