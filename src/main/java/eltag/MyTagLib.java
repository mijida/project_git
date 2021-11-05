package eltag;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.websocket.Session;

import model.BbsDAO;
import model.BbsDTO;

public class MyTagLib {
	//문자열이 숫자 형식이면 true, 아니면 false 반환
	public static boolean isNumber(String value) {
		for(int i=0;i < value.length();i++) {
			if(!(value.codePointAt(i) >='0' && value.codePointAt(i) <='9'))
				return false;
		}
		return true;
	}//////	
	/*
	 * 주민번호 예]123456-1234567
	    9 : 1800 ~ 1899년에 태어난 남성
		0 : 1800 ~ 1899년에 태어난 여성
		1 : 1900 ~ 1999년에 태어난 남성
		2 : 1900 ~ 1999년에 태어난 여성
		3 : 2000 ~ 2099년에 태어난 남성
		4 : 2000 ~ 2099년에 태어난 여성
		5 : 1900 ~ 1999년에 태어난 외국인 남성
		6 : 1900 ~ 1999년에 태어난 외국인 여성
		7 : 2000 ~ 2099년에 태어난 외국인 남성
		8 : 2000 ~ 2099년에 태어난 외국인 여성	
	 */
	public static String getGender(String ssn) {
		int beginIndex = ssn.indexOf("-")+1;
		int endIndex = beginIndex+1;
		String gender = ssn.substring(beginIndex, endIndex);
		switch(Integer.parseInt(gender)) {
			case 1:
			case 3:
			case 9:return "남성";
			case 0:
			case 2:
			case 4:return "여성";
			case 5:
			case 7:return "외국인 남성";
			case 6:
			case 8:return "외국인 여성";
			default:return "유효하지 않은 주민번호입니다";
			
		}
	}/////////////
	
	public static boolean isMember(String user,ServletContext application,String pass) {
		BbsDAO dao = new BbsDAO(application);
		boolean flag=dao.isMember(user, pass);
		dao.close();
			return flag;
	}////
	
	public static List<BbsDTO> selectList(ServletContext application,int start,int end) {
		BbsDAO dao = new BbsDAO(application);
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<BbsDTO> lists = dao.selectList(map);
		dao.close();
			return lists;
	}////

}
