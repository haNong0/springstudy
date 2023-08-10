<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page buffer ="1kb" autoFlush ="true" %>
<!DOCTYPE html>
<!-- 
	jsp처리과정
	
	jsp에 서블릿이 없는 경우
	
		index.jsp파일로 부터 자바코드 파일(servlet)을 생성(index_jsp.java)
		index.jsp.java파일을 컴파일해서 서블릿클래스파일을 생성(index_jsp.class)
		서블잇에 웹브라우저의 요청을 전달 클라이언트에 request(파라미터값 포함) 전송
		서블릿처리결과를 웹서버에서 클라이언트로 읍답결과를 생성
		response객체를 클라이언트(웹브라우저)에 전달
		
		
	jsp에 서블릿이 있는 경우
	
		서블릿에 웹브라우저의 요청을 전송


	출력buffer와 응답
	
		jsp페이지에는 응답결과를 곧 바로 웹브라우저에 전송하는 것이 아니라 버퍼(buffer)에
		임시로 저장했다가 buffer가 꽉 차면 한번에 웹브라우저에 전송한다. 이렇게 버퍼를 이용하는 장점은
		
		데이터 전송 성능 향상
		jsp실행 도중 buffer를 비우고 새로운 내용을 저장이 가능
		buffer가 다 차기 전에 응답헤더 전보변경이 가능
		
		플러쉬(Flush)
		
		버퍼가 다 차 있을 때 버퍼가 쌓인 데이터를 실제로 전송해야 하는데 flush란 buffer에 데이터가 다 차지 않았을 경우
		데이터를 전송한 후에 버퍼를 비우는 것을 말한다.
		
		jsp에서 page디렉티브에 autoFlush속성이 있다. 이 속성이 true일 경우 다 차있을 경우 버퍼의 데이터를 전송, flush를 하고
		버퍼가 다 찼을 경우 exceotion을 발생 시키고 작업을 중단 시킨다.
		
		autoFlush속성 이외에 buffer속성에는 buffer크기를 지정할 수 있다 만약, 속성을 none으로 지정한다면 jsp가 출력하는 내용을 즉시 웹브라우저에 전송하기 때문에
		제약사항이 있다.
		
		<제약사항>
		< jsp:forward>기능을 사용할 수 없다.
		즉시 전송하기 때문에 출력한 내용을 취소 할 수가 없다.
 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	for(int i = 0; i<1000; i++) {
		%>
		1234567890
<% 
	}

%>

</body>
</html>