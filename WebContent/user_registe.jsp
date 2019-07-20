<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>用户注册</title>
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
				<form action="RegisteServlet" method="post"> 
					<div class="register-top-grid">
						<h3>注册新用户</h3>
						<div class="input">
							<span>用户名 <label style="color:red;">*</label></span>
							<input type="text" name="username" placeholder="请输入用户名" required="required"> 
						</div>
						<div class="input">
							<span>密码 <label style="color:red;">*</label></span>
							<input type="text" name="password" placeholder="请输入密码" required="required"> 
						</div>
						<div class="input">
							<span>性别<label></label></span>
							<input type="text" name="sex" placeholder="输入性别"> 
						</div>
						<div class="input">
							<span>手机号<label></label></span>
							<input type="text" name="telephone" placeholder="请输入手机号"> 
						</div>
						<div class="input">
							<span>邮箱<label></label></span>
							<input type="text" name="email" placeholder="请输入邮箱"> 
						</div>
						<div class="input">
							<span>图片<label></label></span>
							<input type="text" name="img" placeholder="选择图片"> 
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="register-but text-center">
					   <input type="submit" value="提交">
					   <div class="clearfix"> </div>
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