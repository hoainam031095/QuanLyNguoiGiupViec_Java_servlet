<%@page import="model.bean.DangKyDichVu"%>
<%@page import="model.bean.DichVu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="HeaderNguoidung.jsp"%>
<div class="ds-cv-wapper">
	<div class="ds-cv-mainpage">
		<div class="container">
			<div class="row ds-cv-mainpage-header">
			<!-- Modal -->
			<div class="modal" id="xnPheDuyet">
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
			<!--  -->
				<div class="box-header">
						<h3 class="box-title">Danh sách công việc</h3>
				</div>
				
				<form action="">
					<div class="col-md-6">
						<label>Chuyên môn</label>
						<div class="form-group">
							<select class="form-control select2" name="maDichVu"
								style="width: 80%; display: inline-block;" id="loc-chuyenmon-cv">
								<option value="">-- Tất cả --</option>
								<%
									ArrayList<DichVu> listDV2 = (ArrayList<DichVu>) request.getAttribute("listDV2");
									for (DichVu dv : listDV2) {
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
								style="width: 80%; display: inline-block;" id="loc-trangthai-cv">
								<option selected="selected" value ="">--Tất cả--</option>
								<option value="1">Chưa có người nhân</option>
								<option value="2">Đã có người nhận</option>
								<option value="3">Đã hoàn thành</option>
							</select>
						</div>
						<label>Tìm kiếm</label>
						<div class="form-group">
							<input class = "form-control" type="text" style="width: 80%;" placeholder="Tìm địa điểm và những thứ khác" id="input-timkiem-cv">
						</div>
					</div>
				</form>
			</div>
			<div class="row ds-cv-mainpage-content">
				<div class="ds-cv-mainpage-text">
					<table class="col-md-10 col-md-offset-2 table-ajax-cv" id="example2" >
						<%ArrayList<DangKyDichVu> listCongViec = (ArrayList<DangKyDichVu>)request.getAttribute("listCongViec");
							for(DangKyDichVu cv: listCongViec){%>
							<tr class="data">
									<td class="ds-cv-mainpage-text-left col-md-4 col-md-offset-1 ">
										<h4><%=cv.getTenDichVu()%></h4>
										<div class="row"><p class="col-md-5">Địa điểm &nbsp :</p><span class="col-md-5"><%=cv.getDiaDiem() %></span></div>
										<div class="row"><p class="col-md-5">Điện thoại &nbsp :</p><span class="col-md-5"><%=cv.getSoDienThoai() %></span></div>
										<div class="row"><p class="col-md-5">Ngày giờ làm:</p><span class="col-md-5"><%=cv.getNgayLam()%> <%=cv.getGioLam()%> </span></div>
										<div class="row"><p class="col-md-5">Số giờ làm &nbsp :</p><span class="col-md-5"><%=cv.getSogioLam() %></span></div>
										<%if("1".equals(cv.getTrangThai()+"")){%>
																<div class="row"><p class="col-md-5">Trạng thái &nbsp :</p><span class="col-md-5 trang-thai" style="color:#26b532;">Chưa có người nhận</span></div>
															<%}else{ %>
																<div class="row"><p class="col-md-5">Đã có người nhận:</p><span class="col-md-5 trang-thai" style="color:red;"><%=cv.getTenCTV()%></span></div>
																<%} %>
										
									</td>
									<td class="ds-cv-mainpage-text-right col-md-4">
										<button onclick="layDL('<%=(String)session.getAttribute("maCTV") %>','<%=cv.getMaDangKy()%>');" class="button-nhanviec-getindex">
											<i class="fa fa-paper-plane"></i> Nhận việc
										</button>
									</td>
							</tr>
							<%} %>
							<tr>
								<td class="paging-container" id="tablePaging"></td>
							</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
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
	<script type="text/javascript">
			function layDL(a,b){
				$.ajax({
					url:'NhanViecServlet',
					data:{
						maCTV:a,
						maDangKy:b
					},
					success: function(responseText) {
						//debugger;
						document.getElementById("thongbao").innerHTML = responseText;
						 if(responseText.normalize() === 'Nhận việc thành công!'.normalize()){
							$('.row-nhan-viec .trang-thai').css('color','red');
							$('.row-nhan-viec .trang-thai').html('Đã nhận');
							} 
						$('#xnPheDuyet').modal('show');
 						
					}, 
					error: function(responseText) {
						//debugger;
						document.getElementById("thongbao").value = responseText;
					
					}, 
			});
		};
		 $(document).ready(function() {
			$('.button-nhanviec-getindex').click(function() {
				$(this).parent().parent().addClass('row-nhan-viec');
			});
		});
		
	</script>
<%@include file="FooterNguoidung.jsp"%>