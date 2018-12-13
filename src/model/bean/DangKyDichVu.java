package model.bean;

import java.util.Date;

public class DangKyDichVu {
	private String maDangKy;
	private String maDichVu;
	private String tenDichVu;
	private int donGia;
	private String moTa;
	private String soDienThoai;
	private String diaDiem;
	private String ngayLam;
	private String gioLam;

	private int soGioLam;
	private String maCTV;
	private String tenCTV;

	public String getGioLam() {
		return gioLam;
	}

	public void setGioLam(String gioLam) {
		this.gioLam = gioLam;
	}

	public int getSoGioLam() {
		return soGioLam;
	}

	public void setSoGioLam(int soGioLam) {
		this.soGioLam = soGioLam;
	}

	public String getTenCTV() {
		return tenCTV;
	}

	public void setTenCTV(String tenCTV) {
		this.tenCTV = tenCTV;
	}

	private String maNguoiDung;
	private int trangThai;

	public String getMaDangKy() {
		return maDangKy;
	}

	public void setMaDangKy(String maDangKy) {
		this.maDangKy = maDangKy;
	}

	public String getMaDichVu() {
		return maDichVu;
	}

	public void setMaDichVu(String maDichVu) {
		this.maDichVu = maDichVu;
	}

	public String getTenDichVu() {
		return tenDichVu;
	}

	public void setTenDichVu(String tenDichVu) {
		this.tenDichVu = tenDichVu;
	}

	public int getDonGia() {
		return donGia;
	}

	public void setDonGia(int donGia) {
		this.donGia = donGia;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getDiaDiem() {
		return diaDiem;
	}

	public void setDiaDiem(String diaDiem) {
		this.diaDiem = diaDiem;
	}

	public String getNgayLam() {
		return ngayLam;
	}

	public void setNgayLam(String ngayLam) {
		this.ngayLam = ngayLam;
	}

	public int getSogioLam() {
		return soGioLam;
	}

	public void setSogioLam(int sogioLam) {
		this.soGioLam = sogioLam;
	}

	public String getMaCTV() {
		return maCTV;
	}

	public void setMaCTV(String maCTV) {
		this.maCTV = maCTV;
	}

	public String getMaNguoiDung() {
		return maNguoiDung;
	}

	public void setMaNguoiDung(String maNguoiDung) {
		this.maNguoiDung = maNguoiDung;
	}

	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

	public DangKyDichVu(String maDangKy, String maDichVu, String soDienThoai, String diaDiem, String ngayLam,
			int soGioLam, String maCTV, String maNguoiDung, int trangThai) {
		super();
		this.maDangKy = maDangKy;
		this.maDichVu = maDichVu;
		this.soDienThoai = soDienThoai;
		this.diaDiem = diaDiem;
		this.ngayLam = ngayLam;
		this.soGioLam = soGioLam;
		this.maCTV = maCTV;
		this.maNguoiDung = maNguoiDung;
		this.trangThai = trangThai;
	}

	public DangKyDichVu() {
		super();
	}

}
