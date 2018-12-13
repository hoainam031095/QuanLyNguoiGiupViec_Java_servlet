<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="common.StringProcess"%>
<%@page import="model.bean.DangKyDichVu"%>
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<%@include file="header.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="modal fade" id="xnPheDuyet">
				<div class="modal-dialog" id="myModal">
					<div class="modal-content">
						<div class="modal-body">
							<span id="thongbao" style="color: #027bfb; font-size: 15px;"></span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
									data-dismiss="modal">Ok</button>
						</div>
					</div>
				</div>
			</div>
			<section class="content-header">
				<h1>Quản lý công việc</h1>
			</section>

			<!-- Main content -->
			<!--  -->
			<section class="content container-fluid">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Danh sách công việc</h3>
							</div>
							<form action="">
								<div class="col-md-6">
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
									</div>
									<label>Trạng thái</label>
									<div class="form-group">
										<select class="form-control select2"
											style="width: 80%; display: inline-block;">
											<option selected="selected">--Tất cả--</option>
											<option>Đã hoàn thành</option>
											<option>Đang thực hiên</option>
											<option>Chưa thực hiện</option>
											<option>Chưa có người nhận</option>
										</select>
										<button type="submit" class="btn btn-success btn-flat"
											style="margin-bottom: 3px;">Lọc</button>
									</div>
								</div>
							</form>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Mã công việc</th>
											<th>Điện thoại KH</th>
											<th>Loại dịch vụ</th>
											<th>Địa điểm</th>
											<th>Ngày làm</th>
											<th>Giờ làm</th>
											<th>Số giờ làm</th>
											<th>Người làm</th>
											<th>Trạng thái</th>
											<th>Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<DangKyDichVu> listCongViec = (ArrayList<DangKyDichVu>) request.getAttribute("listCongViec");
											for (DangKyDichVu dkdv : listCongViec) {
										%>
										<tr class="data">
											<th scope=row><%=dkdv.getMaDangKy()%></th>
											<td><%=dkdv.getSoDienThoai()%></td>
											<td><%=dkdv.getTenDichVu()%></td>
											<td><%=dkdv.getDiaDiem()%></td>
											<td><%=dkdv.getNgayLam()%></td>
											<td><%=dkdv.getGioLam()%></td>
											<td><%=dkdv.getSogioLam()%></td>
											<td><%=StringProcess.validTenCTV(dkdv.getTenCTV())%></td>
											<td><%=StringProcess.trangThaiCV(dkdv.getTrangThai())%></td>
											<td><a href="" title="Xem chi tiết"> <i
													class="fa fa-edit"></i>
											</a> &nbsp|&nbsp <a href="" title="Xóa" style="color: red"> <i
													class="fa fa-trash"></i>
											</a> &nbsp|&nbsp <%-- <a href="" title="Nhận việc"
												class="btn btn-info"
												onclick="event.preventDefault();layDL('${sessionScope.maCTV}','<%=dkdv.getMaDangKy()%>');">
													<i class="fa fa-paper-plane"></i> Nhận việc
											</a> --%>
											<a href="" title="Xem chi tiết"> <i
													class="fa fa-external-link"></i>
											</a>
											</td>
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
		<!-- 	<span class="hidden" id="mactv"></span>
		<span class="hiiden" id="maDangKy"></span> -->
		
		<%@include file="footer.jsp"%>
	</div>
	<script src="components/jQuery/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="components/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->

	<script src="dist/js/adminlte.js">
	</script>
	<script type="text/javascript">
			function layDL(a,b){
				//debugger;
				$.ajax({
					url:'NhanViecServlet',
					data:{
						maCTV:a,
						maDangKy:b
					},
					success: function(responseText) {
						//debugger;
					document.getElementById("thongbao").innerHTML = responseText;
					$('#xnPheDuyet').modal('show');
					}, 
					error: function(responseText) {
						//debugger;
					document.getElementById("thongbao").value = responseText;
					
					}, 
			});
		};
	</script>
	<script type="text/javascript" src="components/pagination.js"></script>
	<script type="text/javascript">
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
	<!--

//-->

</body>

</html>