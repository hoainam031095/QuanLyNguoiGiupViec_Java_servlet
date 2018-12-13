<%@page import="model.bean.DichVu"%>
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
form {
	width: 80%;
	margin: 0 auto;
	margin-top: 25px;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<%
		DichVu dichVu = (DichVu) request.getAttribute("dichVu");
	%>
	<div class="wrapper">
		<%@include file="header.jsp"%>
		<div class="content-wrapper">
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">
									Sửa thông tin dịch vụ:
									<%=dichVu.getTenDichVu()%></h3>
							</div>
							<div class="box-body">
								<form action="SuaDichVuServlet" method="post">
									<div class="form-group">
										<label for="maDichVu">Mã dịch vụ</label> <input type="text"
											class="form-control" id="" readonly="readonly"
											name="maDichVu" value="<%=dichVu.getMaDichVu()%>">
									</div>
									<div class="form-group">
										<label for="tenDichVu">Tên dịch vụ</label> <input type="text"
											class="form-control" id="" name="tenDichVu"
											value="<%=dichVu.getTenDichVu()%>">
									</div>

									<div class="form-group">
										<label for="donGia">Đơn giá</label> <input
											type="text" class="form-control" id="" name="donGia"
											value="<%=dichVu.getDonGia()%>">
									</div>
									<div class="form-group">
										<label for="editor1">Mô tả</label>
										<textarea id="editor1" name="editor1" rows="10" cols="80">
												<%=dichVu.getMoTa()%>
                  						</textarea>
									</div>
									<div class="row form-group">
										<div class="col-lg-3 col-lg-offset-2">
											<button class="btn btn-primary" type="submit" value="submit"
												name="submit">Lưu lại</button>
											<input class="btn btn-primary" type="button" value="Quay lại"
												onclick="history.go(-1);" />
										</div>
									</div>
								</form>
							</div>
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
	<script src="components/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(function() {
			// Replace the <textarea id="editor1"> with a CKEditor
			// instance, using default configuration.
			CKEDITOR.replace('editor1')
			//bootstrap WYSIHTML5 - text editor
			// $('.textarea').wysihtml5()
		})
	</script>
</body>

</html>