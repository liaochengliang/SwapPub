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
		//��ȡ�û�ID
		User user = (User)request.getSession().getAttribute("user");
		int belong_user = user.getId();
		//��ȡ��Ʒ��Ϣ
		String goodName = null;//�û���
		int hs_consumption = 0;//��ȡ��Ʒ�۸�
		String description = null;//��ȡ��Ʒ����
		String fileName = null;//�ļ���
		String g_img = null;//�ļ�·��
		int s_category = 0;
		int g_category = 0;
		//�ϴ�
		try {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart) {//�ж�ǰ̨��form�Ƿ���multipart����
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
			while(iter.hasNext()){
				FileItem item = iter.next();
				String itemName = item.getFieldName();//��ͨ�ֶ�
				if(item.isFormField()) {//���ϴ�
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
						System.out.println("�����ֶ�");
					}
				}else {//�ļ��ϴ�
					//���ļ���
					fileName = item.getName();//��ȡ�ļ���
					g_img = "img/goods_img/"+fileName;
					//��ȡ�ļ����ݲ��ϴ�
					//ָ���ϴ�·��
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
		//������Ʒ
	
		Goods goods = new Goods(belong_user,goodName,hs_consumption,g_img,description,s_category,g_category);
		//������Ʒ�����ݿ�
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
