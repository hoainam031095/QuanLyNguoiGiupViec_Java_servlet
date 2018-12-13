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
 * Servlet implementation class XoaDichVuServlet
 */
public class XoaDichVuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XoaDichVuServlet() {
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
//		request.setCharacterEncoding("UTF-8");
//		String maDichVu = request.getParameter("maDichVu");
//		DichVuBO dichVuBO = new DichVuBO();
//		dichVuBO.xoaDichVu(maDichVu);
//		response.sendRedirect("DanhSachDichVuServlet");
		
		request.setCharacterEncoding("UTF-8");
		DichVuBO dichVuBO = new DichVuBO();
		//lay danh sach cac dich vu
		ArrayList<DichVu> listDichVu = dichVuBO.layDanhSachDichVu();
		request.setAttribute("listDichVu", listDichVu);
		
		String maDichVu=request.getParameter("maDichVu");
		//if("submit".equals(request.getParameter("submit"))){		//nhan nut Xac nhan o trang Xoa sinh vien
			dichVuBO.xoaDichVu(maDichVu);
			response.sendRedirect("DanhSachDichVuServlet");
			
		//} /*else {													//chuyen sang trang Xoa sinh vien
			/*DichVu dichVu = dichVuBO.layThongTinDichVu(maDichVu);
			request.setAttribute("dichVu", dichVu);
			RequestDispatcher rd = request.getRequestDispatcher("xoaDichVu.jsp");
			rd.forward(request, response);*/
	}

}
