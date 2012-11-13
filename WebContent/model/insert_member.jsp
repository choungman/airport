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
	stmt = conn.createStatement();
	 
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String nickName = request.getParameter("nickName");
	String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
	String address = request.getParameter("address"); 

	String sql = "insert into 회원 values('" + id + "', '" + password + "', '" + name + "', '" + email + "', '" + nickName + "', '" + phone + "', '" + address + "');";
	stmt.executeUpdate(sql);
	
	out.println("가입이 완료되었습니다");
	
	conn.close();
	stmt.close();
	
	response.sendRedirect("./view/main.jsp");
%>
	</body>
</html>