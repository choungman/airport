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
					<li><a href="./moveChargeCash.do">게임머니충전</a></li>
					<li><a href="./moveHelp.do">서비스소개</a></li>
<%
				}
				else if(mainNum.equals("2")) {
%>
					<li><a href="./moveGameList.do">구매가능게임보기</a></li>
					<li><a href="./moveFinishedGame.do">마감게임보기</a></li>
					<li><a href="./moveGameSchedule.do">게임일정</a></li>
					<li><a href="./moveResult.do">적중결과</a></li>
<%
				}
				else if(mainNum.equals("3")) {
%>
					<li><a href="./moveInfoSoccer.do">축구</a></li>
					<li><a href="./moveInfoBaseball.do">야구</a></li>
					<li><a href="./moveInfoBasketball.do">농구</a></li>
					<li><a href="./moveInfoVolleyball.do">배구</a></li>
<%
				}
				else if(mainNum.equals("4")) {
%>
					<li><a href="./moveDiscussionBoard.do">토론게시판</a></li>
					<li><a href="./moveFreeBoard.do">자유게시판</a></li>
					<li><a href="./moveQandABoard.do">Q&A게시판</a></li>
					<li><a href="./moveAnalysisBoard.do">경기분석게시판</a></li>
<%
				}
				else if(mainNum.equals("5")) {
%>
					<li><a href="./moveGameList.do">나의배팅현황</a></li>
					<li><a href="./moveView2-2.do">회원정보수정</a></li>
					<li><a href="./moveView2-2.do">구매적중내역</a></li>
					<li><a href="./moveView2-2.do">캐쉬충전/출금</a></li>
<%
				}
				else if(mainNum.equals("6")) {
%>
					<li><a href="./moveView2-2.do">가상배팅</a></li>
<%
				}
			}
%>
		</ul>
	</div>	