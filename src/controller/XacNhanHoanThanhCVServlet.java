package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.management.resource.internal.inst.SocketOutputStreamRMHooks;
import model.bean.DangKyDichVu;
import model.bo.DangKyDichVuBO;

/**
 * Servlet implementation class XacNhanHoanThanhCVServlet
 */
public class XacNhanHoanThanhCVServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XacNhanHoanThanhCVServlet() {
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
		response.setCharacterEncoding("utf-8");
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (session.getAttribute("nhomQuyen") == null) {
			response.sendRedirect("StartServlet");
			return;
		}
		if (("3").equals(((String) session.getAttribute("nhomQuyen")))) {
			// lay danh sach sinh vien
			DangKyDichVuBO dkBO = new DangKyDichVuBO();
			String maDangKy = request.getParameter("maDangKy");
			
			DangKyDichVu dk = dkBO.layThongTinDangKyDichVu(maDangKy);
			if (dk.getMaCTV() == null) {
				response.setContentType("text/plain");
				response.getWriter().write("Không thể xác nhận khi chưa có cộng tác viên|info");
				return;
			}
			
			LocalDate ngayHT = LocalDate.now();
			LocalTime timeHT = LocalTime.now();
			LocalDate ngayThucHienCV = LocalDate.parse(dk.getNgayLam(), DateTimeFormatter.ofPattern("dd-MM-yyyy"));
			LocalTime timeThucHienCV = LocalTime.parse(dk.getGioLam());
			if (ngayHT.isBefore(ngayThucHienCV)) {
				response.setContentType("text/plain");
				response.getWriter().write("Không thể xác nhận khi chưa đến ngày thực hiện cv|info");
				return;
			} else if (ngayHT.isEqual(ngayHT)) {
				if (timeHT.isBefore(timeThucHienCV)) {
					response.setContentType("text/plain");
					response.getWriter().write("Không thể xác nhận khi chưa đến giờ thực hiện cv|info");
					return;
				}
			}
			
			try {
				dkBO.xacNhanHoanThanh(maDangKy);
				response.setContentType("text/plain");
				response.getWriter().write("Xác nhận thành công! Cảm ơn quý khách đã sử dụng DaNaLiKinh"
						+ "<br> Hãy đánh giá cộng tác viên của chúng tôi|success|"+dk.getMaCTV());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				response.setContentType("text/plain");
				response.getWriter().write("Lỗi hệ thống!|error");
			}
		} else {
			response.sendRedirect("index.jsp");
		}
	}
}
