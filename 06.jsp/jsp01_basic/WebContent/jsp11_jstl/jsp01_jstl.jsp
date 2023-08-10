<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!--
	JSTL(jsp strandard tag library)

	jsp는 스크립트릿과 표현식등 스크립트코드와 html tag들의 코드가 뒤섞여서 사용하기 때문에 jsp코드는 가독성이 떨어지고 코딩하기 매우 복잡하게 되어 있어서 개발하기 편리하지 않게 되어 있다.
	jsp는 새로운 tag를 포함한 표준러이부로아 형태로 제공을 해서 보다 쉽게 가독성이 좋게 코딩할 수 있도록 제공하는 기능이 있는데 jsp페이지에서 많이 사용되는 논리적인 판단(if), 반복처리(for), 포맷처리등을 쉽게
	할 수 있도록 표준으로 만들어서 라이브러리형태로 제공하는 것이 jstl이다

	jstl- ??-??.jar파일을 다운로드 받아서 WEB-INF/lib폴더에 저장하면 jstl을 바로 사용할 수 있다.
	
	jstl이 제공하는 tag lubrary
	
	라이브러리 주요기능 							접두어 관련 uri
	-------------------------------------
	core태그	변수, 흐름제어(if, for), url처리 	 c   http://java.sun.com/jsp/jstl/core
	xml  	xml코어, 흐름제어, 변환처리           x  	http://java.sun.com/jsp/jstl/xml
	 db    sql, 메시지 형식    				sql http://java.sun.com/jsp/jstl/sql
	함수 		Collection처리,String처리   		fn  http://java.sun.com/jsp/jstl/fn
	국제화   다국어지원, 지역, 메시지/숫자/ 날짜형식   fmt http://java.sun.com/jsp/jstl/fmt
	
	
	
	core태그
	
	기능 		태그 			설명
	------------------------------
	변수선언	set  		jsp페이지에서 사용할 변수를 선언
			remove 		선언된 변수를 jsp페이지에서 삭제
	흐름제어   if 			조건에 따라 흐름을 제어, 단순 if문
			choose 		다중처리조건(if~else if~)
			forEach 	collection이나 map계열의 항목을 반복처리 할 때 사용
			forToken 	구분자로 분리되는 문자열(token)을 처리
	URL 	import 		url에 해당하는 resource를 jsp페이제 로딩
			redirect 	지정한 경로로 redirect를 실행
			url 		url을 재작성
	기타태그 	catch 		exception처리
			out 		Jspwriter에 지정한 내용을 처리

	국제화태그
	
	국제화태그는 특정지역에 따라 알맞는 메시지를 출력해야할 경우 사용한다. 예를 들어서 한글브라우저로 접속하면
	한글메시지로 출력하고 영문브라우저로 접속하면 영문메시지로 출력해야할 경우 국제화태그를 쉽게 적용할 수 있다.
	
	기능 		태그 		설명
	------------------------------------------------------------
	Locale 	setLocaler 		지역을 설정
			requestEncoding 요청파라미터의 문자셋의 인코딩 지정
	Message bundle 			사용할 언어번들을 지정	
			Message 		지역에 해당하는 메시지를 출력
			setBundle 		리소스번들을 로딩후에 특정 변수에 저장
	format forMatNumber 	숫자형식을 지정
			FormateDate 	날짜형식을 지정
			parseDate 		날짜형식의 문자열을 Date객체로 파싱
			parseNumber 	숫자형식의 문자열을 Number객체로 파싱
			setTimeZone 	시간대 정보를 특정변수에 저장
			timeZone 		시간대를 저장
			
	Locale지정태그
	
	fmt:setLocale  	: 국제화태그를 사요할 지역을 설정
	fmt:requestEncoding : 요청파라미터를 인코딩할 문자셋을 설정
	
	웹브라우저는 Accept- Language헤더를 사용해서 수용가능한 언어목록을 전송하는데 JSTL국제화 태그들은
	이 헤더 값을 이용해서 언어별로 알맞는 언어처리를 하게 된다. 예를 들어 메시지를 출력해주는 message태그는 Accept-Language의 값이 'ko'인 경우 한글 메시지를 우선 처리 'en'
	인 경우 영문세지를 우선처리
	
	
	Resourse Bundle
	
	메시지태그에서 사용할 리소스번들파일을 작성할 때 메시지 번들파일은 classpath에 위치해야 하기 때문에 WEB/INF/lib에 포함된 jar파일에 포함시켜야 한다. 리소스번들 파일은
	기본적으로 java.util.Properties클래스를 사용해서 읽어 오기 때문에 번들파일의 확장자는 properties이다.
	
	리소스번들파일에서 중요한 점은 리소스번들파일의 이름을 정해진 규칙에 따라 작성해야 한다. 예를 들어 "번들이름_국가코드.properties" 의 형식으로 작성해야하고 국가코드는 생략할 수 있다.
	
	Message태그
	
	fmt: bundle
	fmt: message
	fmt: setBundle : 특정메시지를 사용할 경우 번들파일을 설정
	
	format 태그
	숫자출력과 파싱 : formatNumber parseNumber
	날짜출력과 파싱 : 
	시간대 설정 	: 
			
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
	<c:if test="true">
	<h2>${"참입니다."} </h2>
	</c:if>
</body>
</html>