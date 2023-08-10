<%@page import="java.net.URLEncoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--
	쿠키 사용하기
	
	-쿠키는 웹브라우저가 저장하는 데이터이다. 웹브라우저는 웹서버에 요청을 보낼 때
	쿠키를 함께 전송하고 웹서버는 웹브라우저가 전송한 쿠키를 사용해서 데이터를 처리 할 수 있다. 쿠키는 웹서버와 웹브라우저 양쪽에
	생성할 수 있는데 JSP에서 생성하는 쿠키는 웹서버에 저장하는 쿠키이다.
	
	쿠키의 동작5단계
	
	-쿠키 생성단계: 쿠키를 사용하려면 먼저 쿠키를 생성해야 하고 jsp프로그램에서 쿠키는 웹서버에 생성한다. 
				생성한 쿠키는 응답데이터의 헤더에 저장해서 웹 브라우저로 전송한다.
	 쿠키 저장단계: 웹브라우저는 응답데이터에 포함된 쿠리를 쿠키저장소에 보관하며 쿠키의 종료여부에 따라 메모리나 파일에
	 			저장한다.
	 쿠키 전송단계: 웹브라우저는 저장한 쿠키를 요청이 있을 때마다 웹서버에 전송한다. 웹 서버는 웹브라우저가 전송한 쿠키를 사용해서
	 			필요한 작업을 수행할 수 있다.
	 
	쿠키의 구성요소
	
	-이름		:각 쿠키정보를 구별하기 위해 사용되는 쿠키의 이름(key)
	 값		:쿠키의 이름(key)에 매칭되는 값(value)
	 유효기간 : 쿠키의 유효기간 
	 도메인	: 쿠키를 전송할 도메인(www.google.*)
	 경로		: 쿠키를 전송할 경로
	쿠키의 명명규칙
	
	- 쿠키의 이름은 , , ; ,= 기호를 제외한 알파벳과 숫자로 조합된 문자로 정의할 수 있으면 %시작할수 없다.
	
	쿠키의 생성
	
	- JSP에서 쿠키를 생성할 때 "Cookie 클래스"를 사용하는데  생성자의 매개값으로 쿠키이름, 쿠키값을 정의하여 생성한다.
	
	Cookie cookie = new Cookie("id", "hong");
	response.addCookie(cookie);
	
	Cookie클래스가 제공하는 메서드
	
	getName() : 쿠키의 이름을 리턴
	getValue() : 쿠키값을리턴
	setValue(String value): 쿠키값을 저장
	setDomain(String parttern) : 쿠키가 전송될 서버의 도메인을 저장
	getDomain() : 쿠키가 저장된 도메인을 리턴
	setPath(String url) :쿠키가 전송할 경로를 지정
	getPath() : 쿠키가 저장된 경로를 리턴
	
	Cookie값 읽기
	
	쿠키가 생성된 후에 쿠키를사용할 수 있는데 웹브라우저는 요청헤더에 쿠키르 전송하며 
	JSP는 request.getCookie()메서드를 이용해서 쿠키값을 읽어 온다.
	
	request.getCookie()메서드는 쿠키배열 Cookie[]를 리턴하고 읽어올 쿠키 값이 존재하지 않을 경우에는 null값을 리턴한다.
	
	Cookie값 변경
	
	쿠키값을 변경하려면 같은 이름의 쿠키를 생성해서 응답데이터로 전송하면 변경된다. 사용 방법은
	
	Cookie cookie = new Cookie("쿠키이름, URLEncoder.encode("새로운값", "utf-8"));
	response.addCookie(cookie);
	
	쿠키가 존재하지 않으면 쿠키가 생성되기 때문에 쿠키의 존재여부를 확인한 후 존재할 경우에는 쿠키값을 변경해 주면된다.
	쿠키의 삭제는 유효기간으로 지정하면 된다.
	 
	Cookie의 도메인
	
	기본적으로 쿠키는 쿠키를 생성한 서버에만 전송된다. 예를 들어 www.google.com에 연결해서 생성된 쿠키는
	다른 사이트로 전송되지 않고 해당 사이트에 연결할 때만 전송된다.
	
	하지만, 동일 도메인을 사용하는 모든 서버에 쿠키를 전송해야할 경우가 있을 경우 예를 들어 
	www.google.com에서 생성된 쿠키를 mail.google.com 또는 기타 동일 도메인에 포함된 서버에 전송할 경우가 있다.
	
	1.*.google.com : google로 시작되는 경우 관련된 도메인 모두에 쿠키정보를 전송한다.
	2. mail.googel.com : 특정 도메인 즉, mail도메인에만 쿠키를 전송한다.
	
	쿠키의 경로
	
	도메인이 쿠키를 고유한 도메인의 범위를 지정한다면 경로는 쿠키를 공유할 기준경로를 지정한다.
	쿠키의 경로를 지정할 때에는 setPath()메서드를 사용한다. 경로는 url에서 도메인 이후의 부분에
	해당한 예를 들어 http://www.naver.com/basic/path2/create.jsp url경로에서는 basic/path2
	부분이 해당경로이다. 따라서 /(root) /basic/path2를 사용할 수 있다.
	
	쿠키의 유효기간
	
	쿠키는 유효시간을 갖는다. 쿠키의 유효기간을 지정하지 않으면  웹브라우저를 종료할 때 쿠키를 함께 삭제한다.
	웹브라우저 종료 후 다시 웹브라우저를 실행하면 삭제한 쿠니는 서버에 전송되지 않는다. 쿠키의 유효시간을 정해 놓으면
	유효시간동안 쿠키가 존재하고 웹브라우저가 종료되도 유효시간이 지나지 않았다면 그 쿠키는 삭제되지 않는다.
	
	유효 시간을 지정하려면 setMAxAge() 메서드를 사용한다. 유효시간단위는 초단위로 지정한다.
	
	쿠키와 헤더
	
	response.addCookie()메서드로 쿠키를 추가하면 실제로 "Set-Cookie" 헤더를 통해서 전달된다.
	한 개의 set-Cookie헤더는 한개의 쿠키값을 전달한다. 헤더의 구성은 다음과 같다.
	
	Set-Cookie : 쿠키이름=쿠키값;Domain= 도메인값; Path=경로; Expires= GMT유효기간 


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
 <h1>쿠키생성하기</h1>
 <%
 	Cookie cookie = new Cookie("name", URLEncoder.encode("홍길동", "utf-8"));
 	response.addCookie(cookie);
 %>
 <%= cookie.getName() %> 쿠키의 값 <%= cookie.getValue() %> <h3></h3>

</body>
</html>