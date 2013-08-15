package org.bgrimm.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


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
						BigDecimal val=null;
						if(object[2]!=null&&Constants.JCD_BMWY.equals(object[2])){
							val=new BigDecimal(value.get(o).toString()).multiply(new BigDecimal(1000));
							System.out.println(val);
						}else{
							val=new BigDecimal(value.get(o).toString());
						}
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
	
	
	public static void setDecimalDigits(List dataList,String type){
		//System.out.println(dataList);
		try {
			for(Object obj:dataList){
				if(type!=null){
					Field de=obj.getClass().getDeclaredField("dE");
					de.setAccessible(true);
					Field dh=obj.getClass().getDeclaredField("dH");
					dh.setAccessible(true);
					Field dn=obj.getClass().getDeclaredField("dN");
					dn.setAccessible(true);
					Method deM=obj.getClass().getMethod("setdE",de.getType());
					Method dhM=obj.getClass().getMethod("setdH",dh.getType());
					Method dnM=obj.getClass().getMethod("setdN",dn.getType());
					double deValue=new BigDecimal((Double)de.get(obj)*1000).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
					double dhValue=new BigDecimal((Double)dh.get(obj)*1000).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
					double dnValue=new BigDecimal((Double)dn.get(obj)*1000).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
					deM.invoke(obj, deValue);
					dhM.invoke(obj, dhValue);
					dnM.invoke(obj, dnValue);
				}else{
					Field value=obj.getClass().getDeclaredField("value");
					value.setAccessible(true);
					Method method=obj.getClass().getMethod("setValue", value.getType());
					BigDecimal bd=(BigDecimal)value.get(obj);
					method.invoke(obj, bd.setScale(2,BigDecimal.ROUND_HALF_UP));
					//System.out.println(obj);
				}
				
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		}catch(Exception e){
			
		}
		
	}
	
}
