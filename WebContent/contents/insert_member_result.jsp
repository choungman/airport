<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="insert_member_wrap">
<%
	if(session.getAttribute("id") == null) {
%>
		<div class="title">
			<span>airLINE의 회원가입을 환영합니다</span>
		</div>
		<div class="contents">
			<span class="bold">
				MyoungJi 항공예약 사이트 회원으로 가입해 주셔서 감사합니다<br/><br/>
			</span>
			<span>
				이제 MyoungJi airLINE 다양한 서비스들을 동일한 로그인후 편리하게 이용하실수 있습니다.<br/>
				항상 최선의 서비스를 다하도록 노력하겠습니다. 감사합니다<br/>
			</span>
		</div>
<%
	}
	else {
%>
		<script>window.location.href="./moveHome.do";</script>
<%
	}
%>
</div>