<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.*" import="java.util.*" %>
<%
	ArrayList<ReservationBean> list = new ArrayList<ReservationBean>();
	list = (ArrayList<ReservationBean>)request.getAttribute("confirmReserveList");
%>
<h2 style="font-size:15px; font-weight:bold; color:blue; padding:5px 0;">나의 예약내역</h2>
<table class="my_table1">
	<tr>
		<th>출발일시</th>
		<th>게이트번호</th>
		<th>출발공항</th>
		<th>도착공항</th>
		<th>고객이름</th>
		<th>항공기이름</th>
		<th>좌석번호</th>
		<th>좌석등급</th>
		<th>출력/관리</th>
	</tr>
<%
	for(int i=0; i<list.size(); i++) {
		ReservationBean bean = list.get(i);
%>
	<tr>
		<td><%= bean.getDepartureDate().substring(0, 19) %></td>
		<td><%= bean.getGate() %></td>
		<td><%= bean.getDeparture() %></td>
		<td><%= bean.getDestination() %></td>
		<td><%= bean.getCustomerName() %></td>
		<td><%= bean.getAirplainName() %></td>
		<td><%= bean.getSeatNumber() %></td>
		<td><%= bean.getGrade() %></td>
		<td><input type="button" value="티켓출력" class="formbutton" /> <input type="button" value="예약취소" class="formbutton" onclick="if(confirm('정말 예약 취소하시겠습니까?')) {
		window.location.href='./deleteReservationAction.do?customerNumber=<%= bean.getCustomerNumber() %>&id=<%= bean.getId() %>&scheduleNumber=<%= bean.getScheduleNumber() %>';
	}" /></td>
	</tr>
<%
	}
%>
</table>