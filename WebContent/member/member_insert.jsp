<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="memberBean" class="admin.MemberBean" scope="page"/>
	<jsp:setProperty name="memberBean" property="*"/>
	<jsp:useBean id="insertMember" class="admin.MemberMgr" scope="page"/>

	<%
		insertMember.memberInsert(memberBean);
		response.sendRedirect("member_manage.jsp");
	%>