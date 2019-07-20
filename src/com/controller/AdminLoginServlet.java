package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Admin;
import com.entity.User;
import com.service.AdminService;
import com.service.UserService;

public class AdminLoginServlet extends HttpServlet {
	
    public AdminLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理管理员登录请求
		request.setCharacterEncoding("utf-8");
		String adminName=request.getParameter("adminName");
		String password=request.getParameter("password");
		Admin admin=new Admin(adminName,password);
		if(AdminService.login(admin)) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			response.sendRedirect("adminpage.jsp");
		}
		else {
			response.sendRedirect("admin_login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
