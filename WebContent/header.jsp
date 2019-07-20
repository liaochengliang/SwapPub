<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<h1 class="navbar-brand"><a href="homepage.jsp">换吧</a></h1>
				</div>
				<!--navbar-header-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="homepage.jsp">首页</a></li>
						<li><a href="aboutUs.jsp" target="_blank">关于</a></li>			
						
						<c:if test="${sessionScope.user==null}">
							<li><a href="user_registe.jsp">注册</a></li>
							<li><a href="user_login.jsp">登录</a></li>
						</c:if>
						<c:if test="${sessionScope.user!=null}">
	
							<li><a href="myInform.jsp">我的通知</a></li>
							<li><a href="myAppoint.jsp">我的约定</a></li>
							<li><a href="my_publish.jsp">我的闲置</a></li>						
							<li><a href="goods_publish.jsp" >我要发布</a></li>
							<li><a href="ExitServlet">退出</a></li>
						</c:if>
						
					</ul> 
					<!--/.navbar-collapse-->
				</div>
				<!--//navbar-header-->
			</nav>
			<div class="header-info">
			<!--  
				<div class="header-right cart">
					<a href="mylike.jsp">
						<span class="glyphicon glyphicon-heart" aria-hidden="true"><span class="card_num"></span></span>
					</a>
				</div>
			-->
				<div class="header-right login">
					<%if(session.getAttribute("user")!=null){%>
					<a href="person_center.jsp">
					<span class="glyphicon glyphicon-user" aria-hidden="true">${sessionScope.user.username}</span>
					</a>
					<%}else{%>
					<a href="user_login.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
					<%}%>
				</div>
				<%if(session.getAttribute("user")!=null){%>
				<div class="header-right login" style="background:red;height:65px">
					<p style="background:gray;height:50%;width:100%;color:white">积分:${sessionScope.user.honorScore}</p>
					<p style="background:gray;height:50%;width:100%;color:red">${sessionScope.user.getHonorGrade()}</p>
				</div>
				<%}%>	
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!--//header-->
</body>
</html>