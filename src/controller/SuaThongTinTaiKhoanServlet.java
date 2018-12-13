package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.NguoiDung;
import model.bo.NguoiDungBO;

/**
 * Servlet implementation class SuaThongTinTaiKhoanServlet
 */
public class SuaThongTinTaiKhoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaThongTinTaiKhoanServlet() {
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
		String maNguoiDung = request.getParameter("maNguoiDung");
		NguoiDungBO nguoiDungBO = new NguoiDungBO();
		NguoiDung nguoiDung = nguoiDungBO.layNguoiDungTheoMaNguoiDung(maNguoiDung);
		if ("submit".equals(request.getParameter("submit"))) {
			String soDienThoai = request.getParameter("soDienThoai");
			String tenTaiKhoan = request.getParameter("tenTaiKhoan");
			String email = request.getParameter("email");
			String matKhau = request.getParameter("matKhau");
			nguoiDungBO.suaNguoiDungTheoMa(maNguoiDung, tenTaiKhoan, soDienThoai, matKhau, email, nguoiDung.getMaQuyen(),nguoiDung.getMaCongTacVien());
			response.sendRedirect("DanhSachNguoiDungServlet");
		} else {
			request.setAttribute("nguoiDung", nguoiDung);
			RequestDispatcher rd = request.getRequestDispatcher("suaThongTinTaiKhoan.jsp");
			rd.forward(request, response);
		}
	}

}
