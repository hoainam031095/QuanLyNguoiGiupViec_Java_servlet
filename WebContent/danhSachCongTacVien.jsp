<%@page import="common.StringProcess"%>
<%@page import="model.bean.CongTacVien"%>
<%@page import="model.bean.DichVu"%>
<%@page import="java.util.ArrayList"%>
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
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<%@include file="header.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Quản lý cộng tác viên</h1>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Danh sách cộng tác viên</h3>
							</div>
							<!-- /.box-header -->
							<div class="col-md-6">
								<form>
									<label>Chuyên môn</label>
									<div class="form-group">
										<select class="form-control select2" name="maDichVu"
											style="width: 80%; display: inline-block;">
											<option value="">-- Chọn chuyên môn --</option>
											<%
												ArrayList<DichVu> listDV = (ArrayList<DichVu>) request.getAttribute("listDV");
												for (DichVu dv : listDV) {
											%>
											<option value="<%=dv.getMaDichVu()%>"><%=dv.getTenDichVu()%></option>
											<%
												}
											%>
										</select>
										<button type="submit" class="btn btn-success btn-flat"
											style="margin-bottom: 3px;">Lọc</button>
									</div>
								</form>
							</div>
							<div class="box-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Mã CTV</th>
											<th>Họ tên</th>
											<th>Số điện thoại</th>
											<th>Năm sinh</th>
											<th>Địa chỉ</th>
											<th>Chuyên môn</th>
											<th>Trạng thái</th>
											<th>Đánh giá</th>
											<th>Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<CongTacVien> listCTV = (ArrayList<CongTacVien>) request.getAttribute("listCTV");
											for (CongTacVien ctv : listCTV) {
										%>
										<tr class="data">
											<th scope="row"><%=ctv.getMaCongTacVien()%>
											</th>
											<td><%=ctv.getHoTen()%></td>
											<td><%=ctv.getSoDienThoai()%></td>
											<td><%=ctv.getNamSinh()%></td>
											<td><%=ctv.getDiaChi()%></td>
											<td><%=ctv.getTenDichVu()%>
											<td><%=StringProcess.trangThaiCTV(ctv.getTrangThai())%></td>
											<td><input type="hidden" class="rating" data-readonly
												value="<%=ctv.getDanhGia()%>" /></td>
											<td><a href="SuaThongTinCongTacVienServlet" title="Sửa">
													<span class="fa fa-edit"></span>
											</a> &nbsp|&nbsp <a href="" title="Xóa" style="color: red"> <i
													class="fa fa-trash"></i>
											</a></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								 <div class="paging-container" id="tablePaging"></div>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<%@include file="footer.jsp"%>
	</div>
	<script src="components/jQuery/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="components/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>
	<script type="text/javascript" src="components/bootstrap-rating.js"></script>
	<script type="text/javascript" src="components/pagination.js"></script>
	<script type="text/javascript">
	 	$("[name='maDichVu']").val("<%=StringProcess.getVaildString(request.getParameter("maDichVu"))%>");
		$("input").rating();
		$(document).ready(function() {
			load = function() {
				window.tp = new Pagination('#tablePaging',
						{
							itemsCount : $("#example2 tr.data").length,
							onPageSizeChange : function(ps) {
								console.log('changed to ' + ps);
							},
							onPageChange : function(paging) {
								//custom paging logic here
								console.log(paging);
								var start = paging.pageSize
										* (paging.currentPage - 1), end = start
										+ paging.pageSize, $rows = $('#example2')
										.find('.data');

								$rows.hide();

								for (var i = start; i < end; i++) {
									$rows.eq(i).show();
								}
							}
						});
			}

			load();
		});
	</script>
</body>
</html>