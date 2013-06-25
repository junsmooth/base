package org.bgrimm.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.monitor.datamigration.TJRX;
import org.bgrimm.domain.bgrimm.monitor.provided.JRX;
import org.bgrimm.utils.Constants;
import org.bgrimm.utils.DateUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service("packingDataServiceImpl")
@Transactional
public class PackingDataServiceImpl {
	
	@Autowired
	private CommonDao commonDao;
	
//	@Transactional(isolation=Isolation.DEFAULT,readOnly=false)
//	@Scheduled(fixedRate =60*60*1000)
	public void  packingDataOfHour(){
		//1.   Get All MonitoringPoint 
		//2. For  each MonitoringPoint
		//2.1  IF MonitoringPoint.type==BMWY , ...
		//2.2  Get MonitoringType, type
		//     type.domainClsName
		
		
		//get CurrentDate
		//
		
		 List<TJRX> newJrxList=	commonDao.loadAll(TJRX.class);
		 if(newJrxList.size()==0){
//			 List<Saturation> jrxList= commonDao.loadAll(Saturation.class);
				MonitoringType t=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_JRX);
				List<MonitoringPoint> jrxPointList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
				Criteria criteria=commonDao.getSession().createCriteria(JRX.class);
				List<Integer> positions = new ArrayList();
				for (MonitoringPoint p : jrxPointList) {
					positions.add(p.getPosition());
				}
				criteria.add(Restrictions.in("monitoringPosition", positions.toArray()));
				List<JRX> jrxList=criteria.list();
				
				Double sqrtValue = 0.0;
				String newDate="";
				Date initDateOfhour=new Date() ;
				double d = 0;
			 for(JRX saturation: jrxList){
				 Date satDate=saturation.getDateTime();
				 double value=	saturation.getValue().doubleValue();
				 String dateString=DateUtils.date2String(satDate);
				 
				 String dateString_hour=(dateString.substring(0, 13)).split(":")[0];
				 
				 if ("".equals(newDate)) {
						newDate = dateString_hour;
						sqrtValue = value;
						d++;
					} else if (newDate.equals(dateString_hour)) {
						sqrtValue += value;
						d++;
						initDateOfhour=satDate;
					} else {

						double dayValue = sqrtValue / d;
						TJRX tsa=null;
//								new TSaturation(initDateOfhour, new BigDecimal(dayValue).setScale(3, BigDecimal.ROUND_HALF_UP));
						commonDao.save(tsa);
						initDateOfhour = satDate;
						newDate = dateString_hour;
						sqrtValue = value;
						System.out.println(d);
						d = 1;
						}
		        	
			 }
		 }else {
			 
			 Criteria criteria=commonDao.getSession().createCriteria(TJRX.class);
			 criteria.addOrder(Order.desc("dateTime"));
			 List dataList=criteria.list();
			 
			
			TJRX sa=(TJRX)dataList.get(0);
			Date initDate= sa.getDateTime();
			String initDateString=DateUtils.date2String(initDate);
			String initDate_hour=(initDateString.substring(0, 13)).split(":")[0];
			double initValue= sa.getValue().doubleValue();
			 
			 Date nowDate=new Date();
			 String nowDateString=DateUtils.date2String(nowDate);
			 String nowDate_hour=(nowDateString.substring(0, 13)).split(":")[0];
			
			 
			 Criteria cri=commonDao.getSession().createCriteria(JRX.class);
//			 cri.add(Restrictions.between("dateTime", initDate, nowDate));
			 cri.add(Restrictions.gt("dateTime", initDate));
			 cri.add(Restrictions.lt("dateTime", nowDate));
			List<JRX> listByCon= cri.list();
			if(listByCon.size()>0){
				System.out.println("listByCon.size():"+listByCon.size());
				Double sqrtValue = 0.0;
				Boolean flag=true;
				String newDate="";
				Date initDateOfhour=new Date() ;
				double d = 0;
				
				
				for(JRX sat: listByCon){
					
					 Date satDate=sat.getDateTime();
					 double value=	sat.getValue().doubleValue();
					 String dateString_sat=DateUtils.date2String(satDate);
					 
					 String dateString_hour_sat=(dateString_sat.substring(0, 13)).split(":")[0];
					
					if(initDate_hour.equals(dateString_hour_sat)){
						sqrtValue=initValue+value;
						newDate=dateString_sat;
						d++;
						flag=false;
						sqrtValue += value;
						d++;
						initDateOfhour=satDate;
					}else if ("".equals(newDate)&&flag==true){
						sqrtValue=value;
						newDate=dateString_sat;
						d++;
					}else if(newDate.equals(dateString_hour_sat)){
						sqrtValue += value;
						d++;
						initDateOfhour=satDate;
					}else{
						
	
						double dayValue = sqrtValue / d;
						TJRX tsa=null;
//								new TSaturation(initDateOfhour, new BigDecimal(dayValue).setScale(3, BigDecimal.ROUND_HALF_UP));
						commonDao.save(tsa);
						initDateOfhour = satDate;
						newDate = dateString_hour_sat;
						sqrtValue = value;
						d = 1;
						flag=true;
					}
				}
			}
		 }
	}
	
}
