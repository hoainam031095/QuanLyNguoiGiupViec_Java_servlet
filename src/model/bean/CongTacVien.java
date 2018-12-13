package model.bean;

public class CongTacVien extends UngVien {
	private String maCongTacVien;
	private int trangThai;
	private float danhGia;
	
	private String tenTaiKhoan;
	private int soLanLV;
	private String avatar;

	public String getTenTaiKhoan() {
		return tenTaiKhoan;
	}

	public void setTenTaiKhoan(String tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}

	public int getSoLanLV() {
		return soLanLV;
	}

	public void setSoLanLV(int soLanLV) {
		this.soLanLV = soLanLV;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public CongTacVien(String hoTen, String soDienThoai, int namSinh, String diaChi, String tenDichVu,
			String maCongTacVien, int trangThai, float danhGia) {
		super(hoTen, soDienThoai, namSinh, diaChi, tenDichVu);
		this.maCongTacVien = maCongTacVien;
		this.trangThai = trangThai;
		this.danhGia = danhGia;
	}

	
	public CongTacVien(float danhGia,String tenTaiKhoan, int soLanLV, String avatar) {
		this.danhGia = danhGia;
		this.tenTaiKhoan = tenTaiKhoan;
		this.soLanLV = soLanLV;
		this.avatar = avatar;
	}

	public String getMaCongTacVien() {
		return maCongTacVien;
	}

	public void setMaCongTacVien(String maCongTacVien) {
		this.maCongTacVien = maCongTacVien;
	}

	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

	public float getDanhGia() {
		return danhGia;
	}

	public void setDanhGia(float danhGia) {
		this.danhGia = danhGia;
	}

	public CongTacVien() {
		
	}
}
