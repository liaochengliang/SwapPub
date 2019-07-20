package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Message;
import com.service.MessageService;

public class AddMessageServlet extends HttpServlet {
       
    public AddMessageServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int mess_from_id =Integer.parseInt(request.getParameter("mess_from_id"));
		String tmp = request.getParameter("mess_to_id");
		int mess_to_id =Integer.parseInt(tmp);
		String mess_text=request.getParameter("content");
		
		Message message = new Message(mess_from_id,mess_to_id,mess_text);
		System.out.println(message.getMess_from_id());
		System.out.println(message.getMess_text());
		System.out.println(message.getMess_to_id());
		boolean rs = MessageService.addMessage(message);
		if(rs){
			HttpSession session = request.getSession();
			session.setAttribute("goods_id", tmp);
			response.sendRedirect("goods_detail.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
