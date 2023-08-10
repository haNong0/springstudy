<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	pageContext 기본객체
	
	jsp파일 하나당 한 객체씩 존재하는 기본객체로써
	
	기본객체구하기
	속성처리하기
	페이지흐름제어하기
	에러데이터처리하기
	
	관련메서드
	
	getRequest() : request객체 구하기
	getResponse(): response객체 구하기
	getSession() : session객체 구하기
	getServlet() : application객체 구하기
	getServletConfig() : config객체 구하기
	getOut() : out객체 구하기
	getPage() : page객체 구하기
	getException(): exception객체 구하기
	-- exception객체를 사용하려면 jsp페이지가 error page라고 선언해야한다.
	-- 만약, exception객체가 null일경우 예외가 발생한다.

  -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= request %>
	<%= request.toString() %>
	<%= pageContext.getRequest() %>
	<!--다 같은 메서드  -->

</body>
</html>