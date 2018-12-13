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
 * Servlet implementation class DanhSachCongViecKhachHangServlet
 */
public class DanhSachCongViecKhachHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhSachCongViecKhachHangServlet() {
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
		} else if (("3").equals(((String)session.getAttribute("nhomQuyen")))) {
			// lay danh sach cong viec
			ArrayList<DangKyDichVu> listCongViec;
			DangKyDichVuBO dangKyDichVuBO = new DangKyDichVuBO();
			String maNguoiDung = (String)session.getAttribute("maNguoiDung");
			listCongViec = dangKyDichVuBO.layDanhSachDangKyDichVuTheoND(maNguoiDung);
			request.setAttribute("listCongViec", listCongViec);
			RequestDispatcher rd = request.getRequestDispatcher("danhSachCongViecKhachHang.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
