package org.bgrimm.utils;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.bgrimm.domain.bgrimm.TimeValue;


public  class DataUtils {

	public final static <T> List<T> packingData(List<String> filedNameList,List<T> dataList){
		List listdata=new ArrayList();
		String fieldName=(String)filedNameList.get(0);
		Double sqrtValue = 0.0;
		String newDate="";
		Date iniDate=new Date() ;
		double d = 0;
		for(Object obj: dataList){
//			ParameterizedType parameterizedType =  (ParameterizedType) DataUtils.class.getGenericSuperclass();
//	        Type[] types = parameterizedType.getActualTypeArguments();
	        try{
	        	
	        	
	        	Field f=obj.getClass().getDeclaredField(fieldName);
	         	f.setAccessible(true);
	         	double fieldValue=((BigDecimal)f.get(obj)).doubleValue();
	        	Field f1=obj.getClass().getDeclaredField("dateTime");
	        	f1.setAccessible(true);
	        	Date time=(Date)f1.get(obj);
	        	String fullTime=DateUtils.date2String(time);
	        	
	        	String datetime=fullTime.substring(0, 10);
	        	
	        	if ("".equals(newDate)) {
					newDate = datetime;
					sqrtValue = fieldValue;
					iniDate = time;
					d++;
				} else if (newDate.equals(datetime)) {
					sqrtValue += fieldValue;
					d++;
				} else if (!newDate.equals(datetime)) {

					List resultList = new ArrayList();
					double dayValue = sqrtValue / d;
					resultList.add(iniDate);
					resultList.add(new BigDecimal(dayValue).setScale(3, BigDecimal.ROUND_HALF_UP));
					listdata.add(resultList);
					iniDate = time;
					newDate = datetime;
					sqrtValue = fieldValue;
					d = 1;
					}
	        	
	        }catch(Exception exception){
	        	
	        }
		}
		return listdata;
	}


	public static List objectList2JSonList(List li, Object ...object) {

		try {
				List list=new ArrayList();
				for(Object o: li){
						List l=new ArrayList();
						Field datetime=o.getClass().getDeclaredField(object[0].toString());
						Field value=o.getClass().getDeclaredField(object[1].toString());
						datetime.setAccessible(true);
						value.setAccessible(true);
						Date date=(Date)datetime.get(o);
						BigDecimal val=new BigDecimal(value.get(o).toString());
						l.add(date);
						l.add(val);
						list.add(l);
				}
				return list;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}
	
	
}
