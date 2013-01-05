<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="reserveBean" class="admin.ReserveBean" scope="page"/>
	<jsp:setProperty name="reserveBean" property="*"/>
	<jsp:useBean id="insertReserve" class="admin.ReserveMgr" scope="page"/>

	<%
		insertReserve.reserveInsert(reserveBean);
		response.sendRedirect("reserve_manage.jsp");
	%>