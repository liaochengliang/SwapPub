package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Appoint;
import com.entity.Goods;
import com.entity.User;
import com.service.AppointsService;
import com.service.GoodsService;

public class SwapServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int flag = Integer.parseInt(request.getParameter("flag"));
		int good_id_1 = Integer.parseInt(request.getParameter("good_id_1"));
		int good_id_2 = Integer.parseInt(request.getParameter("good_id_2"));
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Goods goods = GoodsService.GoodsShow(good_id_2);//获取当前物品信息储存于goods中
		int user_id_1 = user.getId();
		int user_id_2 = goods.getBelong_user();
		
		int state = flag;
		Appoint appoint = new Appoint(user_id_1, user_id_2, good_id_1,good_id_2, state);
	
		if(AppointsService.addAppoints(appoint)) {
			response.sendRedirect("myInform.jsp");
		}else {
			response.getWriter().print("请求失败");
		}
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
