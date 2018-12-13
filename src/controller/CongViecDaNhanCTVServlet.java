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
import model.bo.DangKyDichVuBO;

/**
 * Servlet implementation class CongViecDaNhanCTVServlet
 */
public class CongViecDaNhanCTVServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CongViecDaNhanCTVServlet() {
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
		} else if (("2").equals(((String)session.getAttribute("nhomQuyen")))) {
			// lay danh sach cong viec
			ArrayList<DangKyDichVu> listCongViec;
			DangKyDichVuBO dangKyDichVuBO = new DangKyDichVuBO();
			String maCTV = (String)session.getAttribute("maCTV");
			listCongViec = dangKyDichVuBO.layDanhSachDangKyDichVuTheoMaCTV(maCTV);
			request.setAttribute("listCongViec", listCongViec);
			RequestDispatcher rd = request.getRequestDispatcher("danhSachCongViecDaNhanCTV.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
