package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.CongTacVien;
import model.bean.DangKyDichVu;
import model.bean.Value;
import model.bo.ChartBO;
import model.bo.CongTacVienBO;
import model.bo.DangKyDichVuBO;

/**
 * Servlet implementation class ChartNguoiDungDichVuServlet
 */
public class ChartNguoiDungDichVuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChartNguoiDungDichVuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maNguoiDung = request.getParameter("maNguoiDung");
//		System.out.println(maNguoiDung);
		ArrayList<DangKyDichVu> listDK;
		if(maNguoiDung != null) {
			ChartBO chartBO = new ChartBO();
			DangKyDichVuBO dangKyDichVuBO = new DangKyDichVuBO();
			/*ArrayList<Value> list = chartBO.layDanhSachNguoiDungDangKyDichVu();
			DangKyDichVu dangKyDichVu = new DangKyDichVu();*/
			listDK = dangKyDichVuBO.layDanhSachDangKyDichVuTheoMaNguoiDung(maNguoiDung);
		} else {
			listDK = new ArrayList<DangKyDichVu>();
		}
		request.setAttribute("listDK", listDK);
		
		CongTacVienBO ctvBO = new CongTacVienBO();
		ArrayList<CongTacVien> listCTV = new ArrayList<>();
		listCTV = ctvBO.layBangXepHangCTV();
		request.setAttribute("listBXH", listCTV);
		
		RequestDispatcher rd = request.getRequestDispatcher("chartNguoiDungDichVu.jsp");
		rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maNguoiDung = request.getParameter("maNguoiDung");
		
		ChartBO chartBO = new ChartBO();
		DangKyDichVuBO dangKyDichVuBO = new DangKyDichVuBO();
		/*ArrayList<Value> list = chartBO.layDanhSachNguoiDungDangKyDichVu();
		DangKyDichVu dangKyDichVu = new DangKyDichVu();*/
		ArrayList<DangKyDichVu> listDK = dangKyDichVuBO.layDanhSachDangKyDichVuTheoMaNguoiDung(maNguoiDung);
		
		request.setAttribute("listDK", listDK);
		RequestDispatcher rd = request.getRequestDispatcher("chartNguoiDungDichVu.jsp");
		rd.forward(request, response);
	}

}
