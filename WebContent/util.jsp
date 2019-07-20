<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.service.GoodsService"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.Goods"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<div class="container">

	<%ArrayList G = GoodsService.GoodsShow();//获取所有物品信息储存于数组G中 %>
     
     <form action="" class="containter input-group col-md-3" style="margin-top:60px;positon:relative;width:95%;height:50px;background:gray">
       	<input type="text" class="form-control" style="height:100%; width:90%" placeholder="请输入字段名" name="keywords">
        <input type="submit" style="height:100%; width:10%;background:#F07818" value="搜索">         
     </form>
	
	<% //接收数据
	String keywords=null;
	request.setCharacterEncoding("utf-8");
	keywords=request.getParameter("keywords");
	%>
	
	<ul id="myTab" class="nav nav-tabs">
		<li class="active">
			<a href="#allGoods" data-toggle="tab">全部</a>
		</li>
		<li>
			<a href="#books" data-toggle="tab">书籍</a>
		</li>
		<li>
			<a href="#houseware" data-toggle="tab">家用品</a>
		</li>
		<li>
			<a href="#bags" data-toggle="tab">箱包</a>
		</li>
		<li>
			<a href="#eproduct"  data-toggle="tab">电子产品</a>
		</li>
		<li>
			<a href="#sports" data-toggle="tab">运动用品</a>
		</li>
		<li>
			<a href="#" data-toggle="tab">手机</a>
		</li>
		<li>
			<a href="#" data-toggle="tab">数码</a>
		</li>
		<li>
			<a href="#" data-toggle="tab">服装</a>
		</li>
		<li>
			<a href="#" data-toggle="tab">家电</a>
		</li>
		<li>
			<a href="#" data-toggle="tab">玩具</a>
		</li>
		<li>
			<a href="#" data-toggle="tab">乐器</a>
		</li>
		<li>
			<a href="#" data-toggle="tab">XX</a>
		</li>
		<li>
			<a href="#" data-toggle="tab">XX</a>
		</li>
		<li>
			<a href="#" data-toggle="tab">XX</a>
		</li>
		<li>
			<a href="#" data-toggle="tab">XX</a>
		</li>
		
		<li class="dropdown">
			<a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">其他
				<b class="caret"></b>
			</a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
				<li><a href="#" tabindex="-1" data-toggle="tab">XX</a></li>
				<li><a href="#" tabindex="-1" data-toggle="tab">XX</a></li>
				<li><a href="#" tabindex="-1" data-toggle="tab">XX</a></li>
				<li><a href="#" tabindex="-1" data-toggle="tab">XX</a></li>
				<li><a href="#" tabindex="-1" data-toggle="tab">XX</a></li>
				<li><a href="#" tabindex="-1" data-toggle="tab">XX</a></li>
			</ul>
		</li>
	</ul>
	 
	 <div id="myTabContent" class="tab-content">
	 	<!-- 全部 -->
		<div class="tab-pane fade in active" id="allGoods">
			
			<div class="product-model-sec" style="width:100%">
			<%for(int i=0;i<G.size();i++){
			   Goods goods = (Goods)G.get(i);
			   String s=goods.getGoodName();
			   if(keywords!=null){
				   if(!s.contains(keywords)){
					   continue;
				   }
			   }
			   %>	 
			<div class="product-grid">
					<a href="#">				
						<div class="more-product"><span> </span></div>						
						<div class="product-img b-link-stripe b-animate-go  thickbox" >
							<img src=<%=goods.getG_img()%> width="240" height="240">
							<div class="b-wrapper">
								<h4 class="b-animate b-from-left  b-delay03">
									<a href="goods_detail.jsp?id=<%=goods.getId()%>">
									<button >查看详情</button>
									</a>								
								</h4>
							</div>
						</div>
					</a>				
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4 style="height:20px"><%=goods.getGoodName()%></h4>								
							<span class="item_price"><%=goods.getHs_consumption()%></span>
							<input type="button" class="item_add items" value="<%=goods.getSwapType()%>" onclick="window.location.href='goods_swap.jsp?id=<%=goods.getId()%>'">
						</div>												
					</div>
				</div>
			
			<%} %>
			</div>	
		
		</div>
	 
	 	<!-- 书籍类 -->
		<div class="tab-pane fade" id="books">
			<div class="container">
			 <div class="product-model-sec" style="width:100%">
			<%for(int i=0;i<G.size();i++){
		    Goods goods = (Goods)G.get(i);
		    if(goods.getG_category()!=1){
		    	continue;
		    }
		   %>	 
			<div class="product-grid">
				<a href="#">				
					<div class="more-product"><span> </span></div>						
					<div class="product-img b-link-stripe b-animate-go  thickbox" >
						<img src=<%=goods.getG_img()%> width="240" height="240">
						 <div class="b-wrapper">
							<h4 class="b-animate b-from-left  b-delay03">
								<a href="goods_detail.jsp?id=<%=goods.getId()%>">
								<button >查看详情</button>
								</a>								
							</h4>
						</div>
					</div>
				</a>				
				<div class="product-info simpleCart_shelfItem">
					<div class="product-info-cust prt_name">
						<h4 style="height:20px"><%=goods.getGoodName()%></h4>								
						<span class="item_price"><%=goods.getHs_consumption()%></span>
						<input type="button" class="item_add items" value="交换" onclick="window.location.href='goods_swap.jsp?id=<%=goods.getId()%>'">
						<div class="clearfix"> </div>
					</div>												
				</div>
			</div>
		
			<%} %>
			
			<div class="clearfix"> </div>
			</div>
			</div>		
		</div>
		
	 	<!--家用品  -->
		<div class="tab-pane fade" id="houseware">
			<div class="container">
			 <div class="product-model-sec" style="width:100%">
			<%for(int i=0;i<G.size();i++){
		    Goods goods = (Goods)G.get(i);
		    if(goods.getG_category()!=2){
		    	continue;
		    }
		   %>	 
			<div class="product-grid">
				<a href="#">				
					<div class="more-product"><span> </span></div>						
					<div class="product-img b-link-stripe b-animate-go  thickbox" >
						<img src=<%=goods.getG_img()%> width="240" height="240">
						<div class="b-wrapper">
							<h4 class="b-animate b-from-left  b-delay03">
								<a href="goods_detail.jsp?id=<%=goods.getId()%>">
								<button >查看详情</button>
								</a>								
							</h4>
						</div>
					</div>
				</a>				
				<div class="product-info simpleCart_shelfItem">
					<div class="product-info-cust prt_name">
						<h4 style="height:20px"><%=goods.getGoodName()%></h4>								
						<span class="item_price"><%=goods.getHs_consumption()%></span>
						<input type="button" class="item_add items" value="交换" onclick="window.location.href='goods_swap.jsp?id=<%=goods.getId()%>'">
						<div class="clearfix"> </div>
					</div>												
				</div>
			</div>
		
			<%} %>
			
			<div class="clearfix"> </div>
			</div>
			</div>
		</div>
		
		<!-- 箱包 -->	
		<div class="tab-pane fade" id="bags">
			<div class="container">
			 <div class="product-model-sec" style="width:100%">
			<%for(int i=0;i<G.size();i++){
		    Goods goods = (Goods)G.get(i);
		    if(goods.getG_category()!=3){
		    	continue;
		    }
		   %>	 
			<div class="product-grid">
				<a href="#">				
					<div class="more-product"><span> </span></div>						
					<div class="product-img b-link-stripe b-animate-go  thickbox" >
						<img src=<%=goods.getG_img()%> width="240" height="240">
						<div class="b-wrapper">
							<h4 class="b-animate b-from-left  b-delay03">
								<a href="goods_detail.jsp?id=<%=goods.getId()%>">
								<button >查看详情</button>
								</a>								
							</h4>
						</div>
					</div>
				</a>				
				<div class="product-info simpleCart_shelfItem">
					<div class="product-info-cust prt_name">
						<h4 style="height:20px"><%=goods.getGoodName()%></h4>								
						<span class="item_price"><%=goods.getHs_consumption()%></span>
						<input type="button" class="item_add items" value="交换" onclick="window.location.href='goods_swap.jsp?id=<%=goods.getId()%>'">
						<div class="clearfix"> </div>
					</div>												
				</div>
			</div>
		
			<%} %>
			
			<div class="clearfix"> </div>
			</div>
			</div>		
		</div>
		
		<!-- 电子产品 -->
		<div class="tab-pane fade" id="eproduct">
			<div class="container">
			 <div class="product-model-sec" style="width:100%">
			<%for(int i=0;i<G.size();i++){
		    Goods goods = (Goods)G.get(i);
		    if(goods.getG_category()!=4){
		    	continue;
		    }
		   %>	 
			<div class="product-grid">
				<a href="#">				
					<div class="more-product"><span> </span></div>						
					<div class="product-img b-link-stripe b-animate-go  thickbox" >
						<img src=<%=goods.getG_img()%> width="240" height="240">
						<div class="b-wrapper">
							<h4 class="b-animate b-from-left  b-delay03">
								<a href="goods_detail.jsp?id=<%=goods.getId()%>">
								<button >查看详情</button>
								</a>								
							</h4>
						</div>
					</div>
				</a>				
				<div class="product-info simpleCart_shelfItem">
					<div class="product-info-cust prt_name">
						<h4 style="height:20px"><%=goods.getGoodName()%></h4>								
						<span class="item_price"><%=goods.getHs_consumption()%></span>
						<input type="button" class="item_add items" value="交换" onclick="window.location.href='goods_swap.jsp?id=<%=goods.getId()%>'">
						<div class="clearfix"> </div>
					</div>												
				</div>
			</div>
		
			<%} %>
			
			<div class="clearfix"> </div>
			</div>
			</div>	
		</div>
		
		<!-- 运动用品 -->
		<div class="tab-pane fade" id="sports">
			<div class="container">
			 <div class="product-model-sec" style="width:100%">
			<%for(int i=0;i<G.size();i++){
		    Goods goods = (Goods)G.get(i);
		    if(goods.getG_category()!=5){
		    	continue;
		    }
		   %>	 
			<div class="product-grid">
				<a href="#">				
					<div class="more-product"><span> </span></div>						
					<div class="product-img b-link-stripe b-animate-go  thickbox" >
						<img src=<%=goods.getG_img()%> width="240" height="240">
						<div class="b-wrapper">
							<h4 class="b-animate b-from-left  b-delay03">
								<a href="goods_detail.jsp?id=<%=goods.getId()%>">
								<button >查看详情</button>
								</a>								
							</h4>
						</div>
					</div>
				</a>				
				<div class="product-info simpleCart_shelfItem">
					<div class="product-info-cust prt_name">
						<h4 style="height:20px"><%=goods.getGoodName()%></h4>								
						<span class="item_price"><%=goods.getHs_consumption()%></span>
						<input type="button" class="item_add items" value="交换" onclick="window.location.href='goods_swap.jsp?id=<%=goods.getId()%>'">
						<div class="clearfix"> </div>
					</div>												
				</div>
			</div>
		
			<%} %>
			
			<div class="clearfix"> </div>
			</div>
			</div>	
		</div>
	
	</div>
	  
</div>
</body>
</html>