package org.bgrimm;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

public class Tester {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String str="/";
		String[] urlsplits=StringUtils.split(str,"/");
		System.out.println(urlsplits.length);
		
	}
	
	
	public void test(){
		//Calendar的调用
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.sss");
		Calendar cal=Calendar.getInstance();
		try {
			String datetime=sdf.format(new Date());
			System.out.println(datetime);
			cal.add(Calendar.DATE,-7);
			String datetime1=sdf.format(cal.getTime());
			System.out.println(datetime1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
