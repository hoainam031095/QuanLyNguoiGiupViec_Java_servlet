package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.TimeProcess;
import model.bean.DangKyDichVu;
import model.bean.NgayGioBan;
import model.bo.DangKyDichVuBO;

/**
 * Servlet implementation class NhanViecServlet
 */
public class NhanViecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NhanViecServlet() {
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
			response.sendRedirect("StartServlet");
			return;
		}
		response.setCharacterEncoding("UTF-8");
		String maCTV = request.getParameter("maCTV"); // lấy mã Cộng tác viên
		String maDangKy = request.getParameter("maDangKy");
		DangKyDichVuBO dkBO = new DangKyDichVuBO();
		int status = dkBO.layTrangThaiCongViec(maDangKy);
		if (status == 3 || status == 2) {
			response.setContentType("text/plain");
			response.getWriter().write("Công việc đã hoàn thành hoặc đã có người nhận");
		} else {
			ArrayList<NgayGioBan> dsBan = dkBO.layThoiGianBanCTV(maCTV);
			DangKyDichVu congViec = dkBO.layThongTinDangKyDichVu(maDangKy);

			// lấy khoảng thời gian thực hiện cộng việc mới
			String ngayLam = congViec.getNgayLam(); // ngày của cv
			String gioLam = congViec.getGioLam();
			String end = TimeProcess.getEndTime(gioLam, congViec.getSogioLam());
			// đổi sang LocalTime
			LocalTime startTime = LocalTime.parse(gioLam); //
			LocalTime endTime = LocalTime.parse(end);

			//

			// kiểm tra đã hết hạn chưa
			LocalDate ngayThucHienCV = LocalDate.parse(ngayLam, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
			if (ngayThucHienCV.isBefore((LocalDate.now()))) {
				response.setContentType("text/plain");
				response.getWriter().write("Đã hết hạn nhận việc này do quá thời gian!");
				return;
			}

			// duyệt thời gian bận để xem có được hay không
			boolean check = false;
			for (NgayGioBan ngayGioBan : dsBan) {
				if ((ngayLam.equals(ngayGioBan.getNgayBan()))
						&& ((TimeProcess.isBetween(startTime, LocalTime.parse(ngayGioBan.getGioBan()),
								LocalTime.parse(ngayGioBan.getHetGioBan())))
						|| (TimeProcess.isBetween(endTime, LocalTime.parse(ngayGioBan.getGioBan()),
								LocalTime.parse(ngayGioBan.getHetGioBan()))))) {
					check = true;
					break;
				}
			}
			if (check) {
				response.setContentType("text/plain");
				response.getWriter().write("Bạn không thể nhận việc này do trùng thời gian!");
			} else {
				try {
					dkBO.updateNhanViec(maDangKy, maCTV);
					response.setContentType("text/plain");
					response.getWriter().write("Nhận việc thành công!");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					response.setContentType("text/plain");
					response.getWriter().write("Lỗi hệ thống! Vui lòng thử lại sau!");
				}
			}
		}
	}

}
