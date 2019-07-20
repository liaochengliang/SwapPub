<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.service.GoodsService"%>
<%@ page import="com.service.UserService"%>
<%@ page import="com.service.MessageService"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.Goods"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.entity.Message"%>
<!DOCTYPE html>
<html>
<head>
	<title>商品详情</title>
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
	<jsp:include page="header.jsp"/>
	<%  String tmp = request.getParameter("id");
		if(tmp!=null){
			session.setAttribute("goods_id",tmp);
		}
		String s=(String)session.getAttribute("goods_id");
		int id = Integer.parseInt(s);
		Goods goods = GoodsService.GoodsShow(id);//获取当前物品信息储存于goods中
		User user = UserService.selectUserById(goods.getBelong_user());
	%>
	<h3 style="text-align:center">商品详情</h3>
	<div class="container">
	<!-- 图片 -->
		<div style="height:400px;width:300px;border:1px solid black;float:left;margin-top:50px">
			<img src=<%=goods.getG_img()%> style="height:100%;width:100%"> 
		
		</div>
	<!-- 商品信息 -->
		<div style="height:400px;width:500px;border:1px solid black;float:left;margin-top:50px">
			<h3><%=goods.getGoodName() %></h3>
			<table class="table table-bordered table-hover table-striped table-condensed">
				<tr class="alert-info">
					<td>主人</td>
					<td><%=user.getUsername()%></td>
				</tr>
				<tr class="alert-info">
					<td>联系电话</td>
					<td><%=user.getTelephone()%></td>
				</tr>
				<tr class="alert-info">
					<td>创建日期</td>
					<td><%=goods.getDate() %></td>
				</tr>
				<tr class="alert-info">
					<td>分类 </td>
					<td><%=goods.getType(goods.getG_category())%></td>
				</tr>
				<tr class="alert-info">
					<td>介绍</td>
					<td><%=goods.getDescription() %></td>
				</tr>
				<tr class="alert-info">
					<td>消耗积分</td>
					<td><%=goods.getHs_consumption() %></td>
				</tr>
				<tr class="alert-info">
					<td>交易方式</td>
					<td>
					<input class="alert-danger" type="button" value="<%=goods.getSwapType()%>" onclick="window.location.href='goods_swap.jsp?id=<%=goods.getId()%>'">
					</td>
				</tr>
			</table>
		</div>
		<!-- 留言板 -->
		<%ArrayList AM = MessageService.selectAllMessage();%>
		
		<div style="height:400px;width:300px;border:1px solid black;float:left;margin-top:50px">
			<h3>留言板</h3>
			<div style="height:230px;width:300px;border:1px solid black;overflow:auto">
				<% 
				for(int i=0;i<AM.size();i++){
				    Message message = (Message)AM.get(i);
				    if(message.getMess_to_id()!=id){
				    	continue;
				    }
				    %>  	
					<p><%=UserService.selectUserById(message.getMess_from_id()).getUsername()%>&ensp;<%=message.getMess_time()%></p>
					<p>&ensp;&ensp;<%=message.getMess_text()%></p>
				<%}%> 
			</div>
	  		 <form action="AddMessageServlet?mess_from_id=${sessionScope.user.id}&mess_to_id=<%=id%>" method="post">
	 			<span><textarea name="content" rows="5" cols="39"></textarea></span>	
	  			<input type="submit" value="发送"/>
	  			<input type="reset" value="重置"/>
  			</form>
  			
		</div>	
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>