package model.bean;

public class UngVien {
	private String hoTen;
	private String soDienThoai;
	private int namSinh;
	private String diaChi;
	private String maDichVu;
	private String tenDichVu; //chuyên môn

	public String getTenDichVu() {
		return tenDichVu;
	}

	public void setTenDichVu(String tenDichVu) {
		this.tenDichVu = tenDichVu;
	}

	public UngVien(String hoTen, String soDienThoai, int namSinh, String diaChi, String tenDichVu) {
		super();
		this.hoTen = hoTen;
		this.soDienThoai = soDienThoai;
		this.namSinh = namSinh;
		this.diaChi = diaChi;
		this.tenDichVu = tenDichVu;
	}

	public UngVien() {

	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public int getNamSinh() {
		return namSinh;
	}

	public void setNamSinh(int namSinh) {
		this.namSinh = namSinh;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getMaDichVu() {
		return maDichVu;
	}

	public void setMaDichVu(String maDichVu) {
		this.maDichVu = maDichVu;
	}

}
