package org.bgrimm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	//将页面获取时间字符串转为Date类型
		public static Date strToDate(String time) {

			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			 try {
				return sdf.parse(time);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return null;
		}
}
