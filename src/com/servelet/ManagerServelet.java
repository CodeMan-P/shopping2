package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ProductService;

/**
 * Servlet implementation class ManagerServelet
 */

public class ManagerServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//request.getSession().setAttribute("list", ProductService.getList());
		//request.getRequestDispatcher("/jsp/manager.jsp").forward(request, response);
		String flag = request.getParameter("flag");
		System.out.println(flag);
		switch(flag){
			case "show":
				System.out.println("跳转物资详情页");
				request.getSession().setAttribute("list", ProductService.getList());
				request.getRequestDispatcher("/jsp/proShow.jsp").forward(request, response);
		}
		
	}

}
