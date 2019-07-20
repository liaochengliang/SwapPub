<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>商品添加</title>
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
	<br><br>
	<!-- enctype="multipart/form-data" -->
	<form class="form-horizontal" action="GoodsSave" method="post" enctype="multipart/form-data">
		
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="goodName"  required="required">
			</div>
		</div>
		
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">积分值</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="hs_consumption" >
			</div>
		</div>
		
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">介绍</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="description" >
			</div>
		</div>
		
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">商品类别</label>
			<label class="checkbox-inline"><input type="radio" name="g_category" value=1>书籍</label>
			<label class="checkbox-inline"><input type="radio" name="g_category" value=2>家用品</label>
			<label class="checkbox-inline"><input type="radio" name="g_category" value=3>箱包</label>
			<label class="checkbox-inline"><input type="radio" name="g_category" value=4>电子产品</label>
			<label class="checkbox-inline"><input type="radio" name="g_category" value=4>运动用品</label>
		</div>
		
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">交易类别</label>
			<label class="checkbox-inline"><input type="radio" name="s_category" value=1>交换</label>
			<label class="checkbox-inline"><input type="radio" name="s_category" value=2>赠送</label>
			<label class="checkbox-inline"><input type="radio" name="s_category" value=3>积分</label>
			<label class="checkbox-inline"><input type="radio" name="s_category" value=4>变卖</label>	
		</div>
		
		<div class="form-group">
			<label for="input_file" class="col-sm-1 control-label">商品图片</label> 
			<div class="col-sm-6">
				<input type="file" name="cover"  id="input_file" required="required">推荐尺寸: 500 * 500
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-1 col-sm-10">
				<button type="submit" class="btn btn-success">提交保存</button>
			</div>
		</div>
	</form>

</body>
</html>