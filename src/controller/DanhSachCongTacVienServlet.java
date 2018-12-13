package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.CongTacVien;
import model.bean.DichVu;
import model.bo.CongTacVienBO;
import model.bo.DichVuBO;

/**
 * Servlet implementation class DanhSachCongTacVienServlet
 */
public class DanhSachCongTacVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhSachCongTacVienServlet() {
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
		} else if (("1").equals(((String)session.getAttribute("nhomQuyen")))) {
			DichVuBO dichVuBO = new DichVuBO();
			ArrayList<DichVu> listDV = dichVuBO.layDanhSachDichVu();
			request.setAttribute("listDV", listDV);

			// lay danh sach sinh vien
			ArrayList<CongTacVien> listCTV;
			CongTacVienBO congTacVienBO = new CongTacVienBO();
			String maDichVu = request.getParameter("maDichVu");
			if (maDichVu == null || maDichVu.length() == 0) {
				listCTV = congTacVienBO.layDanhSachCongTacVien();
			} else {
				listCTV = congTacVienBO.layDanhSachCongTacVienTheoDV(maDichVu);
			}
			request.setAttribute("listCTV", listCTV);

			RequestDispatcher rd = request.getRequestDispatcher("danhSachCongTacVien.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
