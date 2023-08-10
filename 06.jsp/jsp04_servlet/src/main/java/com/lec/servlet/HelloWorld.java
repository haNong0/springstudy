package com.lec.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebServlet("/xxx") 
public class HelloWorld extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			
			out.println("<html>");
			out.println("<head><title>현재시간	</title> </head>");
			out.println("<body>");
			out.println("<h1> 안녕하세요 </h1>");
			out.println("<h1>doGet()호출!!! </h1>");
			
			out.println("<h1> 현재시간(web.xml) </h1>");
			out.println("<h3>"+ new Date() +" </h3>");
			
			out.println("</body>");
			out.println("<>");
			out.println("<>");
			out.println("</html>");
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
	}

}
