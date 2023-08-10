<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 
	커스텀태그
	
	프로그램을 개발하다 보면 JSP액션태그나 JSTL태그만으로 부족할 때가 있는데 이를 지원하기 위헤 JSP는 
	새로운 Tag를 만들어서 사용할 수 있도록 하는 기능을 제공한다. 사용자가 원하는 목적에 맞게
	작성한 태그를 커스텀태그라고 한다.
	
	커스텀태그의 장점 
	
	재사용 : 한번 작성한 커스텀태그는 어떤 JSP컨테이너에서도 사용이 가능하다.
	쉽고 간단한 JSP코드를 작성할 수 있다. 자바코드에 익숙하지 안흔ㄴ 개발자들도 커스텀태그를 사용하면 보다 쉽게 JSP페이지를 작성할 수 있다.
	코드 가독성향상, 커스텀태그를 사용하면 스크립트코드를 줄일 수가 있기 때문에 JSP페이지의 가독성을 향상시킬 수 있다.
	
	태그파일에서 사용가능한 디렉티브
	
	tag 		:jsp페이지의 page디렉티브와 동일
	taglib 		: tag파일에서 사용할 tag library를 정의
	include 	: tag파일에 외부파일을 포함시킬 때 사용
	attribute 	: tag파일을 커스텀태그로 사용할 때 입력받을 속성을 정의
	variable 	: EL변수로 사용할 변수에 대한 정보를 정의
	
	태그디렉티브의 속성
	
	display-name : tag파일이 사용될 이름을 정의, 기본값은 확장자(~.tag)를 제외한 나머지 파일이름
	body-content : body내용의 종류를 정의 empty, tagdepartment, scriptless의 세가지 값을 사용할 수 있다. 기본값 scriptless
	
		empty : body가 비어 있어야한다
		tagdependant : tag자체의 구현에 종속되어있다.
		scriptless : 스크립트요소를 정의할 수 있다.
	dynamic-attribute : 동적으로 속성을 정의, 속성<key, value>를 저장하는 Map객체를 page범위의 속성에
						저장할떄 사용할 이름을 정의
	description : tag에 대한 설명
	import : page디렉티브의 import와 동일
	pageEncoding : page디렉티브의 pageEncoding과 동일
	isELigonored : page디렉티브의 isElIgonored와 동일 EL을 사용하지 않겠다.
	defferedSyntaxAllowedLiteral : page디렉티브의 속성과 동일,  이 속성값이 true일 경우  ${},#{} 형식의 값을 문자열로 처리할 것인지 여부
	trimDiretiveWhiteSpace : page디렉티브 속성과 동일, 공백문자를 제거 여부
	
	
	태그파일에서 사용가능한 기본(내장객체)
	
	jspContext -  jsp페이지의 pageContext가 제공하는 메서드 그대로 사용가능, 각 속성과 관련된 작업처리가능
	request - jsp페이지의 request와 동일
	response- jsp페이지의 response와 동일
	session - jsp페이지의 session와 동일
	application - jsp페이지의 application와 동일
	out - jsp페이지의 out와 동일




  -->
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>