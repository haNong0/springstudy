<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//실습. 변수선언 sno, gender, age  int String int
	//2. 번호 2000, 홍길순, 여자 , 25
	int sno= 2000;
	String gender = "여자";
	int age = 25;
	String name = "홍길순";
	
	//실습
	// 변수 ArrayList타입 만들어서 student를 선언하고 3000, 소향 , 여자, 43
	ArrayList<String> student = new ArrayList();
	student.add(0,"3000");
	student.add(1,"소향");
	student.add(2,"여자");
	student.add(3,"43");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>번호 : 1000</h1>
	<h1>이름 : 홍길동</h1>
	<h1>성별 : 남자</h1>
	<h1>나이 : 1000</h1>
	<hr/>
	<!--홍길순 정보 출력  -->
	<h1>번호 : <%=  sno %></h1>
	<h1>이름 : <%=name %></h1>
	<h1>성별 :<%= gender %></h1>
	<h1>나이 : <%= age%></h1>
	<hr />
	<h1>번호 : <%=  student.get(0) %></h1>
	<h1>이름 : <%=student.get(1) %></h1>
	<h1>성별 :<%= student.get(2) %></h1>
	<h1>나이 : <%= student.get(3)%></h1>
	
</body>
</html>