<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	JSP의 영역(scope)
	
	page
	
	하나의  jsp페이지마다 사용되는 영역이다. page영역은 한번의 클라이언트 요청에 대해서 
	하나의  jsp페이지를 메모리영역으로 한다. 웹브라우저의 요청이 들어오면 jsp페이지를 시행하는 데 이때 jsp페이지를 실행하는 범위가 page영역이다. 이 영역은
	pageComtext객체의 영역이다.
	
	
	request
	
	하나의 http요청을 처리할 때 사용되는 영역이다. request영역은 웹브라우저의 요청과 관련이 있다. 웹브라우저의 주소창에 url을 입력하거나
	링크를 클릭해서 페이지를 이동할 때 웹 브라우저가 웹서버에 전송하는 요청이 하나의 request 영역이다.
	
	이영역은 웹브라우저가 요청할 때마다 새로운 request영역이 생성된다. page영역은 jsp한개의 페이지 영역만 포함되는데에 비해 request영역은 하나의 요청을 처리하는 데
	사용되는 모든 jsp페이지를 호함한다. 이 영역은 request객체의 영역이다.
	
	session
	
	하나의 웹브라우저와 관련된 영역으로서 session영역은 웹브라우저와 관련된 영역이다. session이 생성되면 하나의 웹브라우저와 관련된 모든 요청은 하나의 session영역에
	포함되며 이 영역은 session객체의 영역이다.
	
	application
	
	하나의 웹애플리케이션과 관련된 영역으로 application 영역은 웹애플리케이션과 관련된 전체 영영ㄱ을 의미하고 apllication객체가 사용하는 영역이다.
	
	JSP모든 객체 속성
	
	네 개의 기본객체는 각각의 속성을 갖는데 각 기본객체가 존재하는 동안 기본객츠이 속성을 사요ㅗㅎ라 수가 있다. jsp가본객체 속성은 jsp사이에서 정보를 교환하거나
	공유하기 위한 목적으로 사용한다. 속성은 key와 value의 형태를 갖고, 네개의 기본객체는 서로 다른 이름을 갖는 속성을 여러개 저장할 수 있다.
	
	관련 메서드
	setAtrribute(String name, Object value) : 각각의 영역에 해당하는 속성과 값을 지정
	getAtrribute(String name)				: 각각의 영역에 저장되어 있는 속성을 이용 값을 읽기
											  없으면 null리턴
	removeAttribute(String name)			: 각각의 영역에 저장되어 잇는 속성을 삭제
	getAtributeNames()    					: 각 영역에 모든 속성들을 Enumeration타입으로 리턴 (pageContext 제외) 
	JSP기본객체의 속성(attribute)


  -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		out.print("<h3> 사용자 아이디=" + id + "</h3>");
		out.print("<h3> 사용자 비밀번호=" + pw + "</h3>");
		out.print("<hr>");
	
		out.print("<h3>  앱 영역 아이디 =" + application.getAttribute("id" + "</h3>"));
		out.print("<h3>  앱 영역 비밀번호 =" + application.getAttribute("pw" + "</h3>"));
		
		
		
		application.setAttribute("id", "hong");
		application.setAttribute("pw", "124345");
		
		
		
		
		application.removeAttribute("id");
	%>
</body>
</html>