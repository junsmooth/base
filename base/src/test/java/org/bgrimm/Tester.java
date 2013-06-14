package org.bgrimm;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
	
	
	public void tes1t(){
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
	public void test(){
		List l=getList();
		for(Object obj: l){
			System.out.println("success!");
		}
	
	}
	
	public List<Object> getList(){
		List l=new ArrayList();
		l.add("afds");
		return l;
	}

}
