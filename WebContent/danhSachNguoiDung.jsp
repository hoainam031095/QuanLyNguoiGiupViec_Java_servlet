<%@page import="common.StringProcess"%>
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
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="components/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <!-- <link rel="stylesheet" href="components/Ionicons/css/ionicons.min.css"> -->
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.css">

    <link rel="stylesheet" href="dist/css/skin-blue.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
    	<%@include file="header.jsp"%>
    	 <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Quản lý tài khoản
                </h1>
            </section>

            <!-- Main content -->
            <section class="content container-fluid">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">Danh sách tài khoản</h3>
                            </div>
                            <!-- /.box-header -->
                             <div class="col-md-6"></div>
                            <div class="col-md-6 themMoi" style="margin-bottom: 25px">
								<a href="ThemMoiNguoiDungServlet" class="btn btn-primary"><i class="fa fa-plus"></i> Thêm mới</a>
							</div>
                            <div class="box-body">
                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Mã tài khoản</th>
                                            <th>Số điện thoại</th>
                                            <th>Tên tài khoản</th>
                                            <th>Mật khẩu</th>
                                            <th>Email</th>
                                            <th>Nhóm quyền</th>
                                            <th>Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%ArrayList<NguoiDung> listND = (ArrayList<NguoiDung>)request.getAttribute("listND"); 
										for(NguoiDung nguoiDung : listND){
									%>
                                        <tr class="data">
                                            <th scope="row"><%=nguoiDung.getMaNguoiDung()%></td>
                                            <td><%=nguoiDung.getSoDienThoai()%></td>
                                            <td><%=nguoiDung.getTenTaiKhoan()%></td>
                                            <td><%=nguoiDung.getMatKhau()%></td>
                                            <td><%=nguoiDung.getEmail()%></td>
                                            <td><%=StringProcess.nhomQuyen(nguoiDung.getMaQuyen())%></td>
                                            <td>
                                                <a href="SuaThongTinTaiKhoanServlet?maNguoiDung=<%=nguoiDung.getMaNguoiDung() %>" title="Sửa">
                                                    <span class="fa fa-edit"></span>
                                                </a>
                                                &nbsp|&nbsp
                                                <a href="XoaNguoiDungServlet?maNguoiDung=<%=nguoiDung.getMaNguoiDung() %>" title="Xóa" style="color: red">
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <%} %>
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
    <!-- Bootstrap 3.3.7 -->
    <script src="components/jQuery/jquery.min.js"></script>
    <script src="components/bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
	<script type="text/javascript" src="dist/js/adminlte.js"></script>
	<script type="text/javascript" src="components/pagination.js"></script>
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
</body>

</html>