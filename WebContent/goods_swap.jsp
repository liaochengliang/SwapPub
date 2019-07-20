<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.service.GoodsService"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.Goods"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>物品交换</title>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	
	<% 
		int id =Integer.parseInt(request.getParameter("id"));
		Goods goods = GoodsService.GoodsShow(id);//获取当前物品信息储存于goods中
	    ArrayList G = GoodsService.GoodsShow();//获取所有物品信息储存于数组G中
	    User user = (User)session.getAttribute("user");
	    int user_id = user.getId();   
	    
	%>
	<h3 style="text-align:center">商品交换</h3>
	<div class="cart-items">
		<div class="container">
			
				<div class="cart-header col-md-6">
					<div class="cart-sec simpleCart_shelfItem">
						<div class="cart-item cyc">
							<a href="goods_detail.jsp">
								<img src=<%=goods.getG_img()%> class="img-responsive">
							</a>
						</div>
						<div class="cart-item-info">
							<h3><a href="goods_detail?id=<%=goods.getId()%>"><%=goods.getGoodName()%></a></h3>
							<h3><span>消耗积分:<%=goods.getHs_consumption()%></span></h3>
							<h3><span>数量:1</span></h3>	
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			
				<div class="cart-header col-md-12">
					<hr>
					<h3>选择你的商品</h3>
					<form action="SwapServlet">
						<select name="good_id_1">
							<% for(int i=0;i<G.size();i++){
								Goods my_goods = (Goods)G.get(i);
		    	 				if(my_goods.getBelong_user()!=user_id){
		    					 continue;
		    	 				}%> 
								<option value="<%=my_goods.getId()%>"><%=my_goods.getGoodName()%></option>
							<%} %>	
						</select>
						<input type="hidden" name="good_id_2" value="<%=id%>">
						<input type="hidden" name="flag" value="0">
						<input type="submit" class="btn btn-success btn-lg" value="发出请求">
					</form>
					</div>
			
		</div>
	</div>

	
	
</body>
</html>