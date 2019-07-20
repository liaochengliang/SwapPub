<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>管理员登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/simpleCart.min.js"></script>
</head>
<body>
	<!--account-->
	<div class="account">
		<div class="container">
			<div class="register">
				<form action="AdminLoginServlet" method="post"> 
					<div class="register-top-grid">
						<h3>管理员登录</h3>
						<div class="input">
							<span>账户 <label style="color:red;">*</label></span>
							<input type="text" name="adminName" placeholder="请输入账户" required="required"> 
						</div>
						<div class="input">
							<span>密码 <label style="color:red;">*</label></span>
							<input type="text" name="password" placeholder="请输入密码" required="required"> 
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