package model.bo;
/**
 * CongTacVienBO.java
 * 
 * Date: Aug 14, 2018
 * 
 * DATE               AUTHOR          DESCRIPTION				
 * -------------------------------------------------				
 * Aug 14, 2018        DanTT           Create				
 */

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.CongTacVien;
import model.dao.CongTacVienDAO;
import model.dao.ConnectDB;

public class CongTacVienBO {

	CongTacVienDAO congTacVienDAO = new CongTacVienDAO();
	
	public ArrayList<CongTacVien> layDanhSachCongTacVien() {
		return congTacVienDAO.layDanhSachCongTacVien();
	}
	
	public ArrayList<CongTacVien> layDanhSachCongTacVienTheoDV(String maDichVu) {
		return congTacVienDAO.layDanhSachCongTacVienTheoDV(maDichVu);
	}
	
	public int sinhMa() {
		return ConnectDB.sinhMa("MaCTV", "CongTacVien");
	}

	public void themCongTacVien(String maCTV, String soDienThoai, int trangThai, float danhGia) {
		congTacVienDAO.themCongTacVien(maCTV, soDienThoai, trangThai, danhGia);
	}
	
	public CongTacVien layCongTacVienTheoSoDienThoai(String soDienThoai) {
		return congTacVienDAO.layCongTacVienTheoSoDienThoai(soDienThoai);
	}

	public int laySoLanLamViecCTV(String maCTV) {
		// TODO Auto-generated method stub
		return congTacVienDAO.laySoLanLamViecCTV(maCTV);
	}

	public float layDanhGiaHT(String maCTV) {
		// TODO Auto-generated method stub
		return congTacVienDAO.layDanhGiaHT(maCTV);
	}

	public void capNhatDanhGiaCTV(String maCTV, float danhGia) throws SQLException {
		// TODO Auto-generated method stub
		congTacVienDAO.capNhatDanhGiaCTV(maCTV, danhGia);
	}
	
	public ArrayList<CongTacVien> layBangXepHangCTV(){
		return congTacVienDAO.layBangXepHangCTV();
	}
}
