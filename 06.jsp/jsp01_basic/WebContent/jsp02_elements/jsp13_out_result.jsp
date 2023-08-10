<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");

%>


 <%out.println("아이디는" + id ); %>
  <%out.println("비밀번호는" + pw ); %>
</body>
</html>