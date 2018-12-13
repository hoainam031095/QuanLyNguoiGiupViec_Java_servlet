package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DichVu;
import model.bo.DichVuBO;
import model.bo.UngVienBO;

/**
 * Servlet implementation class ThemCongTacVienServlet
 */
public class ThemMoiUngVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ThemMoiUngVienServlet() {
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
		HttpSession session = request.getSession();
		if (session.getAttribute("nhomQuyen") == null) {
			request.setCharacterEncoding("UTF-8");
			UngVienBO ungVienBO = new UngVienBO();

			// lay danh sach dịch vụ
			DichVuBO dichVuBO = new DichVuBO();
			ArrayList<DichVu> listDV = dichVuBO.layDanhSachDichVu();
			request.setAttribute("listDV", listDV);

			// neu nhan nut submit
			if ("submit".equals(request.getParameter("submit"))) { // nhan nut Xac nhan o trang Them sinh vien
				String hoTen = request.getParameter("name");
				String soDienThoai = request.getParameter("phone");
				int namSinh = Integer.valueOf(request.getParameter("age"));
				String diaChi = request.getParameter("address");
				String maDichVu = request.getParameter("maDichVu");
				ungVienBO.themUngVien(hoTen, soDienThoai, namSinh, diaChi, maDichVu);
				response.sendRedirect("DanhSachUngVienServlet");
			} else { // chuyen sang trang Them sinh vien
				RequestDispatcher rd = request.getRequestDispatcher("dangkyungvien.jsp");
				rd.forward(request, response);
			}
			// return;
		} else if (("1").equals(((String) session.getAttribute("nhomQuyen")))) {
			request.setCharacterEncoding("UTF-8");
			UngVienBO ungVienBO = new UngVienBO();

			// lay danh sach dịch vụ
			DichVuBO dichVuBO = new DichVuBO();
			ArrayList<DichVu> listDV = dichVuBO.layDanhSachDichVu();
			request.setAttribute("listDV", listDV);

			// neu nhan nut submit
			if ("submit".equals(request.getParameter("submit"))) { // nhan nut Xac nhan o trang Them sinh vien
				String hoTen = request.getParameter("name");
				String soDienThoai = request.getParameter("phone");
				int namSinh = Integer.valueOf(request.getParameter("age"));
				String diaChi = request.getParameter("address");
				String maDichVu = request.getParameter("maDichVu");
				ungVienBO.themUngVien(hoTen, soDienThoai, namSinh, diaChi, maDichVu);
				response.sendRedirect("DanhSachUngVienServlet");
			} else { // chuyen sang trang Them sinh vien
				RequestDispatcher rd = request.getRequestDispatcher("themMoiUngVien.jsp");
				rd.forward(request, response);
			}
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
