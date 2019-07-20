package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.entity.Goods;
import com.entity.User;
import com.service.GoodsService;

public class GoodsSave extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		//获取用户ID
		User user = (User)request.getSession().getAttribute("user");
		int belong_user = user.getId();
		//获取商品信息
		String goodName = null;//用户名
		int hs_consumption = 0;//获取商品价格
		String description = null;//获取商品描述
		String fileName = null;//文件名
		String g_img = null;//文件路径
		int s_category = 0;
		int g_category = 0;
		//上传
		try {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart) {//判断前台的form是否有multipart属性
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
			while(iter.hasNext()){
				FileItem item = iter.next();
				String itemName = item.getFieldName();//普通字段
				if(item.isFormField()) {//表单上传
					if(itemName.equals("hs_consumption")) {
						hs_consumption = Integer.parseInt(item.getString("UTF-8"));
					}else if(itemName.equals("goodName")) {
						goodName = item.getString("UTF-8");
					}else if(itemName.equals("description")) {
						description = item.getString("UTF-8");
					}else if(itemName.equals("s_category")) {
						s_category = Integer.parseInt(item.getString("UTF-8"));
					}else if(itemName.equals("g_category")) {
						g_category = Integer.parseInt(item.getString("UTF-8"));
					}
					else {
						System.out.println("其他字段");
					}
				}else {//文件上传
					//拿文件名
					fileName = item.getName();//获取文件名
					g_img = "img/goods_img/"+fileName;
					//获取文件内容并上传
					//指定上传路径
					String path = "E:\\workspace\\swap_pub\\WebContent\\img\\goods_img";
					File file = new File(path,fileName);
					item.write(file);
				}			
			}	
			} 
		}
		catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//构造商品
	
		Goods goods = new Goods(belong_user,goodName,hs_consumption,g_img,description,s_category,g_category);
		//保存商品至数据库
		boolean result=GoodsService.GoodsSave(goods);
		
		if(result) {
			response.sendRedirect("my_publish.jsp");
		}else {
			response.sendRedirect("goods_publish.jsp");
		}	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
