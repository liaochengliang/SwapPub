package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.AppointsService;
import com.service.UserService;

public class AgreeRequServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int appoint_id = Integer.parseInt(request.getParameter("appoint_id"));
		int user_id_1 = Integer.parseInt(request.getParameter("user_id_1"));
		int user_id_2 = Integer.parseInt(request.getParameter("user_id_2"));
		int flag = Integer.parseInt(request.getParameter("flag"));
		if(flag==1) {
			if(AppointsService.updateAppoints(appoint_id,1)&&UserService.addHonorScoreById(user_id_1, 50)&&UserService.addHonorScoreById(user_id_2, 50)) {
				response.sendRedirect("myAppoint.jsp");
			}
		}else if(flag==2){	
			if(AppointsService.updateAppoints(appoint_id,2)) {
				response.sendRedirect("myAppoint.jsp");
			}
		}	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
