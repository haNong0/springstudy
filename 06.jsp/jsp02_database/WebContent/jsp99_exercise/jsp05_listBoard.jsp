<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<h1>게시글목록조회</h1>
	<div class="row"> 
	<table class="table table-border table -hover">
	<tr>
		<td>게시글번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>내용</td>
		<td>삭제</td>
	</tr>
	<%
	Class.forName("org.mariadb.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs =null;

String url = "jdbc:mariadb://localhost:3306/jspstudy";
String usr = "root";
String pwd = "12345";
String sql = "select * from board order by bno desc";

try {
	conn = DriverManager.getConnection(url, usr, pwd);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	
	while(rs.next()) {
		int bno = rs.getInt("bno");
		String subject = rs.getString("subject");
		String content = rs.getString("content");
		String writer = rs.getString("writer");
%>
		<tr>
			<td><a href="jsp02_updateForm.jsp?bno=<%= bno %>"></a></td>
			<td><%= subject %></td>
			<td><%= content %></td>
			<td><%= writer %></td>
			<td><a href="jsp03_deleteForm.jsp?bno=<%= bno %>" class="btn btn-danger">삭제</a></td>
		</tr>
<%		
	}
} catch(Exception e) {
	out.println("<h3 class='bg-danger text-white'>DB접속실패!!</h3><br>" 
			+ e.getMessage());		

} finally {
	try {
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} catch(Exception e) {
		// dummy
	}
}
%>
</table>
<a href="jsp01_insertForm.jsp" class="btn btn-primary mt-sm-2">회원등록</a>
</div>

	
	
</body>
</html>