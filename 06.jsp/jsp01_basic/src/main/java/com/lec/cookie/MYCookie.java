package com.lec.cookie;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class MYCookie {
	
	private Map<String, Cookie> map = new HashMap<>();
	   
	   public MYCookie(HttpServletRequest req) {
	      Cookie[] cookies = req.getCookies();
	      if(cookies != null)  {
	         for(int i=0;i<cookies.length;i++) {
	            map.put(cookies[i].getName(), cookies[i]);
	         }
	      }
	   }
	   
	   public Cookie getCookie(String name) {
	      return map.get(name);
	   }
	   
	   public String getValue(String name) throws Exception {
	      Cookie cookie = map.get(name);
	      if(cookie == null) return null;
	      return URLDecoder.decode(cookie.getValue(), "utf-8");
	   }
	   
	   public boolean exists(String name) {
	      return map.get(name) != null;
	   }
	   
	   public static Cookie createCookie(String name, String value) throws Exception {
	      return new Cookie(name, URLEncoder.encode(value, "utf-8"));
	   }
	   
	   public static Cookie createCookie(String name, String value, String path, int maxAge) throws Exception {
	      Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
	      cookie.setPath(path);
	      cookie.setMaxAge(maxAge);
	      return cookie;
	   }
	   
	   public static Cookie createCookie(String name, String value, String path, String domain, int maxAge) throws Exception {
	      Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
	      cookie.setPath(domain);
	      cookie.setPath(path);
	      cookie.setMaxAge(maxAge);
	      return cookie;
	   }
}
