<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.io.File"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String fileName = request.getParameter("fn");
	
	String src = "D:/이종훈/06.jsp/jsp09_board/webcontent/boardupload" + fileName;
	String des =" D:/이종훈/06.jsp/jsp09_board/webcontent/download";
	
	File srcFile = new File(src);
	File desDir = new File(des);
	
	FileUtils.copyFileToDirectory(srcFile, desDir);
	
	out.println("<h3>파일이 성공적으로 다운로드 되었습니다!!");
%>
<script>
	alert('파일이 성공적으로 다운로드 되었습니다!!');
	location.go(-1);
</script>