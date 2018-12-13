package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.DichVu;
import model.bo.DichVuBO;

/**
 * Servlet implementation class SuaDichVuServlet
 */
public class SuaDichVuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SuaDichVuServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// kiem tra da dang nhap chua
		// HttpSession session = request.getSession();
		// if (session.getAttribute("tenDangNhap") == null) {
		// response.sendRedirect("LoginServlet");
		// return;
		// }

		request.setCharacterEncoding("UTF-8");
		DichVuBO dichVuBO = new DichVuBO();
		// lay danh sach cac dịch vụ
//		ArrayList<DichVu> listDichVu = dichVuBO.layDanhSachDichVu();
//		request.setAttribute("listDichVu", listDichVu);

		String maDichVu = request.getParameter("maDichVu");
		if ("submit".equals(request.getParameter("submit"))) {
			// nhan nut Xac nhan o trang Sua dịch vụ
			String tenDichVu = request.getParameter("tenDichVu");
			String donGia = request.getParameter("donGia");
			String moTa = request.getParameter("moTa");
			dichVuBO.suaDichVu(new DichVu(maDichVu, tenDichVu, Integer.parseInt(donGia), moTa));
			response.sendRedirect("DanhSachDichVuServlet");
		} else {// chuyen sang trang Sua dịch vụ
			DichVu dichVu = dichVuBO.layThongTinDichVu(maDichVu);
			request.setAttribute("dichVu", dichVu);
			RequestDispatcher rd = request.getRequestDispatcher("suaDichVu.jsp");
			rd.forward(request, response);
		}
		
	}

}
