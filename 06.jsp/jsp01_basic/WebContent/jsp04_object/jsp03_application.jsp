<%@page import="java.util.Enumeration"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	application 기본객체
	
	application객체는 웹애플리케이션 전역에 걸쳐서 사용되는 정보를 저장할 수 있다. 예를 들어
	초기설정정보, 서버정보, 웹애플리케이션에서 제공하는 정보를 공통으로 공유해서 사용할 수 있다.
	
	서블릿규약에서는 웹애플리케이션 전체에 걸쳐서 사용(공유)할 수 있는 초기화 파라미터를 정의 하고 있는데 초기화 파라미터는 web.xml
	<context-param>태그를 사용하여 추가할 수 있다.
	
	web.xml이란?
	
	web.xml파일은 웹애플리케이션을 위한 설정정보를 가지고 있는 파일이다. jsp프로그래밍을 할 때
	꼭 필요한 파일은 아니지만 환경설정파일로서 중요한 파일이다. 이 파일은 반드시 WEB-INF폴더에 위치해야 한다.
	다른 폴더에 위치하게 될 경우  이 파일을 인식하지 못한다.
	
	[application객체의 초기화 메서드]
	
	getIntitParameter(String name) : name이라는 키로 초기화 파라미터 값을 읽을 수가 있다.
	getIntitParameterNames() : 초기파라미터목록(key)들을 리턴
	
	[application객체의 서버관련 메서드]
	
	getServerInfo()  : 웹서버의 정보를 리턴
	getMajorVersion(): 웹서버가 지원하는 서블릿규약의 메이저 정보를 리턴
	getMinorVersion(): 웹서버가 지원하는 서블릿규약의 마이너 정보를 리턴
	log() : application객체는 웹컨테이너가 사용하는 로그파일에 로그메시지를 기록할 수 있는 메서드
	... 톰캣설치폴더/ logs폴더에 localhost_log.yyyy-mm-dd.log파일에 메시지 기록
  -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>웹서버관련정보</h1>
	<h3>서버정보: <%= application.getServerInfo() %></h3>
	<h3>서버메이저버전정보: <%= application.getMajorVersion() %></h3>
	<h3>서버마이너버전정보: <%= application.getMinorVersion() %></h3>
	<h3>서버ContextPath: <%= application.getContextPath() %></h3>
	<h3>서버초기파라미터: <%= application.getInitParameterNames() %></h3>
	<hr />
	
	<h3>웹서버의 초기화 파라미터 정보</h3>
	<%
		Enumeration<String> init_params = application.getInitParameterNames();
		while(init_params.hasMoreElements()) {
			String param_name = init_params.nextElement();
%>

		<li></li>
	<%
		}
	
	%>
	<h3>로그 메시지 기록하기</h3>
	<%
		application.log("application객체:로그 기록하기!");
		log("로그메시지 기록!");
	
	%>
	
</body>
</html>