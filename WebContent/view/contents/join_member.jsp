<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입페이지</title>
	</head>
	<body>
		<div id="join_member_wrap">
			<div class="provision">
				<textarea cols="50" rows="10" readonly>개인정보 이용 어쩌구 저쩌구</textarea>
				<br/>
				<input type="checkbox" name="agree" value="agree" />약관에 동의합니다
			</div>
			<div class="form">
				<form method="post" action="../model/insert_member.jsp">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" /><input type="button" value="중복확인" /></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><input type="text" name="nickName" /><input type="button" value="중복확인" /></td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="password" name="password" /></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email"/></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" size="3" name="phone1" />-<input type="text" size="4" name="phone2" />-<input type="text" size="4" name="phone3" /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="address" /></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="회원가입" /><input type="reset" value="취소" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</body>
</html>