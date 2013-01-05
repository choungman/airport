<%@ page import="java.sql.*,java.util.*,admin.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/adminStyle.css" />

<title>관리자 메뉴 - 예약 관리</title>
</head>
<body>
	<jsp:useBean id="ReserveMgr" class="admin.ReserveMgr" scope="page" />
	<jsp:useBean id="MemberMgr" class="admin.MemberMgr" scope="page" />
	<jsp:useBean id="ScheduleMgr" class="admin.ScheduleMgr" scope="page" />
	<jsp:useBean id="CustomerMgr" class="admin.CustomerMgr" scope="page" />
	<jsp:useBean id="AirportListMgr" class="admin.AirportListMgr"
		scope="page" />
	<jsp:useBean id="AirplaneMgr" class="admin.AirplaneMgr" scope="page" />

	<div id="wrap">
		<%@ include file="../admin_top.jsp"%>
		<div id="body">
			<table border="1">
				<tr>
					<th>고객 번호</th>
					<th>회원ID</th>
					<th value="3">스케쥴번호</th>
					<th>출발일시</th>
					<th>게이트번호</th>
					<th>요금</th>
					<th>출발공항</th>
					<th>도착공항</th>
					<th>고객이름</th>
					<th>항공기이름</th>
					<th>좌석번호</th>
					<th>좌석등급</th>
				</tr>

				<%
					Vector vlist = ReserveMgr.getReserveList();

					for (int i = 0; i < vlist.size(); i++) {
						ReserveBean rb = (ReserveBean) vlist.elementAt(i);
				%>
				<tr>
					<td><%=rb.getCustomerNumber()%></td>
					<td><%=rb.getId()%></td>
					<td><%=rb.getScheduleNumber()%></td>
					<td><%=rb.getDepartureDate()%></td>
					<td><%=rb.getGateNumber()%></td>
					<td><%=rb.getFee()%></td>
					<td><%=rb.getDepartureAirport()%></td>
					<td><%=rb.getArriveAirport()%></td>
					<td><%=rb.getCustomerName()%></td>
					<td><%=rb.getAirplaneName()%></td>
					<td><%=rb.getSeatingNumber()%></td>
					<td><%=rb.getSeatingGrade()%></td>

				</tr>
				<%
					}
				%>
				<FORM action="reserve_insert.jsp" method="post">
					<tr>
						<td><select name="customerNumber">
								<%
									Vector vlist0 = CustomerMgr.getCustomerList();

									for (int i = 0; i < vlist0.size(); i++) {
										CustomerBean cb = (CustomerBean) vlist0.elementAt(i);
								%>
								<option><%=cb.getCustomerNumber()%></option>
								<%
									}
								%>
						</select></td>
						<td><select name="id">
								<%
									Vector vlist1 = MemberMgr.getMemberList();

									for (int i = 0; i < vlist1.size(); i++) {
										MemberBean mb = (MemberBean) vlist1.elementAt(i);
								%>
								<option><%=mb.getID()%></option>
								<%
									}
								%>
						</select></td>
						<td><select name="scheduleNumber">
								<%
									Vector vlist2 = ScheduleMgr.getScheduleList();

									for (int i = 0; i < vlist2.size(); i++) {
										ScheduleBean sb = (ScheduleBean) vlist2.elementAt(i);
								%>
								<option><%=sb.getScheduleNumber()%></option>
								<%
									}
								%>
						</select></td>
						<td><input type="text" name="departureDate"></td>
						<td><input type="text" name="gateNumber"></td>
						<td><input type="text" name="fee"></td>
						<td><select name="departureAirport">
								<%
									Vector vlist3 = AirportListMgr.getAirportList();

									for (int i = 0; i < vlist3.size(); i++) {
										AirportListBean sb = (AirportListBean) vlist3.elementAt(i);
								%>
								<option><%=sb.getAirportName()%></option>
								<%
									}
								%>
						</select></td>
						<td><select name="arriveAirport">
								<%
									for (int i = 0; i < vlist3.size(); i++) {
										AirportListBean sb = (AirportListBean) vlist3.elementAt(i);
								%>
								<option><%=sb.getAirportName()%></option>
								<%
									}
								%>
						</select></td>
						<td><select name="customerName">
								<%
									for (int i = 0; i < vlist0.size(); i++) {
										CustomerBean cb = (CustomerBean) vlist0.elementAt(i);
								%>
								<option><%=cb.getCustomerName()%></option>
								<%
									}
								%>
						</select></td>
						<td><select name="airplaneName">
								<%
									Vector vlist4 = AirplaneMgr.getAirplaneList();

									for (int i = 0; i < vlist4.size(); i++) {
										AirplaneBean cb = (AirplaneBean) vlist4.elementAt(i);
								%>
								<option><%=cb.getAirplaneName()%></option>
								<%
									}
								%>
						</select></td>
						<td><input type="text" name="seatingNumber"></td>
						<td><input type="text" name="seatingGrade"></td>

						<td colspan="2"><input type="submit" value="등록"></td>
					</tr>

				</FORM>
			</table>
		</div>
	</div>
</body>
</html>