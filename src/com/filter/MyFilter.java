package com.filter;

import java.io.IOException;
import java.net.HttpRetryException;
import java.util.Iterator;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse rep = (HttpServletResponse) arg1;
		req.setCharacterEncoding("utf-8");
		rep.setCharacterEncoding("utf-8");
		HttpSession ss = req.getSession(true);
		String name="";
		name = (String)ss.getAttribute("name");
		String path = req.getServletPath();
		String begin = config.getInitParameter("begin");
		String login = config.getInitParameter("login");
		if(name == null&&!path.endsWith(begin)&&!path.endsWith(login)
				&&!path.endsWith(".js")){
			rep.sendRedirect(req.getContextPath()+begin);
			//rep.sendRedirect(basePath+"index.jsp");
		}else{
			arg2.doFilter(req, rep);			
		}
	}
	//req.getContextPath();//->"/shopping"
	//String realPath = req.getServletContext().getRealPath("/");
	//D:\apache-tomcat-7.0.52\webapps\shopping\
	//String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/";
	FilterConfig config;
	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}

}
