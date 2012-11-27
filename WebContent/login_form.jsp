<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("id") == null) {
%>
		<div class="login_form">
			<h3 class="headerbar"><span class="title">로그인</span></h3>
			<form method="post" action="./loginAction.do">
				<table style="padding:10px;">
					<tr>
						<th>ID : </th>
						<td><input type="text" name="id" tabindex="1" /></td>
						<td rowspan="2"><input type="submit" value="로그인" tabindex="3" class="login_button" /></td>
					</tr>
					<tr>
						<th>PW : </th>
						<td><input type="password" name="password" tabindex="2" /></td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="checkbox" name="login_option" value="maintain" /> 아이디 저장
							<input type="checkbox" name="login_option" value="security" /> 보안 접속
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="button" value="회원가입" onclick="location.href='./moveJoinMember.do'" class="formbutton" />
							<input type="button" value="ID/PW찾기" class="formbutton" />
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
			<form method="post" action="./logoutAction.do">
				<table>
					<tr>
						<th colspan="2"><%= session.getAttribute("name") %>님 환영합니다</th>
					</tr>
					<tr>									
						<td colspan="2">
							<input type="submit" value="로그아웃" class="formbutton" />
<%
							if(session.getAttribute("name") != null){
								String name = (String)session.getAttribute("name");
								if(name.equals("관리자")){
%>	
									<input type="button" value="관리자메뉴" class="formbutton" />
<%
								}
							}
%>
						</td>
					</tr>
				</table>
			</form>
		</div>
<%
	}
%>