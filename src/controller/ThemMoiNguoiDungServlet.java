package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.CongTacVien;
import model.bo.CongTacVienBO;
import model.bo.NguoiDungBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class ThemMoiNguoiDungServlet
 */
public class ThemMoiNguoiDungServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ThemMoiNguoiDungServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String tenTaiKhoan = request.getParameter("hovaten");
		String soDienThoai = request.getParameter("sodienthoai");
		String matKhau = request.getParameter("matkhau");
		String email = request.getParameter("email");
		int maQuyen = 3;
		
		CongTacVienBO congTacVienBo = new CongTacVienBO();
		String maCongTacVien = "CTV" + String.format("%05d",congTacVienBo.sinhMa()+1);
		
		NguoiDungBO nguoiDungBO = new NguoiDungBO();
		String maNguoiDung = "ND" + String.format("%05d",nguoiDungBO.sinhMa()+1);
		
		if ("submit".equals(request.getParameter("submit"))) {
			nguoiDungBO.themNguoiDung(maNguoiDung, tenTaiKhoan, soDienThoai, matKhau, email, maQuyen, maCongTacVien);
			response.sendRedirect("login.jsp");
		} else {
			if (nguoiDungBO.kiemTraNguoiDung(soDienThoai)) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/plain");
				response.getWriter().write("Số điện thoại này đã có !");
			}
			else {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/plain");
				response.getWriter().write("");
			}
		}
	}

}
