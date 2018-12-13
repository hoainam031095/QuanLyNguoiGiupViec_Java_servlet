package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Value;
import model.dao.ChartDAO;

public class ChartBO {
	ChartDAO chartDAO = new ChartDAO();

	public ArrayList<Value> getALLDangKyDichVu() throws SQLException {
		return chartDAO.getALLDangKyDichVu();
	}
	public ArrayList<Value> layDanhSachNguoiDungDangKyDichVu(){
		return chartDAO.layDanhSachNguoiDungDangKyDichVu();
	}
	public int soLuongDiaDiemDangKyDichVu(String diaDiem) {
		return chartDAO.soLuongDiaDiemDangKyDichVu(diaDiem);
	}
	
	public ArrayList<Value> layDanhSachDiaDiemDangKyDichVu(){
		return chartDAO.layDanhSachDiaDiemDangKyDichVu();
	}
	
	public int soLuongDichVuCungCap() {
		return chartDAO.soLuongDichVuCungCap();
	}
	public int soLuongDangKyDichVu() {
		return chartDAO.soLuongDangKyDichVu();
	}
	
	public int soLuongCongTacVien() {
		return chartDAO.soLuongCongTacVien();
	}
	
	public int soLuongDichVuDaHoanThanh() {
		return chartDAO.soLuongDichVuDaHoanThanh();
	}
}
