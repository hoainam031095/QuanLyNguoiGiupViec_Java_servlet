package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.UngVien;

public class UngVienDAO{
	Connection connection = null;;

	private void connect() {
		connection = ConnectDB.getConnection();
	}
	
	public ArrayList<UngVien> layDanhSachUngVien() {
		connect();
		String sql=	"select uv.*, dv.TenDichVu from UngVien uv inner join DichVu dv on dv.MaDichVu = uv.MaDichVu "
				+ "where SoDienThoai not in (select SoDienThoai From CongTacVien)";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<UngVien> list = new ArrayList<UngVien>();
		UngVien ungVien;
		try {
			while(rs.next()){
				ungVien = new UngVien();
				ungVien.setHoTen(rs.getString(1));
				ungVien.setSoDienThoai(rs.getString(2));
				ungVien.setNamSinh(rs.getInt(3));
				ungVien.setDiaChi(rs.getString(4));
				ungVien.setTenDichVu(rs.getString(6));
				list.add(ungVien);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public ArrayList<UngVien> layDanhSachUngVienTheoDV(String maDichVu) {
		connect();
		String sql=	String.format("select uv.*, dv.TenDichVu from UngVien uv inner join DichVu dv on dv.MaDichVu = uv.MaDichVu "
				+ "where SoDienThoai not in (select SoDienThoai From CongTacVien) and dv.MaDichVu = '%s'",maDichVu);
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<UngVien> list = new ArrayList<UngVien>();
		UngVien ungVien;
		try {
			while(rs.next()){
				ungVien = new UngVien();
				ungVien.setHoTen(rs.getString(1));
				ungVien.setSoDienThoai(rs.getString(2));
				ungVien.setNamSinh(rs.getInt(3));
				ungVien.setDiaChi(rs.getString(4));
				ungVien.setTenDichVu(rs.getString(6));
				list.add(ungVien);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public UngVien layUngVienTheoSoDienThoai(String soDienThoai) {
		connect();
		UngVien ungVien = null;
		String sql = "select uv.*,TenDichVu from UngVien uv inner join DichVu dv on dv.MaDichVu = uv.MaDichVu where SoDienThoai = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, soDienThoai);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String hoTen = rs.getString(1);
				int namSinh = rs.getInt(3);
				String diaChi = rs.getString(4);
				String tenDichVu = rs.getString(6);
				ungVien = new UngVien(hoTen, soDienThoai, namSinh, diaChi, tenDichVu) {
				};
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ungVien;
	}

	public void themUngVien(String hoTen, String soDienThoai, int namSinh, String diaChi, String maDichVu) {
		connect();
		String sql = "insert into UngVien values(?,?,?,?,?)";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, hoTen);
			ps.setString(2, soDienThoai);
			ps.setInt(3, namSinh);
			ps.setString(4, diaChi);
			ps.setString(5, maDichVu);
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

	public void suaUngVienTheoSoDienThoai(String hoTen,String soDienThoai, int namSinh, String diaChi, String maDichVu) {
		connect();
		String sql = "update UngVien set HoTen = ?, NamSinh = ?, DiaChi = ?, MaDichVu = ? where  SoDienThoai = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, hoTen);
			ps.setString(2, soDienThoai);
			ps.setInt(3, namSinh);
			ps.setString(4, diaChi);
			ps.setString(5, maDichVu);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void xoaUngVienTheoSoDienThoai(String soDienThoai) {
		connect();
		String sql = "delete from UngVien where SoDienThoai = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		UngVienDAO  uv = new UngVienDAO();
		UngVien uvn = uv.layUngVienTheoSoDienThoai("0976573743");
		System.out.println(uvn.getTenDichVu());
	}

	public boolean kiemTraUngVien(String soDienThoai) {
		connect();
		String sql = "select * from UngVien where SoDienThoai = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, soDienThoai);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
}
