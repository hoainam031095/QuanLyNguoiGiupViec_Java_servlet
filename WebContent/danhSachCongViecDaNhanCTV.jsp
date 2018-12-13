<%@page import="common.StringProcess"%>
<%@page import="model.bean.DangKyDichVu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="HeaderNguoidung.jsp"%>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="modal" id="xnPheDuyet" data-popup="popup-1">
	<div class="modal-dialog" id="myModal">
		<div class="modal-content">
			<div class="modal-header">
				<h4>Thông báo</h4>
			</div>
			<div class="modal-body">
				<span id="thongbao" style="color: #027bfb; font-size: 15px;"></span>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" id="confirm-modal"
					data-popup-open="rating-modal" data-popup-close="popup-1">Đánh
					giá</button>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="danhGia" data-popup="rating-modal">
	<div class="modal-dialog" id="myModal2" style="width: 22%">
		<div class="modal-content">
			<!-- <form action="DanhGiaCongTacVienServlet"> -->
			<div class="modal-body" style="height: 150px; text-align: center;">
				<input type="hidden" class="rating" id="xepHang" /> <br> <input
					type="hidden" name="maCTV" id="maCTV">
				<button type="button" value="submit" name="submit"
					onclick="danhGiaCTV();" class="btn btn-success hide1"
					style="margin-top: 10px" data-popup-close="rating-modal">Xác
					nhận</button>
			</div>
			<div class="modal-footer"></div>
			<!-- </form> -->
		</div>
	</div>
</div>
<div class="table-service-price section-space">
	<div class="container">
		<h2 class="heading2 text-center white-text">Danh sách công việc
			của bạn</h2>
		<div class="col-md-6"></div>
		<div class="col-md-6 themMoi" style="margin-left: 10px; margin-bottom:25px;">
			<a href="DanhSachCongViecCTVServlet" class="btn btn-primary"><i
				class="fa fa-plus"></i> Nhận việc mới</a>
		</div>
		<div class="">
			<%
				ArrayList<DangKyDichVu> listCongViec = (ArrayList<DangKyDichVu>) request.getAttribute("listCongViec");
				int i = 0;
				if (listCongViec.size() == 0) {
			%>
			<h3>Bạn chưa đăng ký công việc nào</h3>
			<%
				} else {
			%>
			<table class="table table-price table-price-maid"
				style="font-size: 16px; text-align: center">
				<thead>
					<tr>
						<th>#</th>
						<th>Loại công việc</th>
						<th>Địa điểm</th>
						<th>Ngày làm</th>
						<th>Giờ làm</th>
						<th>Số giờ làm</th>
						<th>Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (DangKyDichVu dkdv : listCongViec) {
					%>
					<tr>
						<th><%=++i%></th>
						<td><%=dkdv.getTenDichVu()%></td>
						<td><%=dkdv.getDiaDiem()%></td>
						<td><%=dkdv.getNgayLam()%></td>
						<td><%=dkdv.getGioLam()%></td>
						<td><%=dkdv.getSogioLam()%></td>
						<td><a href="" title="Hủy ĐK"
							onclick="event.preventDefault();layDL('<%=dkdv.getMaDangKy()%>');">
								<i class="fa fa-trash-o"></i>
						</a></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript" src="components/bootstrap-rating.js"></script>
<script type="text/javascript" src="components/notify.min.js"></script>
<script type="text/javascript">
	$(".rating").rating();
	function layDL(a) {
		//debugger;
		$.ajax({
			url : 'XacNhanHoanThanhCVServlet',
			data : {
				maDangKy : a
			},
			success : function(responseText) {
				//debugger;
				var splited = responseText.split("|");
				if (splited[1] == "success") {
					document.getElementById("thongbao").innerHTML = splited[0];
					$('#maCTV').val(splited[2]);
					$('#xnPheDuyet').modal('show');
				} else {
					$.notify(splited[0], {
						className : splited[1],
						globalPosition : 'top center'
					});
				}
			},
			error : function(responseText) {
				//debugger;
				document.getElementById("thongbao").value = responseText;
			},
		});
	};
	function danhGiaCTV() {
		$.ajax({
			url : 'DanhGiaCongTacVienServlet',
			data : {
				maCTV : $('#maCTV').val(),
				soSao : $('#xepHang').val()
			},
			success : function(responseText) {
				//debugger;
				var splited = responseText.split("|");

				$.notify(splited[0], {
					className : splited[1],
					globalPosition : 'top center'
				});
				$('#danhGia').modal('hide');
				$('.modal-backdrop').hide();
			},
			error : function(responseText) {
				//debugger;
				//document.getElementById("thongbao").value = responseText;
			},
		});
	};
</script>
<%@include file="FooterNguoidung.jsp"%>
