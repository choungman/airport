<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="scheduleBean" class="admin.ScheduleBean" scope="page"/>
	<jsp:setProperty name="scheduleBean" property="*"/>
	<jsp:useBean id="insertSchedule" class="admin.ScheduleMgr" scope="page"/>

	<%
		insertSchedule.scheduleInsert(scheduleBean);
		response.sendRedirect("schedule_manage.jsp");
	%>