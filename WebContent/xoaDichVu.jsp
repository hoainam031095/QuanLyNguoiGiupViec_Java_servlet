<%@page import="model.bean.DichVu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>Xóa Dịch vụ</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/style.css" />
<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</head>
<body>
	<%
		DichVu dichVu = (DichVu) request.getAttribute("dichVu");
	%>
	<div class="container">
		<h2>
			Xóa Dịch vụ: <%=dichVu.getTenDichVu()%>
		</h2>
		<br>
		<form action="XoaDichVuServlet?maDichVu=<%=dichVu.getMaDichVu() %>" method="post">
			<div class="col-md-6"></div>
			<div class="row form-group">
				<label class="col-lg-2" style="margin-left: -485px">Mã dịch vụ</label>
				<div class="col-lg-3">
					<input type="text" style="padding: 10px" class=" form-control"
						name="maDichVu" readonly="readonly"
						value="<%=dichVu.getMaDichVu()%>" />
				</div>
			</div>
			<div class="row form-group">
				<label class="col-lg-2">Tên dịch vụ</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" name="tenDichVu"
						value="<%=dichVu.getTenDichVu()%>" />
				</div>
			</div>

			<div class="row form-group">
				<label class="col-lg-2">Đơn giá</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" name="donGia"
						value="<%=dichVu.getDonGia()%>" />
				</div>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Mô tả</label>
				<textarea id="moTa" name="moTa" rows="10" cols="80"
					style="width: 940px; height: 200px;"><%=dichVu.getMoTa()%></textarea>
			</div>

			<div class="row form-group">
				<div class="col-lg-3 col-lg-offset-2">
					<button class="btn btn-primary" type="submit" value="submit"
						name="submit">Xóa</button>
					<input class="btn btn-primary" type="button" value="Quay lại"
						onclick="history.go(-1);" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>