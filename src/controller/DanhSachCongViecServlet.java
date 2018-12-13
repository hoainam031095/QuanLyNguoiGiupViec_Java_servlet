package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DangKyDichVu;
import model.bean.DichVu;
import model.bo.DangKyDichVuBO;
import model.bo.DichVuBO;

/**
 * Servlet implementation class DanhSachCongViecServlet
 */
public class DanhSachCongViecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhSachCongViecServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (session.getAttribute("nhomQuyen") == null) {
			response.sendRedirect("StartServlet");
			return;
		} else if (("1").equals(((String) session.getAttribute("nhomQuyen")))) {//Quyá»�n Admin
			DichVuBO dichVuBO = new DichVuBO();
			ArrayList<DichVu> listDV = dichVuBO.layDanhSachDichVu();
			request.setAttribute("listDV", listDV);

			// lay danh sach cong viec
			ArrayList<DangKyDichVu> listCongViec;
			DangKyDichVuBO dangKyDichVuBO = new DangKyDichVuBO();
			String maDichVu = request.getParameter("maDichVu");
			if (maDichVu == null || maDichVu.length() == 0) {
				listCongViec = dangKyDichVuBO.layDanhSachDangKyDichVu();
			} else {
				listCongViec = dangKyDichVuBO.layDanhSachDangKyDichVuTheoMa(maDichVu);
			}
			request.setAttribute("listCongViec", listCongViec);

			RequestDispatcher rd = request.getRequestDispatcher("danhSachCongViec.jsp");
			rd.forward(request, response);
		} else if (("2").equals(((String) session.getAttribute("nhomQuyen")))) {
			DichVuBO dichVuBO = new DichVuBO();

			String aJax = request.getParameter("AjaxLimit");

			if (aJax == null || "".equals(aJax)) { 
				ArrayList<DichVu> listDV = dichVuBO.layDanhSachDichVu();
				request.setAttribute("listDV", listDV);

				ArrayList<DangKyDichVu> listCongViec;
				DangKyDichVuBO dangKyDichVuBO = new DangKyDichVuBO();
				String maDichVu = request.getParameter("maDichVu");
				if (maDichVu == null || maDichVu.length() == 0) {
					listCongViec = dangKyDichVuBO.layDanhSachDangKyDichVu();
				} else {
					listCongViec = dangKyDichVuBO.layDanhSachDangKyDichVuTheoMa(maDichVu);
				}
				request.setAttribute("listCongViec", listCongViec);

				RequestDispatcher rd = request.getRequestDispatcher("danhsachcongviecCTV2.jsp");
				rd.forward(request, response);
			} else { //
				ArrayList<DangKyDichVu> listCongViec;
				DangKyDichVuBO dangKyDichVuBO = new DangKyDichVuBO();
				String maDichVu = request.getParameter("maDichVu");
				String trangThai = request.getParameter("trangThai");

				if ((maDichVu == null || "".equals(maDichVu)) && (trangThai == null || "".equals(trangThai))) {
					listCongViec = dangKyDichVuBO.layDanhSachDangKyDichVu();
				} else if (trangThai == null || "".equals(trangThai)) {
					listCongViec = dangKyDichVuBO.layDanhSachDangKyDichVuTheoMa(maDichVu);
				} else if (maDichVu == null || "".equals(maDichVu)) {
					listCongViec = dangKyDichVuBO.layDanhSachDangKyDichVuTheoTrangThai(Integer.parseInt(trangThai));
				} else {
					listCongViec = dangKyDichVuBO.layDanhSachDangKyDichVuTheoTrangThai(maDichVu, Integer.parseInt(trangThai));
				}
				
				String responesText = "";
				
				for (DangKyDichVu cv : listCongViec) {
					String responesTrangthai = "";
					if(cv.getTrangThai()==1){ 
						responesTrangthai = "<div class=\"row\"><p class=\"col-md-5 \" >Trạng thái &nbsp :</p><span class=\"col-md-5 trang-thai\" style=\"color:#26b532;\">Chưa có người nhận</span></div>\r\n"; 
					}else{ 
						responesTrangthai = "<div class=\"row\"><p class=\"col-md-5\" >Đã có người nhận:</p><span class=\"col-md-5 trang-thai\" style=\"color:red;\">"+cv.getTenCTV()+"</span></div>\r\n"; 
					}
					
					responesText = responesText + "<tr class=\"data\">\r\n" + 
							"<td class=\"ds-cv-mainpage-text-left col-md-4 col-md-offset-1 \">\r\n" + 
							"<h4>"+ cv.getTenDichVu() + "</h4>\r\n" + 
							"<div class=\"row\"><p class=\"col-md-5\">Địa điểm &nbsp :</p><span class=\"col-md-5\">"+ cv.getDiaDiem()+"</span></div>\r\n" + 
							"<div class=\"row\"><p class=\"col-md-5\">Số điện thoại &nbsp :</p><span class=\"col-md-5\">"+cv.getSoDienThoai()+"</span></div>\r\n" + 
							"<div class=\"row\"><p class=\"col-md-5\">Ngày giờ làm:</p><span class=\"col-md-5\">" +cv.getNgayLam()  + " " + cv.getGioLam()  + "</span></div>\r\n" + 
							"<div class=\"row\"><p class=\"col-md-5\">Số giờ làm &nbsp :</p><span class=\"col-md-5\">" + cv.getSogioLam() + "</span></div>\r\n" +
							"" + responesTrangthai +"\r\n" + 
							"</td>\r\n" + 
							"<td class=\"ds-cv-mainpage-text-right col-md-4\">\r\n" + 
							"<button onclick=\"layDL('"+(String)session.getAttribute("maCTV") + "','"+ cv.getMaDangKy()+"');\" class=\"button-nhanviec-getindex\"><i class=\"fa fa-paper-plane\"></i> Nhận việc</button>\r\n" + 
							"</td>\r\n" +
							"</tr>";
				}
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/plain");
				response.getWriter().write(responesText);
			}

		} else {
			response.sendRedirect("index.jsp");
		}

	}

	
}
