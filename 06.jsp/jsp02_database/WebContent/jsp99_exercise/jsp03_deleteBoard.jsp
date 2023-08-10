<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int bno = Integer.parseInt(request.getParameter("bno"));


Class.forName("org.mariadb.jdbc.Driver");
Connection conn = null;
PreparedStatement pstmt = null;	
// 실습 업데이트 로직 완성하기
String url = "jdbc:mariadb://localhost:3306/jspstudy";
String usr = "root";
String pwd = "12345";
String sql = "delete board from board where bno = ?";

int deleteCount = 0;
boolean isDelete = true;

try {
	conn = DriverManager.getConnection(url, usr, pwd);
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, bno);	
	deleteCount = pstmt.executeUpdate();	
} catch(Exception e) {	
	isDelete = false;
	out.println("<h3 class='bg-danger text-white'>DB접속실패!!</h3><br>" 
			+ e.getMessage());		
} finally {
	try {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	} catch(Exception e) {
		// dummy
	}
}	

%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원삭제결과</h1>
	<%= request.getParameter("bno") %>
	
	<div class="container" align = "center">
		<h1>회원정보 삭제</h1>
	
		<hr />
		
		<%
			if(deleteCount > 0) {
		%>
				<h3 class="bg-info text-white"><%= bno %>회원의 정보가 성공적으로 삭제되었습니다!!</h3>
		<%
			} else {
		%>
				<h3 class="bg-danger text-white">회원정보삭제실패!! <%= bno %>를 찾지 못했습니다!</h3>
		<%
			}			
		%>
		<a href="jsp05_listBoard.jsp" class= "btn btn=primary">ㅇㅇ</a>
	</div>
</body>
</html>