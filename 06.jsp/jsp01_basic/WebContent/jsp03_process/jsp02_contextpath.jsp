<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
	servlet/ jsp는 웹애플리케이션이 사전에 정해진 규칙에 따라 특정폴더의 구조를 준수하도록
	강제화 하고 있다. 이 구조를 모른다면 제대로 동작하는 프로그램을 개발할 수 없게 된다.
	
	servlet/jsp의 기본폴더의 구조는
	
	웹애플리케이션이름/root(jsp01_basic/WebContent)
	... WEB_INF : 웹애플리케이션의 설정정보가 위치한다. 대표적 설정정보는 web.xml이다.
	... WEB_INF/classes : 웹애플리케이션에서 사용하는 java의 class파일이 위치한다.
	... WEB_INF/lib : 웹애플리케이션에서 사용하는 라이브러리파일이 위치(예: ojdbc8.jar)
	... WEB_INF/사용자 : 사용자폴더,css,js,html등등 작성한 파일이 위치하는 폴더
	
	컨텍스트경로
	
	requeset객체에서 컨텍스의 기본경로는 request.getContextPath()메서드로 확인할 수가 있다.
	
	웹 애플리케이션의 배포(deploy)
	
	개발된 웹애플리케이션을 WAS에 배포하는 방법은 2가지가 있다.
	
	a.개발된 프로그램의 폴더 그대로 파일을 WAS에 복사
	
	b.war파일형식으로 압출해서 배포하는 방법
	 jdk의 jar.exe명령을 사용 사용해서 war파일을 생성
	 실행방법 c:\jar.exe cvf jsp01_basic.war
	 상기멸령대신에 이클립스를 이용: 프로젝트이름 우클릭 > export > war file
	

 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>웹 Context경로 = <%=request.getContextPath() %> </h3>
	<a href="http://localhost:8088/jsp01_basic/jsp03_process/jsp02_contextpath.jsp">aaa</a>
	
</body>
</html>