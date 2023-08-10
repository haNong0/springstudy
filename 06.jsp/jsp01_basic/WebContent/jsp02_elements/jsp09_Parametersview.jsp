<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>jsp09_parameters_view.jsp</h1>
 <h2>요청된 파라미터 정보</h2>
 <hr />
 <h3>1.getParamemter</h3>
 <h2><%= request %></h3>
 <h2><%= request.getParameter("name") %></h2>
 <h2><%= request.getParameter("addr") %></h2>
 <h2><%= request.getParameter("hobbies") %></h2>
 <h2> request.getParameterValues("hobbies")</h2>
 
 <%
 	String[] hobbies = request.getParameterValues("hobbies");
 	if(hobbies != null){
 		for(String hobby:hobbies) {
 %>
			취미 = <%= hobby %> <br>
 <% 
 		}
 	}
 %>
 <hr />
 <h2>3.getParametersNames()</h2>
 <%
 	Enumeration<String> params = request.getParameterNames();
 	while(params.hasMoreElements()) {
 		String param = params.nextElement();
 		%>
 		요청파라미터이름 = <%= params %> <br />
 		
 <% 
 	}
 
 
 %>
 <hr />
 <h2>4.getParameterMap()</h2>
 <%
 	Map<String, String[]> map = request.getParameterMap();
 	String[] values = map.get("name");
 	if(values != null) {
 		for(int i=0; i <values.length; i++){
 %>
 			요청파라미터(name)의 값 = <%= values[i] %>
 <%
 		}
 	}
 %>
 <hr />
  <%
 	 map = request.getParameterMap();
 	 values = map.get("hobbies");
 	if(values != null) {
 		for(int i=0; i <values.length; i++){
 %>
 			요청파라미터(name)의 값 = <%= values[i] %>
 <%
 		}
 	}
 %>
</body>
</html>