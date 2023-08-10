<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isErrorPage="/jsp05_error/error/error500.jsp" %>
<%@page buffer= "1kb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= for(int i=0; i<1000; i++){
		System.out.print(i)
	} %>
</body>
</html>