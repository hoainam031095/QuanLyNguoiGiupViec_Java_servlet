package model.bo;

import java.util.ArrayList;

import model.bean.UngVien;
import model.dao.UngVienDAO;

public class UngVienBO {
	UngVienDAO ungVienDAO = new UngVienDAO();

	public UngVien layUngVienTheoSoDienThoai(String soDienThoai) {
		return ungVienDAO.layUngVienTheoSoDienThoai(soDienThoai);
	}
	
	public void themUngVien(String hoTen, String soDienThoai, int namSinh, String diaChi, String maDichVu) {
		ungVienDAO.themUngVien(hoTen, soDienThoai, namSinh, diaChi, maDichVu);
	}
	
	public void suaUngVienTheoSoDienThoai(String hoTen,String soDienThoai, int namSinh, String diaChi, String maDichVu) {
		ungVienDAO.suaUngVienTheoSoDienThoai(hoTen, soDienThoai, namSinh, diaChi, maDichVu);
	}
	
	public void xoaUngVienTheoSoDienThoai(String soDienThoai) {
		ungVienDAO.xoaUngVienTheoSoDienThoai(soDienThoai);
	}
	
	public ArrayList<UngVien> layDanhSachUngVien() {
		return ungVienDAO.layDanhSachUngVien();
	}
	
	public ArrayList<UngVien> layDanhSachUngVienTheoDV(String maDichVu) {
		return ungVienDAO.layDanhSachUngVienTheoDV(maDichVu);
	}

	public boolean kiemTraUngVien(String soDienThoai) {
		// TODO Auto-generated method stub
		return ungVienDAO.kiemTraUngVien(soDienThoai);
	}
}
