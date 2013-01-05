<%@ page import="java.sql.*,java.util.*,admin.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/adminStyle.css" />
<title>관리자 메뉴 - 회원정보 관리</title>
</head>
<body>
	<jsp:useBean id="memberMgr" class="admin.MemberMgr" scope="page" />
	<div id="wrap">

		<%@ include file="../admin_top.jsp"%>
		<div id="body">
			<table border="1">
				<tr>
					<th>ID</th>
					<th>PASSWORD</th>
					<th>이름</th>
					<th>주민번호</th>
					<th>블랙리스트</th>
				</tr>

				<%
					Vector vlist = memberMgr.getMemberList();

					for (int i = 0; i < vlist.size(); i++) {
						MemberBean mb = (MemberBean) vlist.elementAt(i);
				%>

				<tr>
					<td><%=mb.getID()%></td>
					<td><%=mb.getPassword()%></td>
					<td><%=mb.getName()%>
					<td><%=mb.getSsn()%></td>
					<td><%=mb.getBlackList()%></td>
				</tr>
				</FORM>
				<%
					}
				%>
				<FORM action="member_insert.jsp" method="post">

					<tr>
						<td><input type="text" name="ID"></td>
						<td><input type="text" name="password"></td>
						<td><input type="text" name="name"></td>
						<td><input type="text" name="ssn"></td>
						<td><select name="blackList">
								<option value="X">X</option>
								<option value="O">O</option>
						</select></td>
						<td colspan="2"><input type="submit" value="등록"></td>
					</tr>

				</FORM>

			</table>
		</div>
	</div>
</body>
</html>