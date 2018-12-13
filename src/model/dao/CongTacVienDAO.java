package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.CongTacVien;
import model.bean.DangKyDichVu;
import model.bean.UngVien;
import model.bo.UngVienBO;

public class CongTacVienDAO {
	Connection connection = null;
	UngVienBO ungVienBO = new UngVienBO();

	void connnect() {
		connection = ConnectDB.getConnection();
	}

	public ArrayList<CongTacVien> layDanhSachCongTacVien() {
		connnect();
		ArrayList<CongTacVien> danhSachCongTacVien = new ArrayList<CongTacVien>();
		String sql = "select ctv.*, dv.TenDichVu  from UngVien uv inner join DichVu dv on dv.MaDichVu = uv.MaDichVu\r\n"
				+ "inner join CongTacVien ctv on uv.SoDienThoai = ctv.SoDienThoai";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UngVien ungVien = ungVienBO.layUngVienTheoSoDienThoai(rs.getString(2));
				String hoTen = ungVien.getHoTen();
				String soDienThoai = ungVien.getSoDienThoai();
				int namSinh = ungVien.getNamSinh();
				String diaChi = ungVien.getDiaChi();
				String tenDichVu = ungVien.getTenDichVu();
				String maCongTacVien = rs.getString(1);
				int trangThai = rs.getInt(3);
				float danhGia = rs.getFloat(4);
				CongTacVien congTacVien = new CongTacVien(hoTen, soDienThoai, namSinh, diaChi, tenDichVu, maCongTacVien,
						trangThai, danhGia);
				danhSachCongTacVien.add(congTacVien);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return danhSachCongTacVien;
	}

	public ArrayList<CongTacVien> layDanhSachCongTacVienTheoDV(String maDichVu) {
		connnect();
		ArrayList<CongTacVien> danhSachCongTacVien = new ArrayList<CongTacVien>();
		String sql = String.format(
				"select ctv.*, dv.TenDichVu  from UngVien uv inner join DichVu dv on dv.MaDichVu = uv.MaDichVu\r\n"
						+ "inner join CongTacVien ctv on uv.SoDienThoai = ctv.SoDienThoai where dv.MaDichVu = '%s'",
				maDichVu);
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UngVien ungVien = ungVienBO.layUngVienTheoSoDienThoai(rs.getString(2));
				String hoTen = ungVien.getHoTen();
				String soDienThoai = ungVien.getSoDienThoai();
				int namSinh = ungVien.getNamSinh();
				String diaChi = ungVien.getDiaChi();
				String tenDichVu = rs.getString(5);
				String maCongTacVien = rs.getString(1);
				int trangThai = rs.getInt(3);
				float danhGia = rs.getFloat(4);
				CongTacVien congTacVien = new CongTacVien(hoTen, soDienThoai, namSinh, diaChi, tenDichVu, maCongTacVien,
						trangThai, danhGia);
				danhSachCongTacVien.add(congTacVien);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return danhSachCongTacVien;
	}

	public CongTacVien layCongTacVienTheoSoDienThoai(String soDienThoai) {
		connnect();
		CongTacVien congTacVien = null;
		String sql = "select * from CongTacVien";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UngVien ungVien = ungVienBO.layUngVienTheoSoDienThoai(rs.getString(2));
				String hoTen = ungVien.getHoTen();
				int namSinh = ungVien.getNamSinh();
				String diaChi = ungVien.getDiaChi();
				String maDichVu = ungVien.getMaDichVu();
				String maCongTacVien = rs.getString(1);
				int trangThai = rs.getInt(3);
				float danhGia = rs.getFloat(4);
				congTacVien = new CongTacVien(hoTen, soDienThoai, namSinh, diaChi, maDichVu, maCongTacVien, trangThai,
						danhGia);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return congTacVien;
	}

	public void suaCongTacVienTheoSoDienThoai(String hoTen, String soDienThoai, int namSinh, String diaChi,
			String maDichVu, String maCongTacVien, int trangThai, float danhGia) {
		connnect();
		ungVienBO.suaUngVienTheoSoDienThoai(hoTen, soDienThoai, namSinh, diaChi, maDichVu);
		String sql = "update CongTacVien set MaCTV = ?, SoDienThoai = ?, TrangThai = ?, DanhGia = ?";
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, maCongTacVien);
			ps.setString(2, soDienThoai);
			ps.setInt(3, namSinh);
			ps.setFloat(4, danhGia);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void xoaCongTacVienTheoSoDienThoai(String soDienThoai) {
		connnect();
		ungVienBO.xoaUngVienTheoSoDienThoai(soDienThoai);
		String sql = "delete from CongTacVien where SoDienThoai = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public void themCongTacVien(String maCTV, String soDienThoai, int trangThai, float danhGia) {
		connnect();
		String sql = "insert into CongTacVien values(?,?,?,?)";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, maCTV);
			ps.setString(2, soDienThoai);
			ps.setInt(3, trangThai);
			ps.setFloat(4, danhGia);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public int laySoLanLamViecCTV(String maCTV) {
		connnect();
		int soLan = 0;
		try {
			CallableStatement call = connection.prepareCall("{call GrapOsin_demSoLanLamViecCTV(?)}");
			call.setString(1, maCTV);
			ResultSet rs = call.executeQuery();
			while (rs.next()) {
				soLan = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.toString();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return soLan;
	}

	public float layDanhGiaHT(String maCTV) {
		// TODO Auto-generated method stub
		String sql = String.format("SELECT DanhGia FROM CongTacVien Where MaCTV = '%s'", maCTV);
		connnect();
		float rating = 0;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				rating = rs.getFloat(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rating;
	}

	public void capNhatDanhGiaCTV(String maCTV, float danhGia) throws SQLException {
		// TODO Auto-generated method stub
		connnect();
		String sql = "Update CongTacVien set DanhGia = ? where MaCTV = ?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setFloat(1, danhGia);
		ps.setString(2, maCTV);
		ps.executeUpdate();
		connection.close();
	}
	
	public ArrayList<CongTacVien> layBangXepHangCTV(){
		connnect();
		ArrayList<CongTacVien> list = new ArrayList<CongTacVien>();
		CongTacVien ctv;
		String sql = "	select TOP 5 Avatar, TenTaiKhoan, count(*) as SoLanLV , FORMAT(DanhGia, 'N1') as Rating\r\n" + 
				"	from CongTacVien ctv \r\n" + 
				"		inner join NguoiDung nd on nd.MaCTV = ctv.MaCTV\r\n" + 
				"		inner join DangKyDichVu dk on dk.MaCTV = ctv.MaCTV\r\n" + 
				"	where dk.TrangThai = 3\r\n" + 
				"	group by  Avatar, TenTaiKhoan,DanhGia\r\n" + 
				"	order by DanhGia DESC, SoLanLV DESC";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ctv = new CongTacVien();
				ctv.setAvatar(rs.getString(1));
				ctv.setTenTaiKhoan(rs.getString(2));
				ctv.setSoLanLV(rs.getInt(3));
				ctv.setDanhGia(rs.getFloat(4));
				list.add(ctv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
}
