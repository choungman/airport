<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="memberBean" class="admin.MemberBean" scope="page"/>
	<jsp:setProperty name="memberBean" property="ID"/>
	<jsp:useBean id="deleteMember" class="admin.MemberMgr" scope="page"/>

	<%
		deleteMember.memberDelete(memberBean.getID());
		response.sendRedirect("member_manage.jsp");
	%>