package org.bgrimm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateUtils {

	//将页面获取时间字符串转为Date类型
		public static Date strToDate(String time) {

			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 try {
				return sdf.parse(time);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return null;
		}
	//获取当前时间到7天前的时间
	public static List getTimeOfAWeek(){
		List list=new ArrayList();
		Calendar cal=Calendar.getInstance();
		java.util.Date currentTime=cal.getTime();
		cal.add(Calendar.DAY_OF_WEEK, -7);
		java.util.Date Oldtime=cal.getTime();
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
//		String currentTime=sdf.format(date);
//		String Oldtime=sdf.format(date1);
		list.add(Oldtime);
		list.add(currentTime);
		return list;
	}
}
