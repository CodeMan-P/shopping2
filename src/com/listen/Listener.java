package com.listen;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class Listener implements HttpSessionListener{

	int count = 0;
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		count++;
		arg0.getSession().getServletContext().setAttribute("count", count);
		System.out.println("新用户上线。当前在线人数"+count);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		count--;
		arg0.getSession().getServletContext().setAttribute("count", count);
		System.out.println("用户下线。当前在线人数"+count);
	}

}
