<%@ page import="java.sql.*,java.util.*,admin.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/adminStyle.css" />

<title>관리자 메뉴 - 스케쥴 관리</title>
</head>
<body>
	<jsp:useBean id="ScheduleMgr" class="admin.ScheduleMgr" scope="page" />
	<jsp:useBean id="AirplaneMgr" class="admin.AirplaneMgr" scope="page" />
	<jsp:useBean id="AirportListMgr" class="admin.AirportListMgr"
		scope="page" />
	<div id="wrap">

		<%@ include file="../admin_top.jsp"%>
		<div id="body">
			<table border="1">
				<tr>
					<th>스케쥴번호</th>
					<th>게이트번호</th>
					<th>출발공항</th>
					<th>출발일시</th>
					<th>도착공항</th>
					<th>도착일시</th>
					<th>항공기번호</th>
				</tr>

				<%
					Vector vlist = ScheduleMgr.getScheduleList();

					for (int i = 0; i < vlist.size(); i++) {

						ScheduleBean sb = (ScheduleBean) vlist.elementAt(i);
				%>
				<tr>
					<td><%=sb.getScheduleNumber()%></td>
					<td><%=sb.getGateNumber()%></td>
					<td><%=sb.getDepartureAirport()%></td>
					<td><%=sb.getDepartureDate()%></td>
					<td><%=sb.getArriveAirport()%></td>
					<td><%=sb.getArriveDate()%></td>
					<td><%=sb.getAirplaneNumber()%></td>
				</tr>
				<%
					}
				%>
				<FORM action="schedule_insert.jsp" method="post">
					<tr>
						<td><input type="text" name="scheduleNumber"></td>
						<td><input type="text" name="gateNumber"></td>
						<td><select name="departureAirport">
								<%
									Vector vlist2 = AirportListMgr.getAirportList();

									for (int i = 0; i < vlist2.size(); i++) {
										AirportListBean sb = (AirportListBean) vlist2.elementAt(i);
								%>
								<option><%=sb.getAirportName()%></option>
								<%
									}
								%>
						</select></td>
						<td><input type="text" name="departureDate"></td>
						<td><select name="arriveAirport">
								<%
									for (int i = 0; i < vlist2.size(); i++) {
										AirportListBean sb = (AirportListBean) vlist2.elementAt(i);
								%>
								<option><%=sb.getAirportName()%></option>
								<%
									}
								%>
						</select></td>
						<td><input type="text" name="arriveDate"></td>
						<td><select name="airplaneNumber">
								<%
									Vector vlist4 = AirplaneMgr.getAirplaneList();

									for (int i = 0; i < vlist4.size(); i++) {
										AirplaneBean sb = (AirplaneBean) vlist4.elementAt(i);
								%>
								<option><%=sb.getAirplaneNumber()%></option>
								<%
									}
								%>
						</select></td>
						<td colspan="2"><input type="submit" value="등록"></td>
					</tr>

				</FORM>
			</table>
		</div>
	</div>
</body>
</html>