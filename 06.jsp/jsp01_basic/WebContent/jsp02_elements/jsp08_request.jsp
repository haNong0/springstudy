<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--
	request 기본객체(HttpServeltRequest)
	
	request기본객체는 jsp페이지에서 가장 많이 사용되는 객체로서 웹브라우저의 요청과
	관련이 있는 객체이다. 웹브라우저에서 웹사이트주소를 입력하면 웹브라우저는 해당 주소의
	웹서버에 연결한 후 요청정보를 전송하는데 이 요청 정보를 웹서버에 전달하는 객체가 request이다.
	
	ㄱ. request객체가 제공하는 기능
	
		ㄱ) 클라이언트(웹브라우저)와 관련된 정보
		ㄴ) 서버와 관련된 정보
		ㄷ) 클라이언트가 전송한 요청파리미터정보(http://localhost:8088/login?id=hong&pw=12345)\
		ㄹ) 클라이언트가 전송한 용청헤더정보(http규약에 따른 정보등...)
		ㅁ) 클라이언트 쿠키 정보
		ㅂ) 속성처리 정보 
	ㄴ. request객체의 메서드
	
		1.getParmeter(String name) : name인 파리미터의 값을 리턴, 없으면 null
		2.getParmemterValues(String name) : name인 파라미터의 값을 배열리턴, 없으면 null
		3.getParmeterNames() : 웹브라우저가 전송한 파라미터의 이름목록을 배열로 리턴, 없으면 null
		4.getParmeterMap() : 웹브라우저가 전송한 파라미터이름과 값을 Map타입으로 리턴 
		
	ㄷ. requeset객체의 요청헤더정보 관련 메서드 
	
		1.getHeader(String name) : 지정한 name의 헤더값을 리턴
		2.getHeaders(String name) : 지정한 name의 헤더목록을 리턴
		3.getHeadernames(String name ) : 모든헤더이름을 리턴
		4. getIntHeader(String name) : 지정한 헤더의 값을 정수값으로 리턴
		4. getDateHeader(String name) : 지정한 헤더의 값을 일시값으로 리턴
		
	ㄹ. request객체와 메서드
		
		1.getRemoteAddr() : 웹서버에 연결한 클라이언트 IP주소
		2.getContentLength() : 클라이언트가 요청한 정보의 총 길이
		3.getCharacterDncoding() : 클라이언트가 전송할 때 사용한 문자셋
		4.getContentType() : 클라이언트가 요청정보를 전송할 때 사용한 컨텐츠(문서) 정보
		4.getProtocol() : 클라이언트가 요청한 protocol(http, ftp..)
		5.getMethod(): 웹브라우저가 정보를 전송할 때의 방식(get, post..)
		7.getRequestURI():웹브라우저가 요청한 정보
		8.getContextPath(): jsp페이지가 소속된 웹애플리케이션의 ContextPath정보
		9.getServerName() : 연결할 때 사용한 웹서버의 이름
		10.getServerport() : 연결할 때 사용한 웹서의  port 번호
		
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<h3>클라이언트 IP주소 : <%= request.getRemoteAddr()%></h3>
	<h3>요청정보의 길이:<%= request.getContentLength()%></h3>
	<h3>요청정보의 인코딩:<%= request.getCharacterEncoding()%></h3>
	<h3>요청정보의 컨텐츠타입:<%= request.getContentType()%></h3>
	<h3>요청정보의 포로토콜:<%= request.getProtocol()%></h3>
	<h3>요청정보의 전송방식:<%= request.getMethod()%></h3>
	<h3>요청정보의 URI:<%= request.getRequestURI()%></h3>
	<h3>요청정보의 컨텍스트 경로:<%= request.getContextPath()%></h3>
	<h3>요청정보의 서버이름:<%= request.getServerName()%></h3>
	<h3>요청정보의 서버포트번호:</h3>
	
</body>
</html>