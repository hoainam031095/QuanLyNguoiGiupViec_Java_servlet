package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.DichVu;

public class DichVuDAO {

	public ArrayList<DichVu> layDanhSachDichVu(){
		Connection conn = ConnectDB.getConnection();

		ArrayList<DichVu> dsDichVu = new ArrayList<>();
		try {

			CallableStatement call = conn.prepareCall("{call GrapOsin_layDanhSachDichVu}");
			ResultSet rs = call.executeQuery();

			while (rs.next()) {
				DichVu dv = new DichVu();
				dv.setMaDichVu(rs.getString("MaDichVu"));
				dv.setTenDichVu(rs.getString("TenDichVu"));
				dv.setDonGia(rs.getInt("DonGia"));
				dv.setMoTa(rs.getString("MoTa"));

				dsDichVu.add(dv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.toString();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return dsDichVu;
	}

	public ArrayList<DichVu> layDanhSachDichVuTheoMa(String maDichVu) {
		Connection conn = ConnectDB.getConnection();
		CallableStatement call;
		ArrayList<DichVu> ds = new ArrayList<>();
		try {
			call = conn.prepareCall("{call GrapOsin_layDanhSachDichVuTheoMa(?)}");
			call.setString(1, maDichVu);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				DichVu dv = new DichVu();
				dv.setMaDichVu(rs.getString("MaDichVu"));
				dv.setTenDichVu(rs.getString("TenDichVu"));
				dv.setDonGia(rs.getInt("DonGia"));
				dv.setMoTa(rs.getString("MoTa"));
				ds.add(dv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ds;
	}

	public DichVu layThongTinDichVu(String maDichVu) {
		Connection conn = ConnectDB.getConnection();

		CallableStatement call;
		DichVu dv = null;
		try {
			call = conn.prepareCall("{call GrapOsin_layThongTinDichVu(?)}");
			call.setString(1, maDichVu);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				dv = new DichVu();
				dv.setMaDichVu(rs.getString("MaDichVu"));
				dv.setTenDichVu(rs.getString("TenDichVu"));
				dv.setDonGia(rs.getInt("DonGia"));
				dv.setMoTa(rs.getString("MoTa"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dv;
	}

	public void themDichVu(DichVu dv){
		
		Connection conn = ConnectDB.getConnection();

		CallableStatement call;
		try {
			call = conn.prepareCall("{call GrapOsin_themDichVu(?,?,?,?)}");
			call.setString(1, dv.getMaDichVu());
			call.setString(2, dv.getTenDichVu());
			call.setInt(3, dv.getDonGia());
			call.setString(4, dv.getMoTa());
			call.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void xoaDichVu(String maDichVu) {
		Connection conn = ConnectDB.getConnection();

		CallableStatement call;
		try {
			call = conn.prepareCall("{call GrapOsin_xoaDichVu(?)}");
			call.setString(1, maDichVu);
			call.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void suaDichVu(DichVu dv) {
		Connection conn = ConnectDB.getConnection();
		CallableStatement call;
		try {
			call = conn.prepareCall("{call GrapOsin_suaDichVu (?,?,?,?)}");
			call.setString(1, dv.getMaDichVu());
			call.setString(2, dv.getTenDichVu());
			call.setInt(3, dv.getDonGia());
			call.setString(4, dv.getMoTa());
			call.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public ArrayList<DichVu> timKiemDichVu(String keyWord){
		Connection conn = ConnectDB.getConnection();
		ArrayList<DichVu> dsTimKiem = new ArrayList<>();
		CallableStatement call;
		try {
			call = conn.prepareCall("{call GrapOsin_timKiemDichVu(?)}");
			call.setString(1, keyWord);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				DichVu dv = new DichVu();
				dv.setMaDichVu(rs.getString("MaDichVu"));
				dv.setTenDichVu(rs.getString("TenDichVu"));
				dv.setDonGia(rs.getInt("DonGia"));
				dv.setMoTa(rs.getString("MoTa"));
				
				dsTimKiem.add(dv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dsTimKiem;
	}
	

}
