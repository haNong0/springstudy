package com.lec.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.command.CommandHandler;

public class ControllerUsingURI extends HttpServlet {
	
	private Map<String, CommandHandler> handler = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		String controllerFile = getInitParameter("controllerURI");
		String controllerFilePath = getServletContext().getRealPath(controllerFile);
		System.out.println(controllerFile);
		System.out.println(controllerFilePath);
		
		Properties prop = new Properties();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, res);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, res);
	}
}
