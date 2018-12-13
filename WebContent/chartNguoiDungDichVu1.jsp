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
		
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>