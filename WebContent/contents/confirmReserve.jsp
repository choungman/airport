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
		<th></th>
	</tr>
<%
	for(int i=0; i<list.size(); i++) {
		ReservationBean bean = list.get(i);
%>
	<tr>
		<th><%= bean.getDepartureDate() %></th>
		<th><%= bean.getGate() %></th>
		<th><%= bean.getDeparture() %></th>
		<th><%= bean.getDestination() %></th>
		<th><%= bean.getCustomerName() %></th>
		<th><%= bean.getAirplainName() %></th>
		<th><%= bean.getSeatNumber() %></th>
		<th><%= bean.getGrade() %></th>
		<th><input type="button" value="티켓출력" /> <input type="button" value="예약취소" /></th>
	</tr>
<%
	}
%>
</table>