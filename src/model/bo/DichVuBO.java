package model.bo;

import java.util.ArrayList;

import model.bean.DichVu;
import model.dao.DichVuDAO;

/**
 * DichVuBO.java
 * 
 * Date: Aug 13, 2018
 * 
 * DATE               AUTHOR          DESCRIPTION				
 * -------------------------------------------------				
 * Aug 13, 2018        DanTT           Create				
 */
public class DichVuBO {

	DichVuDAO dichVuDAO  = new DichVuDAO();
	public ArrayList<DichVu> layDanhSachDichVu() {
		// TODO Auto-generated method stub
		return dichVuDAO.layDanhSachDichVu();
	}
	public void themDichVu(DichVu dv){
		dichVuDAO.themDichVu(dv);
	}
	public void xoaDichVu(String maDichVu) {
		dichVuDAO.xoaDichVu(maDichVu);
	}
	
	public void suaDichVu(DichVu dv) {
		dichVuDAO.suaDichVu(dv);
	}
	public DichVu layThongTinDichVu(String maDichVu) {
		return dichVuDAO.layThongTinDichVu(maDichVu);
	}

}
