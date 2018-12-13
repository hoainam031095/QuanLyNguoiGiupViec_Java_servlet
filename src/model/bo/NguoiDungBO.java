package model.bo;

import java.util.ArrayList;

import model.bean.NguoiDung;
import model.dao.ConnectDB;
import model.dao.NguoiDungDAO;

public class NguoiDungBO {
	NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();

	public int CheckLogin(String tenDangNhap, String matKhau) {
		return nguoiDungDAO.checkLogin(tenDangNhap, matKhau);
	}

	public ArrayList<NguoiDung> layDanhSachNguoiDung() {
		return nguoiDungDAO.layDanhSachNguoiDung();
	}

	public NguoiDung layNguoiDungTheoMaNguoiDung(String maNguoiDung) {
		return nguoiDungDAO.layNguoiDungTheoMaNguoiDung(maNguoiDung);
	}

	public NguoiDung layNguoiDungTheoTen(String tenTaiKhoan) {
		return nguoiDungDAO.layNguoiDungTheoTen(tenTaiKhoan);
	}

	public void themNguoiDung(String maNguoiDung, String tenTaiKhoan, String soDienThoai, String matKhau, String email,
			int maQuyen, String maCongTacVien) {
		nguoiDungDAO.themNguoiDung(maNguoiDung, tenTaiKhoan, soDienThoai, matKhau, email, maQuyen, maCongTacVien);
	}
	
	public void suaNguoiDungTheoMa(String maNguoiDung, String tenTaiKhoan, String soDienThoai, String matKhau,
			String email, int maQuyen, String maCongTacVien) {
		nguoiDungDAO.suaNguoiDungTheoMa(maNguoiDung, tenTaiKhoan, soDienThoai, matKhau, email, maQuyen, maCongTacVien);
	}
	
	public void xoaNguoiDungTheoMa(String maNguoiDung) {
		nguoiDungDAO.xoaNguoiDungTheoMa(maNguoiDung);
	}
	
	public boolean kiemTraNguoiDung(String soDienThoai) {
		// TODO Auto-generated method stub
		return nguoiDungDAO.kiemTraNguoiDung(soDienThoai);
	}
	
	public int sinhMa() {
		return ConnectDB.sinhMa("MaNguoiDung", "NguoiDung");
	}
	
	public NguoiDung layNguoiDungTheoMaCTV(String maCTV) {
		// TODO Auto-generated method stub
		return nguoiDungDAO.layNguoiDungTheoMaCTV(maCTV);
	}
	
	public int laySoDichVuDuocNguoiDungDangKy(String maNguoiDung) {
		return nguoiDungDAO.laySoDichVuDuocNguoiDungDangKy(maNguoiDung);
	}

}
