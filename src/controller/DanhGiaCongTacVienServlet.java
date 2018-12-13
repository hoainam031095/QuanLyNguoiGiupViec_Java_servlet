package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.CongTacVienBO;

/**
 * Servlet implementation class DanhGiaCongTacVienServlet
 */
public class DanhGiaCongTacVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhGiaCongTacVienServlet() {
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
		response.setCharacterEncoding("utf-8");
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (session.getAttribute("nhomQuyen") == null) {
			response.sendRedirect("StartServlet");
			return;
		}
		if (("3").equals(((String) session.getAttribute("nhomQuyen")))) {
			int soSao = Integer.valueOf(request.getParameter("soSao"));
			String maCTV = request.getParameter("maCTV");
			
			CongTacVienBO ctvBO = new CongTacVienBO();
			int soLanLam = ctvBO.laySoLanLamViecCTV(maCTV);
			float danhGiaHT = ctvBO.layDanhGiaHT(maCTV);
			float danhGia = (float)(danhGiaHT + (soLanLam - 1)*soSao)/soLanLam;
			try {
				ctvBO.capNhatDanhGiaCTV(maCTV, danhGia);
				response.setContentType("text/plain");
				response.getWriter().write("Cảm ơn bạn đã đánh giá|success");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.setContentType("text/plain");
				response.getWriter().write("Lỗi hệ thống|error");
			}
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
