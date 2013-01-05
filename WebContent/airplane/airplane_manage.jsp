<%@ page import="java.sql.*,java.util.*,admin.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/adminStyle.css" />

<title>관리자 메뉴 - 항공기 관리</title>
</head>
<body>
	<jsp:useBean id="airplaneMgr" class="admin.AirplaneMgr" scope="page" />
	<div id="wrap">

		<%@ include file="../admin_top.jsp"%>
		<div id="body">
			<table border="1">
				<tr>
					<th>항공기 번호</th>
					<th>항공기이름</th>
					<th>항공사</th>
					<th>좌석수</th>
				</tr>

				<%
					Vector vlist = airplaneMgr.getAirplaneList();

					for (int i = 0; i < vlist.size(); i++) {
						AirplaneBean apb = (AirplaneBean) vlist.elementAt(i);
				%>
				<tr>
					<td><%=apb.getAirplaneNumber()%></td>
					<td><%=apb.getAirplaneName()%></td>
					<td><%=apb.getAirline()%></td>
					<td><%=apb.getSeating()%></td>
				</tr>
				<%
					}
				%>
				<FORM action="airplane_insert.jsp" method="post">

					<tr>
						<td><input type="text" name="airplaneNumber"></td>
						<td><input type="text" name="airplaneName"></td>
						<td><input type="text" name="airline"></td>
						<td><input type="text" name="seating"></td>
						<td colspan="2"><input type="submit" value="등록"></td>
					</tr>

				</FORM>

			</table>
		</div>
	</div>
</body>
</html>