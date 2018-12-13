<%@page import="model.bean.DichVu"%>
<%@page import="model.bean.NguoiDung"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/jpg"href="images/vector-icon/images.jpg">
<title>DaNaLiKinh</title>
<link rel="stylesheet" href="components/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css" href="components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="jquery/bxslider/jquery.bxslider.css">
<link rel="stylesheet" type="text/css" href="components/bootstrap-rating.css">
<link rel="stylesheet" type="text/css" href="animate/animate.min.css">
<link rel="stylesheet" type="text/css" href="css/Header.css">
<link rel="stylesheet" type="text/css" href="css/trangchu.css">
<link rel="stylesheet" type="text/css" href="css/cacdichvu.css">
<link rel="stylesheet" type="text/css" href="css/gioithieu.css">
<link rel="stylesheet" type="text/css" href="css/Footer.css">
<link rel="stylesheet" type="text/css" href="dist/css/skin-blue.css">
 
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src='animate/wow.min.js'></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery/bxslider/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="components/pagination.js"></script>
<script type="text/javascript" src="js/danalikinh.js"></script>

<!-- <style type="text/css">
form{
	width: 80%;
	margin: 0 auto;
	margin-top: 25px;
}
</style> -->

</head>
<body id="body">
	<%HttpSession ss = request.getSession();
	String tentaikhoan = (String) ss.getAttribute("tenTaiKhoan");
	String maquyen = (String) ss.getAttribute("nhomQuyen");
	 %>
	<div class="wrapper">
		<header id="header"> <nav class="navbar navbar-default">
		<div class="container-fluid-daxoa">
			<div class="header-container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle plus collapsed"
						data-toggle="collapse" data-target="#navbar-collapse-plus"
						aria-label="button">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand logo" href="index.jsp">DaNaLiKinh</a>
				</div>
				<div class="collapse navbar-collapse header-menu"
					id="navbar-collapse-plus">
					<ul class="nav navbar-nav">
						<li><a href="TrangChuNguoiDungServlet">Trang chủ</a></li>
						<li class=""><a href="gioithieu.jsp">Giới thiệu</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Dịch vụ nổi bật <i
								class="fa fa-angle-down" aria-hidden="true"></i></a>
							<ul class="dropdown-menu button-menu">
								<li><a href="DichVuGiupViecTheoGioServlet">Giúp việc nhà theo
										giờ</a></li>
								<li class="divider"></li>
								<li><a href="DichVuVeSinhMayLanhServlet">Vệ sinh máy lạnh</a></li>
								<li class="divider"></li>
								<li><a href="">Giữ trẻ</a></li>
							</ul>
						</li>
							<% if (tentaikhoan == null){ %>
								<li><a href="ThemMoiUngVienServlet" >Tuyển dụng</a></li>
							<%} %>
						<li><a href="#" id="menu-lienhe-scoll">Liên hệ</a></li>
						<!-- <li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="javascript:;">Thêm <i
								class="fa fa-angle-down" aria-hidden="true"></i></a>
							<ul class="dropdown-menu button-menu">
								<li><a href="">Khuyến mại</a></li>
								<li class="divider"></li>
								<li><a href="">Liên hệ</a></li>
								<li class="divider"></li>
								<li><a href="" target="_blank" rel="noopener">Blog</a></li>
								<li class="divider"></li>
								<li><a href="">Câu hỏi thường gặp</a></li>
								<li class="divider"></li>
								<li><a href="">Tuyển dụng</a></li>
								<li class="divider"></li>
								<li><a href="">Điều khoản sử dụng</a></li>
								<li class="divider"></li>
								<li><a href="">Chính sách bảo mật</a></li>
							</ul></li> -->
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<!-- <li class="dropdown">
								<a class="dropdown-toggle green-button-o" href="">Đăng ký nhận việc 
								<i class="fa fa-angle-down" aria-hidden="true"></i></a>
									<ul class="dropdown-menu button-menu menu-register">
					                      <li><a href="">Giúp việc nhà theo giờ</a></li>
					                      <li  class="divider"></li>
					                      <li><a href="">Vệ sinh máy lạnh</a></li>
					                      <li  class="divider"></li>
					                      <li><a href="">Giữ trẻ</a></li>
				                    </ul> 
				                </li> -->
						<%
						if ("2".equalsIgnoreCase(maquyen)) {
						%>
							<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Công việc <i
								class="fa fa-angle-down" aria-hidden="true"></i></a>
									<ul class="dropdown-menu button-menu menu-register">
					                      <li><a href="DanhSachCongViecCTVServlet">Danh sách công việc</a></li>
					                      <li  class="divider"></li>
					                      <li><a href="CongViecDaNhanCTVServlet">Công việc đã nhận</a></li>
				                    </ul> 
				              </li>
							<!-- <li><a  href="DanhSachCongViecCTVServlet">Danh sách công việc</a></li> -->
						<%
						} else if ("3".equalsIgnoreCase(maquyen)){
							%>
								<li><a href="DanhSachCongViecKhachHangServlet">Công việc đã đăng</a></li>
							<%
							}
						else if("1".equalsIgnoreCase(maquyen)){
							%>
								<li><a  href="DashboardServlet">Quản trị</a></li>
							<%
						}
						
						if (tentaikhoan == null) {
						%>
						<li><a href="StartServlet">Đăng nhập</a></li>
						<%
							} else {
						%>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"> 
							<img class="li-image-taikhoan" src="images/taikhoan/anony1.jpg">
								<%=tentaikhoan%> <i class="fa fa-angle-down" aria-hidden="true"></i></a>
								<ul class="dropdown-menu button-menu">
									<div class="header-nguoidung">
										<img class="ul-li-image-taikhoan" src="images/taikhoan/anony1.jpg">
										<li>
										<a class="" href="" style="float: left; padding: 10px 5px;">Thông tin</a></li>
										<li><a class="" href="DangXuatServlet" style="float: right;padding:10px 5px;">Đăng xuất</a></li>
									</div>
								</ul>
							</li>
						<%
							}
						%>
						<!-- 								<li><a href="" class="language-select">English</a></li> -->
					</ul>
				</div>
			</div>
		</div>
		</nav> </header>
		<div class="popup" data-popup="popup-1">
			<div class="popup-inner">
				<div class="popup-header">
					<h2>Thông tin đăng ký dịch vụ</h2>
				</div>
				<div class="popup-content">
					<form action="">
						<p>
							Chọn loại dịch vụ:<span id="gvtg-error-dichvu"></span>
						</p>
						<select class="select2" id="gvtg-themdichvu" name="maDichVu"
							style="display: inline-block;">
							<%
								ArrayList<DichVu> listDV = (ArrayList<DichVu>) session.getAttribute("listDV");
								if (listDV == null) {
								} else {
									for (DichVu dv : listDV) {
							%>
							<option value="<%=dv.getMaDichVu()%>">
								<%=dv.getTenDichVu()%></option>
							<%
								}
								}
							%>
						</select>
						<p>
							Nơi làm việc: <span id="gvtg-error-diachi"></span>
						</p>
						<input type="text" id="gvtg-themdiachi"
							class="check-input address">

						<p>
							Ngày làm: <span id="gvtg-error-date"></span>
						</p>
						<input type="date" id="gvtg-ngaylam" class="change-input date">

						<p>
							Giờ làm: <span id="gvtg-error-time1"></span>
						</p>
						<input type="time" id="gvtg-giolam" class="change-input time1">

						<p>
							Số giờ làm: <span id="gvtg-error-time"></span>
						</p>
						<input type="text" id="gvtg-thoigian" class="check-input time">

						<p>
							Tên liên hệ: <span id="gvtg-error-name"></span>
						</p>
						<input type="text" id="gvtg-themtenlienhe"
							class="check-input name">

						<p>
							Số điện thoại: <span id="gvtg-error-phone"></span>
						</p>
						<input type="text" id="gvtg-sodienthoai" class="check-input phone">

						<p>
							<button class="btn btn-success validate" id="xacnhandichvu-modal"
								data-popup-open="popup-2" data-popup-close="popup-1">Tiếp
								theo</button>
							<button class="btn btn-danger" data-popup-close="popup-1">Hủy</button>
						</p>
					</form>
				</div>
			</div>
		</div>
		<%
			if ("3".equalsIgnoreCase(maquyen)) {
		%>
		<a href="#" class="btn-normal button-dangkydichvu dangkydichvu-modal"
			data-popup-open="popup-1" id="dangkydichvu-modal"
			style="text-decoration: none;"><i class="fa fa-pencil"
			style="font-size: 17px;"></i> Đăng ký dịch vụ</a>
		<%
			} else {
		%>
		<a href="DangXuatServlet" class="btn-normal button-dangkydichvu"
			style="text-decoration: none;"> Đăng nhập để đăng ký</a>
		<%
			}
		%>
		<div class="popup" data-popup="popup-2">
			<div class="popup-inner xac-nhan">
				<div class="popup-header">
					<h2>Xác nhận thông tin đăng ký dịch vụ</h2>
				</div>
				<div class="popup-content">
					<form action="ThemDangKyDichVuServlet">
						<input type="hidden" id="gvtg-xndichvu" name="xnmadv"> <input
							type="hidden" id="gvtg-xndiachi" name="xndiachi"> <input
							type="hidden" id="gvtg-xnngaylam" name="xnngaylam"> <input
							type="hidden" id="gvtg-xngiolam" name="xngiolam"> <input
							type="hidden" id="gvtg-xnthoigian" name="xnthoigian"> <input
							type="hidden" id="gvtg-xntenlienhe" name="xntenlienhe"> <input
							type="hidden" id="gvtg-xnsodienthoai" name="xnsodienthoai">
						<p>
							Loại dịch vụ&nbsp: <span id="gvtg-xndichvu1"></span>
						</p>
						<p>
							Nơi làm việc &nbsp: <span id="gvtg-xndiachi1"></span>
						</p>
						<p>
							Ngày làm &nbsp &nbsp &nbsp : <span id="gvtg-xnngaylam1"></span>
						</p>
						<p>
							Giờ làm &nbsp &nbsp &nbsp &nbsp : <span id="gvtg-xngiolam1"></span>
						</p>
						<p>
							Thời gian làm: <span id="gvtg-xnthoigian1"></span>
						</p>
						<p>
							Tên liên hệ &nbsp &nbsp: <span id="gvtg-xntenlienhe1"></span>
						</p>
						<p>
							Số điện thoại : <span id="gvtg-xnsodienthoai1"></span>
						</p>
						<p>
							<button type="submit" class="btn btn-success" name="submit"
								value="submit">Xác nhận</button>
							<button type="button" data-popup-close="popup-2"
								class="btn btn-danger" data-dismiss="modal">Hủy</button>
							<button type="button" data-popup-close="popup-2"
								data-popup-open="popup-1" class="btn btn-info"
								data-dismiss="modal">Quay lại</button>
						</p>
					</form>
				</div>
			</div>
		</div>
		<div id="main-page">