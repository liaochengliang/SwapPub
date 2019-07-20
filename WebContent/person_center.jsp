<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>个人中心</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/simpleCart.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"/>
	
	<!--account-->
	<div class="account">
		<div class="container">
			<div class="register">
				<form action="UpdateUserServlet" method="post"> 
					<input type="hidden" name="id" value="${sessionScope.user.id}">
					<div class="register-top-grid">
						<h3>个人中心</h3>
						
						<h4>我的信息</h4>
						<div class="input">
							<span>用户名<label></label></span>
							<input type="text" name="username" value="${sessionScope.user.username}" placeholder="请输入姓名"> 
						</div>
						<div class="input">
							<span>性别</span>
							<input type="text" name="sex" value="${sessionScope.user.sex}" placeholder="请输入性别"> 
						</div>
						<div class="input">
							<span>手机号码</span>
							<input type="text" name="telephone" value="${sessionScope.user.telephone}" placeholder="请输入手机号码"> 
						</div>
						
						<div class="input">
							<span>邮箱</span>
							<input type="text" name="email" value="${sessionScope.user.email}" placeholder="请输入邮箱"> 
						</div>
						<div class="input">
							<span>头像</span>
							<input type="text" name="img" value="${sessionScope.user.img}" placeholder="请选择头像"> 
						</div>
						<div class="register-but text-center">
						   <input type="submit" value="提交">
						</div>	
						<hr>
						<h4>安全信息</h4>
						<div class="input">
							<span>原密码</span>
							<input type="text" name="password" placeholder="请输入原密码"> 
						</div>
						<div class="input">
							<span>新密码</span>
							<input type="text" name="passwordNew" placeholder="请输入新密码"> 
						</div>
						<div class="clearfix"> </div>
						<div class="register-but text-center">
						   <input type="submit" value="提交">
						</div>	
					</div>
				</form>
				<div class="clearfix"> </div>
			</div>
	    </div>
	</div>
	<!--//account-->

	<jsp:include page="footer.jsp"/>
	
</body>
</html>