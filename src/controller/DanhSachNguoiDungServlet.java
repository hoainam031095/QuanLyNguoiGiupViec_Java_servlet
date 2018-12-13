package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.NguoiDung;
import model.bo.NguoiDungBO;

/**
 * Servlet implementation class DanhSachNguoiDungServlet
 */
public class DanhSachNguoiDungServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DanhSachNguoiDungServlet() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if(session.getAttribute("nhomQuyen")==null){
			response.sendRedirect("DangNhapServlet");
			return;
		}
		else if (("1").equals(((String)session.getAttribute("nhomQuyen")))) {
		NguoiDungBO nguoiDungBO = new NguoiDungBO();
		ArrayList<NguoiDung> listND = nguoiDungBO.layDanhSachNguoiDung();
		request.setAttribute("listND", listND);
		RequestDispatcher rd = request.getRequestDispatcher("danhSachNguoiDung.jsp");
		rd.forward(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}
	}
}
