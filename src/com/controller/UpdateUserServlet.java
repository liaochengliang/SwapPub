package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;
import com.service.UserService;

public class UpdateUserServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理修改信息的请求
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password=request.getParameter("password");
		if(id!=null){
			String username=request.getParameter("username");
			String sex=request.getParameter("sex");
			String telephone=request.getParameter("telephone");
			String email=request.getParameter("email");
			String img=request.getParameter("img");
			User user=new User(Integer.parseInt(id),username,sex,telephone,email,img);
			user = UserService.UpdateUser(user);
			user = UserService.selectUserById(Integer.parseInt(id));
			session.setAttribute("user", user);
		}
		if(password!=null){
			String passwordNew=request.getParameter("passwordNew");
			User u = (User)session.getAttribute("user");
			String p = u.getPassword();
			if(password.equals(p)) {
				u.setPassword(passwordNew);
				u = UserService.UpdatePassword(u);
				session.setAttribute("user", u);
			}
				
		}
		response.sendRedirect("person_center.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
