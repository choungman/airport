<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="beans.*" import="java.util.*" %>
<%
	ArrayList<ScheduleBean> list = new ArrayList<ScheduleBean>(); 
	ArrayList<ScheduleBean> list2 = new ArrayList<ScheduleBean>(); 
	list = (ArrayList<ScheduleBean>)request.getAttribute("scheduleList");
	list2 = (ArrayList<ScheduleBean>)request.getAttribute("scheduleList2");
	int people = (Integer)request.getAttribute("people");
	String seat = (String)request.getAttribute("seat");
	String adult = (String)request.getAttribute("adult");
	String child = (String)request.getAttribute("child");
	String toddler = (String)request.getAttribute("toddler");
%>
<span class="red">검색 결과가 없을 시 표시 되지 않습니다</span>
<br/><br/>
<span class="red">예약할 비행기의 체크를 정확히 해주세요</span>
<h2 style="font-size:15px; font-weight:bold; color:blue; padding:5px 0;">가는 항공편</h2>
<form method="post" action="./moveReservation.do">
<table class="my_table1">
	<tr>
		<th>항공사</th>
		<th>편명</th>
		<th>운행시간</th>
		<th>잔여좌석</th>
		<th>예약</th>
	</tr>
<%
	if(list.size() != 0) {
%>
		<tr>
<%
		for(int i=0; i<list.size(); i++) {
			ScheduleBean bean = list.get(0);
%>
				<td><%= bean.getAirport() %></td>
				<td><%= bean.getAirplainName() %></td>
				<td><%= bean.getDepartureDate() %></td>
				<td><%= bean.getSeat() %></td>
				<td><input type="radio" name="schedule_num1" value="<%= bean.getScheduleNumber() %>"></td>
<%
		}
%>
		</tr>
<%
	}
%>
</table>

<h2 style="font-size:15px; font-weight:bold; color:blue; padding:5px 0;">오는 항공편</h2>
<table class="my_table1">
	<tr>
		<th>항공사</th>
		<th>편명</th>
		<th>운행시간</th>
		<th>잔여좌석</th>
		<th>예약</th>
	</tr>
<%
	if(list2.size() != 0) {
%>
		<tr>
<%
		for(int i=0; i<list2.size(); i++) {
			ScheduleBean bean = list2.get(0);
%>
				<td><%= bean.getAirport() %></td>
				<td><%= bean.getAirplainName() %></td>
				<td><%= bean.getDepartureDate() %></td>
				<td><%= bean.getSeat() %></td>
				<td><input type="radio" name="schedule_num2" value="<%= bean.getScheduleNumber() %>"></td>
<%
		}
%>
		</tr>
<%
	}
%>
</table>

	<input type="submit" value="예약하기" class="formbutton" />
	<input type="hidden" name="people" value="<%= people %>" />
	<input type="hidden" name="seat" value="<%= seat %>" />
	<input type="hidden" name="adult" value="<%= adult %>" />
	<input type="hidden" name="child" value="<%= child %>" />
	<input type="hidden" name="toddler" value="<%= toddler %>" />
</form>