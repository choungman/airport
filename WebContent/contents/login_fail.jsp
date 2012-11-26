<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="login_fail_wrap">
	<span class="red">아이디 혹은 비밀번호가 일치하지 않습니다.확인후 다시 시도해주세요.</span>
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