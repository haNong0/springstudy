package com.lec.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LogincheckFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("init()메서드 호출 !!!");
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("doFilter()메서드 호출 !!!");
		HttpServletRequest  httpreq = (HttpServletRequest) req;
		HttpSession sess = httpreq.getSession();
		
		boolean login = false;
		if(sess != null) {
			if(sess.getAttribute("member") != null) login = true;
		}
		if(login) {
			chain.doFilter(req, res);
		}else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/login/jsp02_login_form.jsp");
			dispatcher.forward(req, res);
		}
	}
}
