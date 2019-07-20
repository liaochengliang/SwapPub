<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.service.AppointsService"%>
<%@ page import="com.service.UserService"%>
<%@ page import="com.service.GoodsService"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.Appoint"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>显示</title>
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
	<h3>我的请求</h3>
	<%
	ArrayList AL = AppointsService.SelectAllAppoints(); 
	//获取当前用户
	User user = (User)session.getAttribute("user");
	int user_id = user.getId();%>
	<table class="table table-bordered table-hover table-striped table-condensed">
	<tr class="active">
		<td>我方</td>
		<td>我的商品</td>
		<td>对方</td>
		<td>对方商品</td>
		<td>状态</td>
	</tr>
	<%//寻找此用户请求的约定
	for(int i=0;i<AL.size();i++){
		Appoint appoint = (Appoint)AL.get(i);
		if(appoint.getState()==0){
			if(appoint.getUser_id_1()==user_id){%>
			<tr class="alert-info">
				<td><%=UserService.selectUserById(appoint.getUser_id_1()).getUsername()%></td>
				<td><%=GoodsService.GoodsShow(appoint.getGood_id_1()).getGoodName()%></td>
				<td><%=UserService.selectUserById(appoint.getUser_id_2()).getUsername()%></td>
				<td><%=GoodsService.GoodsShow(appoint.getGood_id_2()).getGoodName()%></td>
				<td>
					等待对方回应......
				</td>
				
			</tr>
		<%}
		}	
	}
	%>	
	</table>
	
	<h3>被请求消息</h3>
	<table class="table table-bordered table-hover table-striped table-condensed">
		<tr class="active">
			<td>请求者</td>
			<td>请求者商品</td>
			<td>我</td>
			<td>我的商品</td>
			<td>是否同意</td>
		</tr>
		<%//寻找与此用户相关
		for(int i=0;i<AL.size();i++){
			Appoint appoint = (Appoint)AL.get(i);
			if(appoint.getState()==0){
				if(appoint.getUser_id_2()==user_id){%>
					<tr class="alert-info">
					<td><%=UserService.selectUserById(appoint.getUser_id_1()).getUsername()%></td>
					<td><%=GoodsService.GoodsShow(appoint.getGood_id_1()).getGoodName()%></td>
					<td><%=UserService.selectUserById(appoint.getUser_id_2()).getUsername()%></td>
					<td><%=GoodsService.GoodsShow(appoint.getGood_id_2()).getGoodName()%></td>
					<td>
					<a href="AgreeRequServlet?appoint_id=<%=appoint.getId()%>&user_id_1=<%=appoint.getUser_id_1() %>&user_id_2=<%=appoint.getUser_id_2()%>&flag=1">是</a>
					<a href="AgreeRequServlet?appoint_id=<%=appoint.getId()%>&user_id_1=<%=appoint.getUser_id_1() %>&user_id_2=<%=appoint.getUser_id_2()%>&flag=2">否</a>
					</td>
					</tr>
				<%}
			}	
		}%>		
	</table>
</body>
</html>