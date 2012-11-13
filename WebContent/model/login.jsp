<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
<%
	Connection conn = null;
	String dbUrl = "jdbc:mysql://localhost:3306/betting";
	String dbUser = "huohuohuo";
	String dbPassword = "mju12345";
	conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	
	Statement stmt = null;
	ResultSet rs = null;
	stmt = conn.createStatement();

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	String sql = "select * from 회원 where ID='" + id + "' and password='" + password + "'";
	rs = stmt.executeQuery(sql);
	
	if(!rs.next()) {
		out.println("아이디, 패스워드를 다시한번 확인해주세요");
	}
	else {
		session.setAttribute("ID", rs.getString("ID"));
		session.setAttribute("password", rs.getString("password"));
		session.setAttribute("name", rs.getString("이름"));
		session.setAttribute("email", rs.getString("이메일"));
		session.setAttribute("phone", rs.getString("전화번호"));
		session.setAttribute("nickName", rs.getString("닉네임"));
		session.setAttribute("address", rs.getString("주소"));
	}

	conn.close();
	rs.close();
	stmt.close();

	response.sendRedirect("../view/main.jsp");
%>
	</body>
</html>