<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	Action Tag?
	
	서버나 클라이언트에게 특정 행동을 수행하도록 명령하는 태그
	JSP페이지에서 페이지와 페이지사이를 제어
	다른 페이지의 실행결과를 현재 페이지에 포함
	JavaBeans등으 ㅣ다양한 기능을 제공
	XML형식으로 선언 jsp:명령...
	
	
	Action Tag의 종류
	
	jsp:include : 다른 페이즈를 현재 페이지에 포함(페이지의 모듈화)
	jsp:forward : 다른 페이지로 이동명령, 흐름을 제어가능
	jsp:useBean : JSP페이지에 Java Beans을 설정 (예를들어 BoardVO)
	jsp:setProperty : 값을 설정 setter 역할
	jsp:getProperty : 값을 설정 getter 역할
	jsp:param : forward, include, plugin 태그의 파라미터로 설정
	jsp:plughin : 웹브라우저에 Java Applet(swing과 유사한 객체)을 실행
	jsp:element : 덩적으로 XML요소 설정
	jsp:attribute : 동적으로 정의한 XML요소의 속성을 설정
	jsp: body : 동적으로 정의된 XML요소 body 설정
	jsp: test : JSP페이지 및 문서에서 템플릿 텍스트를 설정

  -->
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class= "container">
		<table class="table table dark table-hover">
		<tr>
		<td>제품번호</td>
		<td>1212121212</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>15000</td>
		</tr>
		
		
		
		</table>
		<jsp:include page="jsp04_param.jsp" flush="false">
		<jsp:param value="C" name="status"/>
		</jsp:include>
		
		</div>
</body>
</html>