<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.service.GoodsService"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.Goods"%>
<%@ page import="com.entity.UgCorrelation"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>我的发布</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<script type="text/javascript" src="js/simpleCart.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h3>我的发布</h3>
	<%
     ArrayList G = GoodsService.GoodsShow();//获取所有物品信息储存于数组G中
     User user = (User)session.getAttribute("user");
     int user_id = user.getId();   
    %>
    <!--//single-page-->
	<div class="single">
		<div class="container">
		
		<% for(int i=0;i<G.size();i++){
			Goods goods = (Goods)G.get(i);
	    	 if(goods.getBelong_user()!=user_id){
	    		 continue;
	    	 } 
	  		 %>
		
			<div class="single-grids" >			
				<div class="col-md-2 single-grid" >		
					<div class="flexslider">
						<ul class="slides">
							<li>
								<div style="width:100px"> <img src=<%=goods.getG_img()%> height="130px" width="100px"></div>
							</li>
						</ul>
					</div>
				</div>
					
				<div class="col-md-7 single-grid simpleCart_shelfItem" style="border:1px solid black;height:130px">		
					<h3><%=goods.getGoodName() %></h3>
					<div class="tag">
						<p>分类 : <a href=""><%=goods.getType(goods.getG_category()) %></a></p>
					</div>
					<p>介绍: <%=goods.getDescription() %></p>
				</div>
				
				<div class="col-md-2 single-grid simpleCart_shelfItem" style="border:1px solid black;height:130px">		
					<div style="height:30px">
						<a href="" >修改</a>
					</div>
					<div style="height:30px">
						<a href="">删除</a>
					</div>
					
				</div>
				<div class="clearfix"> </div>
			</div>
		
			<%} %>
		
		
		</div>
	</div>
       
</body>
</html>