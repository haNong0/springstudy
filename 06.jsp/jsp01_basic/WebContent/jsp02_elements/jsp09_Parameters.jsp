<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");

%>
<!--
	톰캣에서는 get방식으로 전달되는 파라미터의 값을 읽어올 때 사용하는 문자셋은
	기본적으로 utf-8로 전달된다. 그렇게 때문에 tomcat에서는 별도로 문자셋을 
	설정하지 않아도 utf-8문자셋을 사용한다. 하지만 utf-8이 아닌 문자셋을 get방식으로 전달하는
	경우에는 server.xml에 <Connector>태그의 useBodyEncodingForURI속성을
	true로 추가하면 된다.
	
	true로 설정할 경우에는 get방식으로 전달되는 파라미터값을 읽을 때 request객체의
	setCaracterEncoding("utf-8")메서드를 호출해서 지정된 문자셋을 사용할 수 있게 한다.


  -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="jsp09_Parametersview.jsp" method = "get">
이름<input type = "text" name= "name" size ="10" value = "홍길동"/>
주소:<input type="text" name = "addr" size = "50" value ="조선한양" />
취미:<input type="checkbox" name ="hobbies" value ="독서" />
	<input type="checkbox" name ="hobbies" value ="독일" />
	<input type="checkbox" name ="hobbies" value ="독이" />
	<input type="checkbox" name ="hobbies" value ="독삼" />

<input type="submit" value ="전송" />
</form>



</body>
</html>