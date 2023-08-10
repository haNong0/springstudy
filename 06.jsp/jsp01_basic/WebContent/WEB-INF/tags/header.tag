<%@tag body-content="empty" Encoding = "utf-8"%>
<%@tag trimDirectiveWhitespaces="false" %>
<%@attribute name= "titile" required="true" %>
<%@attribute name= "level" required="false" type= "java.lang.Integer" %>
<%
	String headerStartTag= null;
	String headerEndTag = null;
	
	if(level == null) {
		headerStartTag = "<h1>";
		headerEndTag = "</h1>";
	} else if(level == 1) {
		headerStartTag = "<h1>";
		headerEndTag = "</h1>";
	}else if(level == 2) {
		headerStartTag = "<h2>";
		headerEndTag = "</h2>";
	}else if(level == 3) {
		headerStartTag = "<h3>";
		headerEndTag = "</h3>";
	}



%>
<%= headerStartTag %> ${title} <%= headerEndTag  %>>