package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xerces.internal.util.DatatypeMessageFormatter;

import model.bean.DangKyDichVu;
import model.bean.DichVu;
import model.bo.DangKyDichVuBO;
import model.bo.DichVuBO;

/**
 * Servlet implementation class ThemDangKyDichVuServlet
 */
public class ThemDangKyDichVuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemDangKyDichVuServlet() {
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
		HttpSession ss = request.getSession();
		
		DichVuBO dichVuBO = new DichVuBO();
		ArrayList<DichVu> listDV = dichVuBO.layDanhSachDichVu();
		request.setAttribute("listDV", listDV);
		
		DangKyDichVuBO dkBO = new DangKyDichVuBO();
		
		if("submit".equals(request.getParameter("submit"))){		//nhan nut Xac nhan o trang Them sinh vien
			String maDichVu = request.getParameter("xnmadv");
			System.out.println(maDichVu);
			String soDienThoai = request.getParameter("xnsodienthoai");
			String diaDiem = request.getParameter("xndiachi");
			String ngayLam = request.getParameter("xnngaylam");
			String gioLam = request.getParameter("xngiolam");
			//
			String ngayGioLam = ngayLam + " " + gioLam;
			//
			//sinh mã cho đăng ký
			String maDangKy = "DK" + String.format("%05d", (dkBO.sinhMa() + 1));
			//
			int soGioLam = Integer.valueOf(request.getParameter("xnthoigian"));
			String maNguoiDung = (String)ss.getAttribute("maNguoiDung");
			DangKyDichVu dk = new DangKyDichVu(maDangKy, maDichVu, soDienThoai, diaDiem, ngayGioLam, soGioLam, null, maNguoiDung, 1);
			dkBO.themDangKyDichVu(dk);
			response.sendRedirect("TrangChuNguoiDungServlet");
			System.out.println(ngayGioLam);
		}
	}

}
