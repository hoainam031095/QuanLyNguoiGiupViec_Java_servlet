package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.TimeProcess;
import model.bean.DangKyDichVu;
import model.bean.NgayGioBan;

public class DangKyDichVuDAO {

	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVu() {
		Connection conn = ConnectDB.getConnection();
		ArrayList<DangKyDichVu> dsDangKy = new ArrayList<>();
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_layDanhSachDangKyDichVu}");
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				DangKyDichVu dk = new DangKyDichVu();
				dk.setMaDangKy(rs.getString("MaDangKy"));
				dk.setMaDichVu(rs.getString("MaDichVu"));
				dk.setTenDichVu(rs.getString("TenDichVu"));
				dk.setDonGia(rs.getInt("DonGia"));
				dk.setMoTa(rs.getString("MoTa"));
				dk.setSoDienThoai(rs.getString("SoDienThoai"));
				dk.setDiaDiem(rs.getString("DiaDiem"));
				dk.setNgayLam(rs.getString("NgayLam"));
				dk.setGioLam(rs.getString("GioLam"));
				dk.setSogioLam(rs.getInt("SoGioLam"));
				dk.setTenCTV(rs.getString("TenTaiKhoan"));
				dk.setMaNguoiDung(rs.getString("MaNguoiDung"));
				dk.setTrangThai(rs.getInt("TrangThai"));
				dsDangKy.add(dk);
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
		return dsDangKy;
	}

	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoMa(String maDichVu) {
		Connection conn = ConnectDB.getConnection();
		ArrayList<DangKyDichVu> dsDangKy = new ArrayList<>();
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_layDanhSachDangKyDichVuTheoMa(?)}");
			call.setString(1, maDichVu);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				DangKyDichVu dk = new DangKyDichVu();
				dk.setMaDangKy(rs.getString("MaDangKy"));
				dk.setMaDichVu(rs.getString("MaDichVu"));
				dk.setTenDichVu(rs.getString("TenDichVu"));
				dk.setDonGia(rs.getInt("DonGia"));
				dk.setMoTa(rs.getString("MoTa"));
				dk.setSoDienThoai(rs.getString("SoDienThoai"));
				dk.setDiaDiem(rs.getString("DiaDiem"));
				dk.setNgayLam(rs.getString("NgayLam"));
				dk.setGioLam(rs.getString("GioLam"));
				dk.setSogioLam(rs.getInt("SoGioLam"));
				dk.setTenCTV(rs.getString("TenTaiKhoan"));
				dk.setMaNguoiDung(rs.getString("MaNguoiDung"));
				dk.setTrangThai(rs.getInt("TrangThai"));
				dsDangKy.add(dk);
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

		return dsDangKy;
	}

	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoND(String maNguoiDung) {
		Connection conn = ConnectDB.getConnection();
		ArrayList<DangKyDichVu> dsDangKy = new ArrayList<>();
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_layDanhSachDangKyDichVuTheoNguoiDung(?)}");
			call.setString(1, maNguoiDung);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				DangKyDichVu dk = new DangKyDichVu();
				dk.setMaDangKy(rs.getString("MaDangKy"));
				dk.setMaDichVu(rs.getString("MaDichVu"));
				dk.setTenDichVu(rs.getString("TenDichVu"));
				dk.setDonGia(rs.getInt("DonGia"));
				dk.setMoTa(rs.getString("MoTa"));
				dk.setSoDienThoai(rs.getString("SoDienThoai"));
				dk.setDiaDiem(rs.getString("DiaDiem"));
				dk.setNgayLam(rs.getString("NgayLam"));
				dk.setGioLam(rs.getString("GioLam"));
				dk.setSogioLam(rs.getInt("SoGioLam"));
				dk.setTenCTV(rs.getString("TenTaiKhoan"));
				dk.setMaNguoiDung(rs.getString("MaNguoiDung"));
				dk.setTrangThai(rs.getInt("TrangThai"));
				dsDangKy.add(dk);
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

		return dsDangKy;
	}

	public DangKyDichVu layThongTinDangKyDichVu(String maDangKy) {
		Connection conn = ConnectDB.getConnection();
		DangKyDichVu dk = null;
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_layThongTinDanhKyDichVu(?)}");
			call.setString(1, maDangKy);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				dk = new DangKyDichVu();
				dk.setMaCTV(rs.getString("MaCTV"));
				dk.setMaDangKy(rs.getString("MaDangKy"));
				dk.setMaDichVu(rs.getString("MaDichVu"));
				dk.setSoDienThoai(rs.getString("SoDienThoai"));
				dk.setDiaDiem(rs.getString("DiaDiem"));
				dk.setNgayLam(rs.getString("NgayLam"));
				dk.setGioLam(rs.getString("GioLam"));
				dk.setSogioLam(rs.getInt("SoGioLam"));
				dk.setMaNguoiDung(rs.getString("MaNguoiDung"));
				dk.setTrangThai(rs.getInt("TrangThai"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dk;

	}

	public void themDangKyDichVu(DangKyDichVu dk) {
		Connection conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_themDangKyDichVu(?,?,?,?,?,?,?,?,?)}");
			call.setString(1, dk.getMaDangKy());
			call.setString(2, dk.getMaDichVu());
			call.setString(3, dk.getSoDienThoai());
			call.setString(4, dk.getDiaDiem());
			call.setString(5, dk.getNgayLam());
			call.setInt(6, dk.getSogioLam());
			call.setString(7, dk.getMaCTV());
			call.setString(8, dk.getMaNguoiDung());
			call.setInt(9, dk.getTrangThai());
			call.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			e.toString();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) { // TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public void xoaDangKyDichVu(String maDangKy) {
		Connection conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_xoaDangKyDichVu(?)}");
			call.setString(1, maDangKy);
			call.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			e.toString();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) { // TODO Auto-generated catch block
										// e.printStackTrace(); }
			}
		}
	}

	public void suaDangKyDichVu(DangKyDichVu dk) {
		Connection conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_suaDangKyDichVu(?,?,?,?,?,?,?,?,?)}");
			call.setString(1, dk.getMaDangKy());
			call.setString(2, dk.getMaDichVu());
			call.setString(3, dk.getSoDienThoai());
			call.setString(4, dk.getDiaDiem());
			call.setString(5, dk.getNgayLam());
			call.setInt(6, dk.getSogioLam());
			call.setString(7, dk.getMaCTV());
			call.setString(8, dk.getMaNguoiDung());
			call.setInt(9, dk.getTrangThai());
			call.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) { // TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public ArrayList<DangKyDichVu> timKiemDangKyDichVu(String keyWord) {
		Connection conn = ConnectDB.getConnection();
		ArrayList<DangKyDichVu> dsTimKiem = null;
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_timKiemDangKyDichVu(?)}");
			call.setString(1, keyWord);
			ResultSet rs = call.executeQuery();
			dsTimKiem = new ArrayList<>();
			while (rs.next()) {
				System.out.println(rs.getString("TenDichVu"));
				DangKyDichVu dk = new DangKyDichVu();
				dk.setTenDichVu(rs.getString("TenDichVu"));
				dk.setMaDangKy(rs.getString("MaDangKy"));
				dk.setMaDichVu(rs.getString("MaDichVu"));
				dk.setSoDienThoai(rs.getString("SoDienThoai"));
				dk.setDiaDiem(rs.getString("DiaDiem"));
				dk.setNgayLam(rs.getString("NgayLam"));
				dk.setGioLam(rs.getString("GioLam"));
				dk.setSogioLam(rs.getInt("SoGioLam"));
				dk.setMaCTV(rs.getString("MaCTV"));
				dk.setMaNguoiDung(rs.getString("MaNguoiDung"));
				dk.setTrangThai(rs.getInt("TrangThai"));
				dk.setTenCTV(rs.getString("HoTen"));
				dsTimKiem.add(dk);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.toString();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) { // TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dsTimKiem;

	}

	public int layTrangThaiCongViec(String maDangKy) {
		String sql = String.format("select TrangThai From DangKyDichVu where MaDangKy = '%s'", maDangKy);
		Connection conn = ConnectDB.getConnection();
		int status = 0;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				status = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return status;
	}

	public ArrayList<NgayGioBan> layThoiGianBanCTV(String maCTV) {
		Connection conn = ConnectDB.getConnection();
		NgayGioBan ngBan = null;
		ArrayList<NgayGioBan> danhSach = new ArrayList<>();
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_layThoiGianBanCTV(?)}");
			call.setString(1, maCTV);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				ngBan = new NgayGioBan();
				ngBan.setNgayBan(rs.getString(1));
				ngBan.setGioBan(rs.getString(2));
				ngBan.setSoGioBan(rs.getInt(3));
				ngBan.setHetGioBan(TimeProcess.getEndTime(rs.getString(2), rs.getInt(3)));
				danhSach.add(ngBan);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return danhSach;
	}

	public void updateNhanViec(String maDangKy, String maCTV) throws SQLException {
		Connection conn = ConnectDB.getConnection();
		String sql = String.format("UPDATE DangKyDichVu SET TrangThai = 2, MaCTV = '%s' WHERE MaDangKy = '%s'", maCTV,
				maDangKy);
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void xacNhanHoanThanh(String maDangKy)throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = ConnectDB.getConnection();
		String sql = String.format("UPDATE DangKyDichVu SET TrangThai = 3 WHERE MaDangKy = '%s'",maDangKy);
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<DangKyDichVu> layDanhSachDangKyTheoDiaDiem() {
		Connection conn = ConnectDB.getConnection();
		ArrayList<DangKyDichVu> list = new ArrayList<>();
		String sql = "select DiaDiem from DangKyDichVu group by DiaDiem";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				DangKyDichVu dk = new DangKyDichVu();
				
				dk.setDiaDiem(rs.getString("DiaDiem"));
				
				list.add(dk);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.toString();
		}

		return list;
	}

	public ArrayList<DangKyDichVu> layDanhSachMaNguoiDungDangKyDichVu() {
		Connection conn = ConnectDB.getConnection();
		String sql = "select MaNguoiDung from DangKyDichVu" + " where MaNguoiDung <> 'NULL'" + " group by MaNguoiDung";
		ArrayList<DangKyDichVu> list = new ArrayList<>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				DangKyDichVu dk = new DangKyDichVu();
				dk.setMaNguoiDung(rs.getString("MaNguoiDung"));
				list.add(dk);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoMaNguoiDung(String maNguoiDung) {
		Connection conn = ConnectDB.getConnection();
		ArrayList<DangKyDichVu> dsMaNguoiDung = new ArrayList<>();
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_layDanhSachDangKyDichVuTheoNguoiDung(?)}");
			call.setString(1, maNguoiDung);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				DangKyDichVu dk = new DangKyDichVu();
				dk.setMaDangKy(rs.getString("MaDangKy"));
				dk.setMaDichVu(rs.getString("MaDichVu"));
				dk.setSoDienThoai(rs.getString("SoDienThoai"));
				dk.setDiaDiem(rs.getString("DiaDiem"));
				dk.setNgayLam(rs.getString("NgayLam"));
				dk.setSogioLam(rs.getInt("SoGioLam"));
				dk.setMaNguoiDung(rs.getString("MaNguoiDung"));
				dk.setTrangThai(rs.getInt("TrangThai"));
				dsMaNguoiDung.add(dk);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.toString();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				e.toString();
			}
		}

		return dsMaNguoiDung;
	}

	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoTrangThai(int trangThai) {
		Connection conn = ConnectDB.getConnection();
		ArrayList<DangKyDichVu> dsDangKy = new ArrayList<>();
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_layDanhSachDangKyDichVuTheoTrangThai(?)}");
			call.setInt(1, trangThai);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				DangKyDichVu dk = new DangKyDichVu();
				dk.setMaDangKy(rs.getString("MaDangKy"));
				dk.setMaDichVu(rs.getString("MaDichVu"));
				dk.setTenDichVu(rs.getString("TenDichVu"));
				dk.setDonGia(rs.getInt("DonGia"));
				dk.setMoTa(rs.getString("MoTa"));
				dk.setSoDienThoai(rs.getString("SoDienThoai"));
				dk.setDiaDiem(rs.getString("DiaDiem"));
				dk.setNgayLam(rs.getString("NgayLam"));
				dk.setGioLam(rs.getString("GioLam"));
				dk.setSogioLam(rs.getInt("SoGioLam"));
				dk.setTenCTV(rs.getString("TenTaiKhoan"));
				dk.setMaNguoiDung(rs.getString("MaNguoiDung"));
				dk.setTrangThai(rs.getInt("TrangThai"));
				dsDangKy.add(dk);
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

		return dsDangKy;
	}
	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoTrangThai(String maDichVu, int trangThai) {
		Connection conn = ConnectDB.getConnection();
		ArrayList<DangKyDichVu> dsDangKy = new ArrayList<>();
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_layDanhSachDangKyDichVuTheoMaVaTrangThai(?,?)}");
			call.setString(1, maDichVu);
			call.setInt(2, trangThai);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				DangKyDichVu dk = new DangKyDichVu();
				dk.setMaDangKy(rs.getString("MaDangKy"));
				dk.setMaDichVu(rs.getString("MaDichVu"));
				dk.setTenDichVu(rs.getString("TenDichVu"));
				dk.setDonGia(rs.getInt("DonGia"));
				dk.setMoTa(rs.getString("MoTa"));
				dk.setSoDienThoai(rs.getString("SoDienThoai"));
				dk.setDiaDiem(rs.getString("DiaDiem"));
				dk.setNgayLam(rs.getString("NgayLam"));
				dk.setGioLam(rs.getString("GioLam"));
				dk.setSogioLam(rs.getInt("SoGioLam"));
				dk.setTenCTV(rs.getString("TenTaiKhoan"));
				dk.setMaNguoiDung(rs.getString("MaNguoiDung"));
				dk.setTrangThai(rs.getInt("TrangThai"));
				dsDangKy.add(dk);
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

		return dsDangKy;
	}

	public ArrayList<DangKyDichVu> layDanhSachDangKyDichVuTheoMaCTV(String maCTV) {
		// TODO Auto-generated method stub
		Connection conn = ConnectDB.getConnection();
		ArrayList<DangKyDichVu> dsDangKy = new ArrayList<>();
		try {
			CallableStatement call = conn.prepareCall("{call GrapOsin_layDanhSachDangKyDichVuTheoMaCTV(?)}");
			call.setString(1, maCTV);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				DangKyDichVu dk = new DangKyDichVu();
				dk.setMaDangKy(rs.getString("MaDangKy"));
				dk.setMaDichVu(rs.getString("MaDichVu"));
				dk.setTenDichVu(rs.getString("TenDichVu"));
				dk.setDonGia(rs.getInt("DonGia"));
				dk.setMoTa(rs.getString("MoTa"));
				dk.setSoDienThoai(rs.getString("SoDienThoai"));
				dk.setDiaDiem(rs.getString("DiaDiem"));
				dk.setNgayLam(rs.getString("NgayLam"));
				dk.setGioLam(rs.getString("GioLam"));
				dk.setSogioLam(rs.getInt("SoGioLam"));
				dk.setTenCTV(rs.getString("TenTaiKhoan"));
				dk.setMaNguoiDung(rs.getString("MaNguoiDung"));
				dk.setTrangThai(rs.getInt("TrangThai"));
				dsDangKy.add(dk);
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

		return dsDangKy;
	}
}
