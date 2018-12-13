package common;

/**
 * StringProcess.java
 * 
 * Date: Aug 13, 2018
 * 
 * DATE AUTHOR DESCRIPTION ------------------------------------------------- Aug
 * 13, 2018 DanTT Create
 */
public class StringProcess {
	public static String nhomQuyen(int val) {
		if (val == 1) {
			return "Admin";
		} else if (val == 2) {
			return "CTV";
		}
		return "Khách Hàng";
	}
	
	public static String getVaildString(String s) {
		if(s==null) return "";
		return s;
	}
	
	public static String trangThaiCTV(int status) {
		if(status == 0)
			return "Rảnh";
		else
			return "Bận";
	}
	
	public static String trangThaiCV(int status) {
		if(status == 1)
			return "Chưa có người nhận";
		else if(status == 2)
			return "Đã có người nhận";
		else return "Đã hoàn thành";
			
	}
	
	public static String validTenCTV(String s) {
		if(s==null) return "Chưa có CTV";
		return s;
	}
}
