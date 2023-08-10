<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% // 스크립트릿- 자바코드작성부분  %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 표현식  or 자바소스에서 선언된 변수   -->
	<% Calendar cal = Calendar.getInstance(); %>
	오늘은
	<%= cal.get(Calendar.YEAR) %>년
	<%= cal.get(Calendar.MONTH)+1 %>월
	<%= cal.get(Calendar.DATE) %>일
	<!--import를 사용하지 않으면 클래스이름은 풀네임으로 지정해야 한다.  -->
	<br />
	<%java.util.Date now = new java.util.Date(); %>
	Today is <%= now %>.
</body>
</html>