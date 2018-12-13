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
import model.bean.UngVien;
import model.bo.DichVuBO;
import model.bo.UngVienBO;

/**
 * Servlet implementation class DanhSachUngVienServlet
 */
public class DanhSachUngVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DanhSachUngVienServlet() {
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
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("nhomQuyen") == null) {
			response.sendRedirect("StartServlet");
			return;
		} else if (("1").equals(((String)session.getAttribute("nhomQuyen")))) {
			DichVuBO dichVuBO = new DichVuBO();
			ArrayList<DichVu> listDV = dichVuBO.layDanhSachDichVu();
			request.setAttribute("listDV", listDV);

			// lay danh sach sinh vien
			ArrayList<UngVien> listUngVien;
			UngVienBO ungVienBO = new UngVienBO();
			String maDichVu = request.getParameter("maDichVu");
			if (maDichVu == null || maDichVu.length() == 0) {
				listUngVien = ungVienBO.layDanhSachUngVien();
			} else {
				listUngVien = ungVienBO.layDanhSachUngVienTheoDV(maDichVu);
			}
			request.setAttribute("listUngVien", listUngVien);

			RequestDispatcher rd = request.getRequestDispatcher("danhSachUngVien.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
