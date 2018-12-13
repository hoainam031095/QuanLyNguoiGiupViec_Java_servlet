package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.NguoiDung;

public class NguoiDungDAO {
	Connection connection = null;;

	private void connect() {
		connection = ConnectDB.getConnection();
	}

	public int checkLogin(String tenDangNhap, String matKhau) {
		connect();
		String sql = "select * from NguoiDung where SoDienThoai = ? and MatKhau = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, tenDangNhap);
			ps.setString(2, matKhau);
			rs = ps.executeQuery();
			if (rs.next()) {
				if(rs.getInt(6) == 1) {
					return 1;
				}if(rs.getInt(6) == 2) {
					return 2;
				}if(rs.getInt(6) == 3){
					return 3;
				}
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
		return 0;
	}

	public ArrayList<NguoiDung> layDanhSachNguoiDung() {
		connect();
		
		String sql = "select * from NguoiDung";
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		ArrayList<NguoiDung> danhSachNguoiDung = new ArrayList<>();
		NguoiDung nguoiDung;
		try {
			while (rs.next()) {
				nguoiDung = new NguoiDung();
				nguoiDung.setMaNguoiDung(rs.getString(1));
				nguoiDung.setTenTaiKhoan(rs.getString(2));
				nguoiDung.setSoDienThoai(rs.getString(3));
				nguoiDung.setMatKhau(rs.getString(4));
				nguoiDung.setEmail(rs.getString(5));
				nguoiDung.setMaQuyen(rs.getInt(6));
				if (rs.getInt(6) != 2) {
					nguoiDung.setMaCongTacVien("None");
				} else {
					nguoiDung.setMaCongTacVien(rs.getString(7));
				}
				danhSachNguoiDung.add(nguoiDung);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return danhSachNguoiDung;
	}

	public NguoiDung layNguoiDungTheoMaNguoiDung(String maNguoiDung) {
		NguoiDung nguoiDung = new NguoiDung();
		connect();
		String sql = "select * from NguoiDung where MaNguoiDung = ?";
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, maNguoiDung);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				nguoiDung.setMaNguoiDung(rs.getString(1));
				nguoiDung.setTenTaiKhoan(rs.getString(2));
				nguoiDung.setSoDienThoai(rs.getString(3));
				nguoiDung.setMatKhau(rs.getString(4));
				nguoiDung.setEmail(rs.getString(5));
				nguoiDung.setMaQuyen(rs.getInt(6));
				if (rs.getInt(6) != 2) {
					nguoiDung.setMaCongTacVien("None");
				} else {
					nguoiDung.setMaCongTacVien(rs.getString(7));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return nguoiDung;
	}
	
	public NguoiDung layNguoiDungTheoTen(String tenTaiKhoan) {
		NguoiDung nguoiDung = new NguoiDung();
		connect();
		String sql = "select * from NguoiDung where SoDienThoai = ?";
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, tenTaiKhoan);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				nguoiDung.setMaNguoiDung(rs.getString(1));
				nguoiDung.setTenTaiKhoan(rs.getString(2));
				nguoiDung.setSoDienThoai(rs.getString(3));
				nguoiDung.setMatKhau(rs.getString(4));
				nguoiDung.setEmail(rs.getString(5));
				nguoiDung.setMaQuyen(rs.getInt(6));
				if (rs.getInt(6) != 2) {
					nguoiDung.setMaCongTacVien("None");
				} else {
					nguoiDung.setMaCongTacVien(rs.getString(7));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return nguoiDung;
	}

	public void themNguoiDung(String maNguoiDung, String tenTaiKhoan, String soDienThoai, String matKhau, String email,
			int maQuyen, String maCongTacVien) {
		connect();
		PreparedStatement ps = null;

		try {
			if (maQuyen == 2) {
				String sql = "insert into NguoiDung values(?,?,?,?,?,?,?,?) ";
				ps = connection.prepareStatement(sql);
				ps.setString(1, maNguoiDung);
				ps.setNString(2, tenTaiKhoan);
				ps.setString(3, soDienThoai);
				ps.setString(4, matKhau);
				ps.setString(5, email);
				ps.setInt(6, maQuyen);
				ps.setString(7, maCongTacVien);
				ps.setString(8,"user1-128x128.jpg");
			} else {
				String sql = "insert into NguoiDung (MaNguoiDung,TenTaiKhoan,SoDienThoai,MatKhau,Email,MaQuyen) values(?,?,?,?,?,?) ";
				ps = connection.prepareStatement(sql);
				ps.setString(1, maNguoiDung);
				ps.setNString(2, tenTaiKhoan);
				ps.setString(3, soDienThoai);
				ps.setString(4, matKhau);
				ps.setString(5, email);
				ps.setInt(6, maQuyen);
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void suaNguoiDungTheoMa(String maNguoiDung, String tenTaiKhoan, String soDienThoai, String matKhau,
			String email, int maQuyen, String maCongTacVien) {
		connect();
		String sql = "update NguoiDung set TenTaiKhoan = ?, SoDienThoai = ?,MatKhau = ?, Email = ?,MaQuyen = ?, MaCTV= ? where MaNguoiDung = ? ";
		PreparedStatement ps = null;

		try {
			ps = connection.prepareStatement(sql);
			ps.setString(7, maNguoiDung);
			ps.setString(1, tenTaiKhoan);
			ps.setString(2, soDienThoai);
			ps.setString(3, matKhau);
			ps.setString(4, email);
			ps.setInt(5, maQuyen);
			if (maQuyen == 2) {
				ps.setString(6, maCongTacVien);
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} 
	
	public void xoaNguoiDungTheoMa(String maNguoiDung) {
			connect();
			String sql = "delete from NguoiDung where MaNguoiDung = ? ";
			try {
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setString(1, maNguoiDung);
				ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public static void main(String[] args) {
		NguoiDungDAO nd = new NguoiDungDAO();
		if(nd.layDanhSachNguoiDung() == null ) {
			System.out.println("k lấy đc");
		}
		if(nd.layDanhSachNguoiDung().size() == 0 ) {
			System.out.println("không có dl");
		} else {
			System.out.println(nd.layDanhSachNguoiDung().size());
		}
	}
	
	public boolean kiemTraNguoiDung(String soDienThoai) {
		connect();
		String sql = "select * from NguoiDung where SoDienThoai = ?";
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
		}
		return false;
	}
	public NguoiDung layNguoiDungTheoMaCTV(String maCTV) {
		// TODO Auto-generated method stub
		NguoiDung nguoiDung = new NguoiDung();
		connect();
		String sql = "select * from NguoiDung where MaCTV = ?";
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, maCTV);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				nguoiDung.setMaNguoiDung(rs.getString(1));
				nguoiDung.setTenTaiKhoan(rs.getString(2));
				nguoiDung.setSoDienThoai(rs.getString(3));
				nguoiDung.setMatKhau(rs.getString(4));
				nguoiDung.setEmail(rs.getString(5));
				nguoiDung.setMaQuyen(rs.getInt(6));
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
		return nguoiDung;
	}
	
	public int laySoDichVuDuocNguoiDungDangKy(String maNguoiDung) {
		connect();
		int dem = 0;
		String sql = String.format(
				"select nd.MaNguoiDung,nd.TenTaiKhoan ,dk.MaNguoiDung,  count(dk.MaNguoiDung) from NguoiDung nd \r\n"
						+ "inner join DangKyDichVu dk \r\n" + "on nd.MaNguoiDung = dk.MaNguoiDung\r\n"
						+ "where dk.MaNguoiDung ='%s' \r\n" + "group by nd.MaNguoiDung, dk.MaNguoiDung, nd.TenTaiKhoan",
				maNguoiDung);

		try {
			PreparedStatement pstm = connection.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				dem = Integer.parseInt(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.toString();
		}
		return dem;
	}

}
