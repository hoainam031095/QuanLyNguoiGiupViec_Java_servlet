package model.bean;

public class DichVu {
	private String maDichVu;
	private String tenDichVu;
	private int donGia;
	private String moTa;

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

	public DichVu() {
		super();
	}

	public DichVu(String maDichVu, String tenDichVu, int donGia, String moTa) {
		super();
		this.maDichVu = maDichVu;
		this.tenDichVu = tenDichVu;
		this.donGia = donGia;
		this.moTa = moTa;
	}

}
