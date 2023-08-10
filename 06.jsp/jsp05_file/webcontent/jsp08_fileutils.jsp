
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.io.FileUtils"%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

 request.setCharacterEncoding("utf-8");
String fileName = request.getParameter("f");

String src = "C:/Users/ezen/Documents/test/upload/" + fileName;
String des = "C:/Users/ezen/Documents/test/download/" ;

File srcFile = new File(src);
File desDir = new File(des);

FileUtils.copyFileToDirectory(srcFile, desDir);


%>