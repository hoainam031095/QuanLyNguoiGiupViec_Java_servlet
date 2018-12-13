<%@page import="common.StringProcess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css"
	href="components/bootstrap-rating.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style type="text/css">
form{
	width: 80%;
	margin: 0 auto;
	margin-top: 25px;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%NguoiDung nguoiDung = (NguoiDung) request.getAttribute("nguoiDung"); %>
	<div class="wrapper">
		<%@include file="header.jsp"%>
		<div class="content-wrapper">
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Sửa thông tin tài khỏan</h3>
							</div>
							<form role="form" action="SuaThongTinTaiKhoanServlet">
								<!-- form start -->
								<!-- <div class="box-body"> -->
								<!-- <div class="form-group">
									<label for="maNguoiDung">Mã Người Dùng</label>  -->
									<input type="hidden"
										name="maNguoiDung" class="form-control" id="maNguoiDung"
										value="<%=nguoiDung.getMaNguoiDung()%>">
								<!-- </div> -->
								<div class="form-group">
									<label for="phone">Số điện thoại</label> <input type="text"
										name="soDienThoai" class="form-control" id="phone"
										value="<%=nguoiDung.getSoDienThoai()%>">
								</div>
								<div class="form-group">
									<label for="name">Tên tài khoản</label> <input type="text"
										name="tenTaiKhoan" class="form-control" id="name"
										value="<%=nguoiDung.getTenTaiKhoan()%>">
								</div>
								<div class="form-group">
									<label for="email">Email</label> <input type="text"
										name="email" class="form-control" id="email"
										value="<%=nguoiDung.getEmail()%>">
								</div>
								<div class="form-group">
									<label for="matKhau">Mật Khẩu</label> <input type="text"
										name="matKhau" class="form-control" id="matKhau"
										value="<%=nguoiDung.getMatKhau()%>">
								</div>
								<div class="form-group">
									<label for="nhomQuyen">nhóm Quyền</label> <input type="text"
										name="nhomQuyen" class="form-control" id="nhomQuyen"
										readonly="readonly" value="<%=StringProcess.nhomQuyen(nguoiDung.getMaQuyen())%>">
								</div>
								<div class="box-footer">
									<button class="btn btn-success" type="submit" value="submit" name="submit">Xác nhận</button>
                					<input class="btn btn-warning" type="button" value="Quay lại" onclick="history.go(-1);" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
		<%@include file="footer.jsp"%>
	</div>
	<script src="components/jQuery/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="components/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>
</body>
</html>