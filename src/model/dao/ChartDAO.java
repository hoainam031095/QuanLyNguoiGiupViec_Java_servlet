package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.DangKyDichVu;
import model.bean.DichVu;
import model.bean.Value;
import model.bo.DangKyDichVuBO;
import model.bo.DichVuBO;
import model.bo.NguoiDungBO;

public class ChartDAO {
	public ArrayList<Value> getALLDangKyDichVu() throws SQLException {
		DangKyDichVuBO dangKyDichVuBO = null;
		ArrayList<Value> list = null;
		DichVuBO dichVuBO = null;
		dangKyDichVuBO = new DangKyDichVuBO();
		dichVuBO = new DichVuBO();
		list = new ArrayList<>();

		for (DichVu dv : dichVuBO.layDanhSachDichVu()) {
			list.add(new Value(dv.getTenDichVu(),
					dangKyDichVuBO.layDanhSachDangKyDichVuTheoMa(dv.getMaDichVu()).size()));
		}

		return list;
	}

	public ArrayList<Value> layDanhSachNguoiDungDangKyDichVu() {
		Connection conn =  ConnectDB.getConnection();
		ArrayList<Value> list= new ArrayList<>();
		String sql = "select TOP 5 nd.MaNguoiDung ,TenTaiKhoan, COUNT(*) as SoLan from DangKyDichVu dk inner join NguoiDung nd on nd.MaNguoiDung = dk.MaNguoiDung\r\n" + 
				"group by nd.MaNguoiDung,TenTaiKhoan\r\n" + 
				"order by SoLan DESC";
		Value val;
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				val = new Value(rs.getString(1), rs.getString(2), rs.getInt(3));
				list.add(val);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.toString();
		}
		return list;
	}

	public ArrayList<Value> layDanhSachDiaDiemDangKyDichVu() {
		DangKyDichVuBO dangKyDichVuBO = new DangKyDichVuBO();
		ChartDAO chartDAO = new ChartDAO();
		ArrayList<Value> list = new ArrayList<>();
		for (DangKyDichVu dk : dangKyDichVuBO.layDanhSachDangKyTheoDiaDiem()) {
			list.add(new Value(dk.getDiaDiem(), chartDAO.soLuongDiaDiemDangKyDichVu(dk.getDiaDiem())));
		}
		return list;
	}

	public int soLuongDiaDiemDangKyDichVu(String diaDiem) {
		int dem = 0;
		Connection conn = ConnectDB.getConnection();

		String sql = String.format("select count(DiaDiem) as d "
				+ " from DangKyDichVu "
				+ " where DiaDiem like N'%s' "
				+ " group by DiaDiem ", diaDiem);

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				dem = rs.getInt("d");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.toString();
		}

		return dem;
	}

	public int soLuongDichVuCungCap() {
		int dem = 0;
		Connection conn = ConnectDB.getConnection();
		String sql = "select count(*) from DichVu";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				dem = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dem;
	}

	public int soLuongDangKyDichVu() {
		int dem = 0;
		Connection conn = ConnectDB.getConnection();
		String sql = "select count(*) from NguoiDung Where MaQuyen = 3";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				dem = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dem;
	}

	public int soLuongCongTacVien() {
		int dem = 0;
		Connection conn = ConnectDB.getConnection();
		String sql = "select count(*) from CongTacVien";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				dem = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dem;
	}

	public int soLuongDichVuDaHoanThanh() {
		int dem = 0;
		Connection conn = ConnectDB.getConnection();
		String sql = "select count(*) from DangKyDichVu where TrangThai = 3";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			// pstm.setInt(1, 9);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				dem = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dem;
	}

	public static void main(String[] args) {

		ChartDAO dao = new ChartDAO();
		ArrayList<Value> list = dao.layDanhSachDiaDiemDangKyDichVu();
		for (Value v : list) {
			System.out.println(v.getName() + "-" + v.getValue());
		}
		
//		int dem = dao.soLuongDiaDiemDangKyDichVu("Liên Chiểu");
//		System.out.println(dem);

	}

}
