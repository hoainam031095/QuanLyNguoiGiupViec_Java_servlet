package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.CongTacVien;
import model.bean.UngVien;
import model.bo.CongTacVienBO;
import model.bo.NguoiDungBO;
import model.bo.UngVienBO;

/**
 * Servlet implementation class PheDuyetUngVienServlet
 */
public class PheDuyetUngVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PheDuyetUngVienServlet() {
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
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("nhomQuyen") == null) {
			response.sendRedirect("StartServlet");
			return;
		} else if (("1").equals(((String)session.getAttribute("nhomQuyen")))) {
			UngVienBO ungVienBO = new UngVienBO();
			CongTacVienBO ctvBO = new CongTacVienBO();
			NguoiDungBO ndBO = new NguoiDungBO();
			
			String soDienThoai = request.getParameter("soDienThoai");
			UngVien ungVien = ungVienBO.layUngVienTheoSoDienThoai(soDienThoai);
			//sinh mã CTV và mã ND
			String maCTV = "CTV" + String.format("%05d", (ctvBO.sinhMa() + 1));
			String maND = "ND" + String.format("%05d", (ndBO.sinhMa() + 1));
			//insert vào bảng Cộng tác viên
			ctvBO.themCongTacVien(maCTV, soDienThoai, 0, 0);
			//insert vào bảng người dùng
			CongTacVien ctv = ctvBO.layCongTacVienTheoSoDienThoai(soDienThoai);
			System.out.println(ctv.getMaCongTacVien());
			ndBO.themNguoiDung(maND, ungVien.getHoTen(), soDienThoai, "123456", "", 2, ctv.getMaCongTacVien());
			
			response.sendRedirect("DanhSachUngVienServlet");
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
