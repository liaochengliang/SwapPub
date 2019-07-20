<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.service.AppointsService"%>
<%@ page import="com.service.UserService"%>
<%@ page import="com.service.GoodsService"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.Appoint"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.entity.Goods"%>
<%@ page import="com.entity.Appoint"%>
<%@ page import="com.dao.UsersDao"%>
<%@ page import="com.dao.GoodsDao"%>
<%@ page import="com.dao.AppointsDao"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>管理员页面</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
	
		
	<a href="homepage.jsp">返回首页</a>
	
	
	<!-- 管理功能列表 -->
	<ul id="myTab" class="nav nav-tabs">
		<li class="active">
			<a href="#user" data-toggle="tab">用户管理</a>
		</li>
		<li>
			<a href="#goods" data-toggle="tab">商品管理</a>
		</li>
		<li>
			<a href="#appoint" data-toggle="tab">约定管理</a>
		</li>
		<li>
			<a href="#message" data-toggle="tab">留言管理</a>
		</li>	
	</ul>
	
	<div id="myTabContent" class="tab-content">
	<!-- 用户管理 -->
		<div class="tab-pane fade in active" id="user">
			<table class="table table-bordered table-hover table-striped table-condensed">
			<tr class="active">
				<td>用户名</td>
				<td>性别</td>
				<td>电话</td>
				<td>邮箱</td>
				<td>积分</td>
				<td>操作</td>
			</tr>
			<%
			//获取所有用户
			UsersDao usersDao = new UsersDao();
			ArrayList AU = usersDao.selectAllUser();
			for(int i=0;i<AU.size();i++){
				User user = (User)AU.get(i);
				
			%>
			<tr class="alert-info">
				<td><%=user.getUsername()%></td>
				<td><%=user.getSex()%></td>
				<td><%=user.getTelephone()%></td>
				<td><%=user.getEmail()%></td>
				<td><%=user.getHonorScore()%></td>
				<td>
					<a href="#">修改</a>
					<a href="#">删除</a>
				</td>
			</tr>
			<%} %>
			</table>
		</div>
	<!-- 商品管理 -->
		<div class="tab-pane fade" id="goods">
			<table class="table table-bordered table-hover table-striped table-condensed">
			<tr class="active">
				<td>商品名</td>
				<td>价值</td>
				<td>发布日期</td>
				<td>操作</td>
			</tr>
			<%
			//获取所有商品
			GoodsDao goodsDao = new GoodsDao();
			ArrayList AG = goodsDao.selectAllGoods();
			for(int i=0;i<AG.size();i++){
				Goods goods = (Goods)AG.get(i);
				
			%>
			<tr class="alert-info">
				<td><%=goods.getGoodName()%></td>
				<td><%=goods.getHs_consumption()%></td>
				<td><%=goods.getDate()%></td>
				<td>
					<a href="#">修改</a>
					<a href="#">删除</a>
				</td>
			</tr>
			<%} %>
			</table>
		</div>
	<!-- 约定管理 -->
		<div class="tab-pane fade" id="appoint">
			<table class="table table-bordered table-hover table-striped table-condensed">
			<tr class="active">
				<td>请求者</td>
				<td>请求者商品</td>
				<td>被请求者</td>
				<td>被请求者商品</td>
				<td>请求状态</td>
				<td>操作</td>
			</tr>
			<%
			//获取所有约定
			AppointsDao appintsDao = new AppointsDao();
			ArrayList AA = appintsDao.SelectAllAppoints();
			for(int i=0;i<AA.size();i++){
				Appoint appoint = (Appoint)AA.get(i);
				
			%>
			<tr class="alert-info">
				<td><%=appoint.getUser_id_1()%></td>
				<td><%=appoint.getGood_id_1()%></td>
				<td><%=appoint.getUser_id_2()%></td>
				<td><%=appoint.getGood_id_2()%></td>
				<td><%=appoint.getState()%></td>
				<td>
					<a href="#">修改</a>
					<a href="#">删除</a>
				</td>
			</tr>
			<%} %>
			</table>
		</div>
	<!-- 留言管理 -->
		<div class="tab-pane fade" id="message">
			
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>