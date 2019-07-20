package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.User;
import com.service.UserService;

public class RegisteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//´¦Àí×¢²á
		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String sex=request.getParameter("sex");
		String telephone=request.getParameter("telephone");
		String email=request.getParameter("email");
		String img=request.getParameter("img");
		User user=new User(username,password,sex,telephone,email,img);
		//
		boolean result=UserService.registe(user);
		if(result) {
			response.sendRedirect("registeOK.jsp");
		}else {
			response.sendRedirect("user_registe.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
