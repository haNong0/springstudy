<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
	EL(Expression Language, 표현언어)
	
	${} : 구문을 분석할때  - 주로사용
	#{} : 실제로 값이 사용될때
	
	boolean - 논리타입
	정수 - EL에서 사용되는 정수 타입은 java.lang.long
	실수 - EL에서 사용되는 실수 타입은 java.lang.double 타입
	문자열 - 문자열은 대부분 사용가능하지만 작은/큼 따옴표 \문자들은 이스케이프문자로 사용
	null - null
	
	기본객체
	
	pageContext :JSP의 page 내장객체와 동일
	pageScope 	: pageContext객체에 저장된 속성으로 Map 속성, 값 형태의 객체
	requestScore : request객체에 저장된 속성으로 Map<속성,값>형태의 객체
	sessionScope : session객체 저장된 속성으로 Map<속성, 값> 형태의 객체
	applicationScope : 
	param
	paramValues
	header
	headerValues
	cookie
	initPrame : 초기화파라미터 <이름, 값>의 Map객체 


	객체사용
	EL언어는 객체에 저장된 값에 접근할 때 "dot연산자(.)" or "대괄호[]"를 사용한다. <표현>.<표현> 또는
	<표현>[표현] 형식으로 접근하는데 접근과정은 다음과 같은 순서로 변환된다.
	
	1.<표현>을 <값>의 형태로 변환
	2.<값1>이 null일 경우 null값을 반환
	3.<값>이 null이 아닐경우 <표현2>의 <값2>를 반환
	4.<값1>이 Map, List, Array일 경우
	
	Map 	  : <값1>.containsKey<(값2)>이 false이면 null , true일 경우 <값1>.get(<값2>)를 리턴
	List,Array:	(<값2>)가 정수값인지 여부를 검사(정수가 아니면 에러발생)후 <값1>.<값2>또는 
				Arrays.get(<값1>.<값2>)의 결과를 리턴

	연산자
	+ , - , * , /
	
	Java차이점 
	$ {"10" + 1} = 11 자바는 101
	$ {"10a" + ""}= 에러 자바는 10a1
	$ {null + 1} = 1 자바는 에러 
	
	수치연산자
	==, != , < , > , ,<= , >=
	
	논리연산자
	&&, || !
	
	empty연산자 
	empty<값>의 형태로 사용
	
	삼항 연산자 
	수식 ? true : false
	
	세미콜론 
	;
	
	
	${1 + 1; 10 + 10 } = 20출력 최종만 출력
	$ {var = 10 } 10만 출력

 -->
 
 <%
 	request.setAttribute("name", "홍길동");
 %>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>표현식</h1>
	<h3>request의 name 속성의 값 = <%= request.getAttribute("name") %></h3>
	<h3>이름 : ${request.getAttribute("name")}- 값을 가져오지 못함 </h3>
	<!-- EL에는 request객체가 없고 대신에 requestScope를 사용해야 한다.  -->
	<hr />
	
	<h1>표현언어(EL)</h1>
	<h3>표현언어의 name 속성값 = ${requestScope.name}</h3>
	
	
	
</body>
</html>