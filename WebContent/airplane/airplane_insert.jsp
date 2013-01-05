<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="airplaneBean" class="admin.AirplaneBean" scope="page"/>
	<jsp:setProperty name="airplaneBean" property="*"/>
	<jsp:useBean id="insertAirplane" class="admin.AirplaneMgr" scope="page"/>

	<%
		insertAirplane.airplaneInsert(airplaneBean);
		response.sendRedirect("airplane_manage.jsp");
	%>