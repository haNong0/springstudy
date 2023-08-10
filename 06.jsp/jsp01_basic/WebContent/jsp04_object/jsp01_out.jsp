<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
		JSP에서 사용하는 기본객체 영역
		
		1.request - 클라이언트 요청정보를 저장
		2.response - 웹서버의 응답정보를 저장
		3.out - jsp페이지의 생성결과를 출력할 때 사용하는 출력문자스트림
		4.page - jsp페이지에 대한 정보를 저장
		5.session - HTTP세션정보를 저장
		6.application - 웹애플리케이션에 대한 정보를 저장
		7.page - jsp페이지를 구현한 자바클래스의 인스턴스(객체)
		8.config - jsp페이지에 대한 설정정보를 저장
		9.exception - exception객체 에러페이지라고 정의된 페이지에서만 사용가능	



  -->
  
  <!-- 
  		1. out 
  		
  		out객체는 웹브라우저에 데이터를 전송하는 출력스트림으로써 jsp가 생성한 데이터를 웹페이지에 출력
  		
  		ㄱ.메서드
  		print()  :데이터출력
  		println():데이터출력후 줄바꿈
  		newLine():줄바꿈
  		write()  : dom태그를 html로 출력
  		ㄴ.buffer메서드
  		
  		getBufferSize():버퍼크기 리턴
  		getRemaining() :버퍼의 잔량 리턴
  		clear()        :버퍼전체 비움, 이미 flush되있다면 예외 오류
  		clearBuffer()  : 버퍼전체비움, 이미 flush되있다면 에외 발생 안함
  		flush()        : 버퍼 flush처리
  		isAutoFlush()  : 자동 flush여부 boolean으로 리턴
  
   -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%  out.print("<h1> out기본객체</h1>"); %>
	<%  out.print(" out기본객체2"); %>
	<%  out.print(" out기본객체3"); %>
	
	<h3>out객체 buffer관련 메서드</h3>
	<h4>buffer의 크기 : <% out.getBufferSize(); %></h4>
	<h4>buffer의 잔량 : <% out.getRemaining(); %></h4>
	<h4>buffer의 여부 : <% out.isAutoFlush(); %></h4>
</body>
</html>