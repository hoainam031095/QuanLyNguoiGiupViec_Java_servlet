package model.bo;
/**
 * DangKyDichVuBO.java
 * 
 * Date: Aug 15, 2018
 * 
 * DATE               AUTHOR          DESCRIPTION				
 * -------------------------------------------------				
 * Aug 15, 2018        DanTT           Create				
 */

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.DangKyDichVu;
import model.bean.NgayGioBan;
import model.dao.ConnectDB;
import model.dao.DangKyDichVuDAO;

public class DangKyDichVuBO {

	DangKyDichVuDAO dangKyDichVuDAO = new DangKyDichVuDAO();
	
	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVu() {
		return dangKyDichVuDAO.layDanhSachDangKyDichVu();
	}
	
	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoMa(String maDichVu) {
		return dangKyDichVuDAO.layDanhSachDangKyDichVuTheoMa(maDichVu);
	}
	
	public DangKyDichVu layThongTinDangKyDichVu(String maDangKy) {
		return dangKyDichVuDAO.layThongTinDangKyDichVu(maDangKy);
	}
	
	public void themDangKyDichVu(DangKyDichVu dk) {
		dangKyDichVuDAO.themDangKyDichVu(dk);
	}
	/*
	public void xoaDangKyDichVu(String maDangKy) {
		dangKyDichVuDAO.xoaDangKyDichVu(maDangKy);
	}*/
	
	public int layTrangThaiCongViec(String maDangKy) {
		return dangKyDichVuDAO.layTrangThaiCongViec(maDangKy);
	}
	
	public ArrayList<NgayGioBan> layThoiGianBanCTV (String maCTV){
		return dangKyDichVuDAO.layThoiGianBanCTV(maCTV);
	}
	public void updateNhanViec(String maDangKy, String maCTV) throws SQLException {
		dangKyDichVuDAO.updateNhanViec(maDangKy, maCTV);
	}
	
	public int sinhMa() {
		return ConnectDB.sinhMa("MaDangKy", "DangKyDichVu");
	}
	
	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoND(String maNguoiDung){
		return dangKyDichVuDAO.layDanhSachDangKyDichVuTheoND(maNguoiDung);
	}

	public void xacNhanHoanThanh(String maDangKy) throws SQLException {
		dangKyDichVuDAO.xacNhanHoanThanh(maDangKy);
		
	}

	public ArrayList<DangKyDichVu> layDanhSachDangKyTheoDiaDiem(){
		return dangKyDichVuDAO.layDanhSachDangKyTheoDiaDiem();
	}
	
	public ArrayList<DangKyDichVu> layDanhSachMaNguoiDungDangKyDichVu() {
		return dangKyDichVuDAO.layDanhSachMaNguoiDungDangKyDichVu();
	}

	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoMaNguoiDung(String maNguoiDung){
		return dangKyDichVuDAO.layDanhSachDangKyDichVuTheoMaNguoiDung(maNguoiDung);
	}
	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoTrangThai(int trangThai) {
		// TODO Auto-generated method stub
		return dangKyDichVuDAO.layDanhSachDangKyDichVuTheoTrangThai(trangThai);
	}
	
	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoTrangThai(String maDichVu, int trangThai) {
		// TODO Auto-generated method stub
		return dangKyDichVuDAO.layDanhSachDangKyDichVuTheoTrangThai(maDichVu, trangThai);
	}

	public ArrayList<DangKyDichVu> timKiemCongViec(String chuoitimkiem) {
		// TODO Auto-generated method stub
		return dangKyDichVuDAO.timKiemDangKyDichVu(chuoitimkiem);
	}

	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoMaCTV(String maCTV) {
		// TODO Auto-generated method stub
		return dangKyDichVuDAO.layDanhSachDangKyDichVuTheoMaCTV(maCTV);
	}
}
