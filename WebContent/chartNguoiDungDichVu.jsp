<%@page import="model.bean.CongTacVien"%>
<%@page import="model.bo.DichVuBO"%>
<%@page import="model.bean.DichVu"%>
<%@page import="model.bo.DangKyDichVuBO"%>
<%@page import="model.bean.DangKyDichVu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bo.ChartBO"%>
<%@page import="model.bean.Value"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin|Trang chủ</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	 google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawSeriesChart);

	<%ChartBO chartBO = new ChartBO();
			ArrayList<Value> list = chartBO.layDanhSachDiaDiemDangKyDichVu();%>
	
	function drawSeriesChart() {

		var data = google.visualization.arrayToDataTable([
				
				[ 'Khu vực', 'Số lượng đăng ký cao nhất', 'Số lượng đăng ký thấp nhất', 'Khu Vực'],
				<%for (Value v : list) {%>
				
				[ '<%=v.getName()%>', <%=v.getValue()%>, 0, '<%=v.getName()%>' ],
				<%}%>
				]);

		var options = {
			title : ' Thống kê lượng đăng ký dịch vụ theo khu vực ',
			hAxis : {
				title : 'Giá trị cao nhất'
			},
			vAxis : {
				title : 'Giá trị thấp nhất'
			},
			bubble : {
				textStyle : {
					fontSize : 11
				}
			}
		};

		var chart = new google.visualization.BubbleChart(document
				.getElementById('series_chart_div'));
		chart.draw(data, options);
	}
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">

	 <%
		ChartBO chartBO2 = new ChartBO();
		DangKyDichVuBO dangKyDichVuBO = new DangKyDichVuBO();
		ArrayList<Value> list2 = chartBO.layDanhSachNguoiDungDangKyDichVu();
		DangKyDichVu dangKyDichVu = new DangKyDichVu();
		ArrayList<DangKyDichVu> listDK = (ArrayList<DangKyDichVu>) request.getAttribute("listDK");

		ChartBO chartBO3 = new ChartBO();
		// Lấy danh sách các Dịch vụ đã được đăng ký bao nhiêu lần
		ArrayList<Value> list3 = chartBO.getALLDangKyDichVu();
		
		//lay BXH
		ArrayList<CongTacVien> listBXH = (ArrayList<CongTacVien>)request.getAttribute("listBXH");
	%>
	<div class="wrapper">
		<%@include file="header.jsp"%>
		<div class="content-wrapper">
			<section class="content container-fluid">
				<div class="row">
					<div class="col-lg-3 col-xs-12">
						<!-- small box -->
						<div class="small-box bg-aqua">
							<div class="inner">
								<h3><%=chartBO.soLuongDichVuCungCap()%></h3>

								<p>Dịch vụ cung cấp</p>
							</div>
							<div class="icon">
								<i class="fa fa-link"></i>
							</div>
							<a href="DanhSachDichVuServlet" class="small-box-footer">Nhiều hơn<i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-12">
						<!-- small box -->
						<div class="small-box bg-green">
							<div class="inner">
								<h3><%=chartBO.soLuongCongTacVien()%></h3>

								<p>Cộng tác viên</p>
							</div>
							<div class="icon">
								<i class="fa fa-users"></i>
							</div>
							<a href="DanhSachCongTacVienServlet" class="small-box-footer">Nhiều hơn <i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-12">
						<!-- small box -->
						<div class="small-box bg-yellow">
							<div class="inner">
								<h3><%=chartBO.soLuongDangKyDichVu()%></h3>

								<p>Người dùng đăng ký sử dụng</p>
							</div>
							<div class="icon">
								<i class="fa fa-user"></i>
							</div>
							<a href="DanhSachNguoiDungServlet" class="small-box-footer">Nhiều hơn <i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-12">
						<!-- small box -->
						<div class="small-box bg-red">
							<div class="inner">
								<h3><%=chartBO.soLuongDichVuDaHoanThanh()%></h3>

								<p>Công việc đã được hoàn thành</p>
							</div>
							<div class="icon">
								<i class="fa fa-tasks"></i>
							</div>
							<a href="DanhSachCongViecServlet" class="small-box-footer">Nhiều hơn <i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
				</div>
				<div class="row">
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="box box-info">
							<div class="box-header">
								<h3 class="box-title">Xếp hạng số lượt đăng ký sử dụng</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Mã người dùng</th>
											<th>Tên KH</th>
											<th>Số lần DKDV</th>
											<th>Chi tiết</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (Value v : list2) {
										%>
										<tr class="data">
											<td><%=v.getName()%></td>
											<td><%=v.getName2()%></td>
											<td><%=v.getValue()%></td>
											<td>
												<button type="button" class="btn btn-primary"
													data-toggle="modal" onclick="xemDichVu('<%=v.getName()%>')">Xem</button>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<div class="modal fade" id="myModal" style="display: none">
									<div class="modal-dialog ">
										<div class="modal-content">
											<!-- Modal Header -->
											<div class="modal-header">
												<h4 class="modal-title">Xem chi tiết</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>

											<!-- Modal body -->
											<table class="table table-striped">
												<thead>
													<th>Mã đăng ký</th>
													<th>Mã dịch vụ</th>
													<th>Mã người dùng</th>
													<th>Số điện thoại</th>
													<th>Địa điểm</th>
												</thead>
												<tbody>
													<%
														for (DangKyDichVu dk : listDK) {
													%>
													<tr>
														<td><%=dk.getMaDangKy()%></td>
														<td><%=dk.getMaDichVu()%></td>
														<td><%=dk.getMaNguoiDung()%></td>
														<%-- Tên dịch vụ: <div class="modal-body"><%=dk.getTenDichVu() %></div> --%>
														<td><%=dk.getSoDienThoai()%></td>
														<td><%=dk.getDiaDiem()%></td>
													</tr>
													<%
														}
													%>
												</tbody>
											</table>

											<!-- Modal footer -->
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="box-footer text-center">
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">CTV Ranking</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-striped">
									<thead></thead>
									<tbody>
									<%
									int i = 0;
									for(CongTacVien ctv : listBXH){
										i++;
									%>
										<tr>
											<th><%=i %></th>
											<td><img class="direct-chat-img"
												src="dist/img/<%=ctv.getAvatar()%>"></td>
											<td><%=ctv.getTenTaiKhoan() %></td>
											<td><%=ctv.getDanhGia() %> <i class="fa fa-star" style="color: #ffb916;font-size: 18px;"></i></td>
											<td>
											<%if(i==1){ %>
												<!-- <i class="fa fa-trophy" style=""></i> -->
												<img alt="" src="images/trophy.png" width="25 px">
												<%} %>
											</td>
										</tr>
									<%} %>
									</tbody>
								</table>
								<!-- /.users-list -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer text-center">
								<a href="DanhSachCongTacVienServlet" class="uppercase">Xem tất cả</a>
							</div>
							<!-- /.box-footer -->
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Thống kê đăng ký dịch vụ</h3>
							</div>
							<div class="box-body">
								<div id="chart_div"></div>
								<script type="text/javascript"
									src="https://www.google.com/jsapi"></script>
								<script type="text/javascript">
				// Load the Visualization API and the piechart package.
				google.load('visualization', '1.0', {
					'packages' : [ 'corechart' ]
				});
				google.setOnLoadCallback(drawChart);

				function drawChart() {

					// Create the data table.
					var data = new google.visualization.DataTable();
					// Create columns for the DataTable
					data.addColumn('string');
					data.addColumn('number', 'Devices');
					// Create Rows with data
					data.addRows([ 
						<%for (Value v : list3) {%>
						[ '<%=v.getName()%>',
								<%=v.getValue()%>
									],
								<%}%>
									]);
										//Create option for chart
										var options = {
											title : 'Thống kê Đăng ký dịch vụ',
											'width' : 760,
											'height' : 495
										};

										// Instantiate and draw our chart, passing in some options.
										var chart = new google.visualization.PieChart(
												document
														.getElementById('chart_div'));
										chart.draw(data, options);
									}
								</script>
							</div>
							<div class="box-footer"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="box box-success">
							<div class="box-header">
								<h3 class="box-title">Thống kê đăng ký theo khu vực</h3>
							</div>
							<div class="box-body">
								<div id="series_chart_div" style="width: 100%; height: 500px;"></div>
							</div>
							<div class="box-footer"></div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<%@include file="footer.jsp"%>
	</div>
	<script src="components/jQuery/jquery.min.js"></script>
	<script src="components/bootstrap/js/bootstrap.min.js"></script>
	<script src="dist/js/adminlte.js"></script>
	<script type="text/javascript">
		function xemDichVu(maNguoiDung) {
			window.location.replace("ChartNguoiDungDichVuServlet?maNguoiDung="
					+ maNguoiDung);
			/* $.post('ChartNguoiDungDichVuServlet', {
				maNguoiDung:maNguoiDung
			},function(ketqua) {
			    $('#noidung').html(ketqua);
			}); */

		}
		$(document).ready(function() {
	<%if (listDK != null && listDK.size() > 0) {%>
		$("#myModal").modal("show");
	<%} else {%>
		$("#myModal").modal("hide");
	<%}%>
		});
	</script>

</body>
</html>









