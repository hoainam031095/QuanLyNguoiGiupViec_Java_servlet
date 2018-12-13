<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Starter</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" href="components/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<!-- <link rel="stylesheet" href="components/Ionicons/css/ionicons.min.css"> -->
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.css">
<link rel="stylesheet" href="dist/css/skin-blue.css">


</head>

<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<%@include file="header2.jsp"%>
		<div class="content-wrapper">
		<div class="container">
			<div class="wapper-taikhoan col-lg-8 col-lg-offset-2">
				<h3>Đăng ký tài khoản</h3>
				<br>
				<form action="ThemMoiNguoiDungServlet" method="post" id="form-dangnhap" class="submit-dk-taikhoan">
					<div class="row form-group">
						<label class="col-lg-3 col-lg-offset-1">Họ và tên: </label>
						<div class="col-lg-6">
							<input type="text" class=" form-control" name="hovaten" />
						</div>
					</div>
					<div class="row form-group">
						<label class="col-lg-3 col-lg-offset-1">Số điện thoại: </label>
						<div class="col-lg-6">
							<input type="text" class=" form-control sodienthoai" name="sodienthoai" />
						</div>
					</div>
					<div class="row form-group">
						<label class="col-lg-3 col-lg-offset-1">Mật khẩu: </label>
						<div class="col-lg-6">
							<input type="password" class=" form-control matkhau" name="matkhau" />
						</div>
					</div>
					<div class="row form-group">
						<label class="col-lg-3 col-lg-offset-1">Nhập lại mật khẩu: </label>
						<div class="col-lg-6">
							<input type="password" class=" form-control confimmatkhau" name="nhaplaimatkhau" />
							<span id="dktk-error-confimmk"></span>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-lg-3 col-lg-offset-1">Email: </label>
						<div class="col-lg-6">
							<input type="text" class="form-control" name="email" />
						</div>
					</div>
					<div class="row form-group">
						<div class="col-lg-6 col-lg-offset-4">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-lg-6 col-lg-offset-4">
							<button class="btn btn-primary submit" type="submit" value="submit" name="submit">Tạo tài khoản</button>
							<button class="btn btn-primary" type="reset">Hủy</button>
						</div>
					</div>
					<div class="col-lg-6 col-lg-offset-4 text-dang-ky-tk"><a href="StartServlet">Quay lại đăng nhập</a></div>
				</form>
			</div>
		</div>
		</div>
	<%@include file="footer.jsp"%>
	</div>
	<!-- Bootstrap 3.3.7 -->
	
	<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="jquery/jquery.validate.min.js"></script>
	<script src="components/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="dist/js/taotaikhoan.js" ></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>

	
</body>
</html>