package org.bgrimm.service.system;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.bgrimm.dao.bgrimm.T4DDBDao;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.common.AlarmRecord;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.common.TDrawingPosition;
import org.bgrimm.domain.bgrimm.common.TTopo;
import org.bgrimm.domain.bgrimm.monitor.extended.AQCG;
import org.bgrimm.domain.bgrimm.monitor.extended.BDGC;
import org.bgrimm.domain.bgrimm.monitor.provided.GTCD;
import org.bgrimm.domain.bgrimm.monitor.provided.GTGC;
import org.bgrimm.domain.bgrimm.monitor.provided.JRX;
import org.bgrimm.domain.bgrimm.monitor.provided.JYL;
import org.bgrimm.domain.bgrimm.monitor.provided.KSW;
import org.bgrimm.domain.bgrimm.monitor.provided.NBWY;
import org.bgrimm.domain.bgrimm.monitor.provided.SLL;
import org.bgrimm.domain.t4ddb.BMWY;
import org.bgrimm.utils.Constants;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

@Service("topoService")
@Transactional
public class TopoService {
	
	@Autowired
	private TransactionTemplate template;
	
	@Autowired
	private CommonDao commonDao;
	
	@Autowired
	private T4DDBDao t4ddbDao;

	public String uploadFile(HttpServletRequest req, HttpServletResponse resp) {


		  try {
			   req.setCharacterEncoding("UTF-8");
			  } catch (Exception e1) {
			   e1.printStackTrace();
			  }   
  
			        String newfileName ="main"; //sdfFileName.format(date);//文件名称    
			        String fileRealPath = "";//文件存放真实地址    
			           
			        String fileRealResistPath = "";//文件存放真实相对路径    
			           
			        //名称  界面编码 必须 和request 保存一致..否则乱码    
			        String name = req.getParameter("name");   
			          if(name == null || name.isEmpty()) 
			          {
			           name =req.getParameter("fileName");
			          }
			            
			        String firstFileName="";   
			        // 获得容器中上传文件夹所在的物理路径    
			        String savePath=req.getSession().getServletContext().getRealPath("/")+"/resources/custom/images\\";
			        System.out.println("路径" + savePath+"; name:"+name);   
			        File file = new File(savePath);   
			        if (!file.isDirectory()) {   
			            file.mkdirs();   
			        }   
			        try {   
			            DiskFileItemFactory fac = new DiskFileItemFactory(); 
			            //设置当内容大于内存缓冲区的域值时，设置文件的存储位置。
			            ServletFileUpload upload = new ServletFileUpload(fac);
			            upload.setHeaderEncoding("UTF-8");   
			            // 获取多个上传文件    
			            List fileList = upload.parseRequest(req);   
			            // 遍历上传文件写入磁盘    
			            Iterator it = fileList.iterator();   
			            while (it.hasNext()) {   
			                Object obit = it.next(); 
			                if(obit instanceof DiskFileItem){ 
			                    DiskFileItem item = (DiskFileItem) obit;   
			                       
			                    // 如果item是文件上传表单域       
			                    // 获得文件名及路径       
			                    String fileName = item.getName();   
			                    if (fileName != null) {   
			                       firstFileName=item.getName().substring(item.getName().lastIndexOf("/")+1);   
			                        String formatName = firstFileName.substring(firstFileName.lastIndexOf("."));//获取文件后缀名    
			                        fileRealPath = savePath + newfileName+ formatName;//文件存放真实地址    
			                           
			                        BufferedInputStream in = new BufferedInputStream(item.getInputStream());// 获得文件输入流    
			                        BufferedOutputStream outStream = new BufferedOutputStream(new FileOutputStream(new File(fileRealPath)));// 获得文件输出流    
			                        Streams.copy(in, outStream, true);// 开始把文件写到你指定的上传文件夹    
			                            
			                    }    
			                } 
			            }    
			        } catch (org.apache.commons.fileupload.FileUploadException ex) { 
			          ex.printStackTrace();   
			           System.out.println("没有上传文件");   
			        } catch (IOException e) {
			   e.printStackTrace();
			  } 
			        return null;
	}
	
	
	@Transactional(isolation=Isolation.DEFAULT,readOnly=false)
	public void saveData(Object jsonData) {
		Map map=(Map)jsonData;
		Set<Map.Entry> set=map.entrySet();
		int count=1;
		for(Map.Entry me: set){
			count++;
			if(map.size()-count>=0){
				TDrawingPosition tdp=null;
				Object o1=me.getKey();
				Map  mp=(Map)me.getValue();
				Set<Map.Entry> s=mp.entrySet();
				String st="";
				String mopo="";
				long dpId=0;
				for(Map.Entry m:s){
					if("x".equals(m.getKey())){
						tdp.setX((Integer)m.getValue());
					}else if("y".equals(m.getKey())){
						tdp.setY((Integer)m.getValue());
					}
					if("sId".equals(m.getKey())){
						String str=(String)m.getValue();
						String [] string=str.split("_");
						int len=string.length;
						if(len!=0&&len==3){
							dpId=Long.parseLong(string[1]);
							tdp=commonDao.findUniqueBy(TDrawingPosition.class, "id", dpId);
							mopo=str.split("_")[2];
						}else{
							if(tdp==null){
								tdp=new TDrawingPosition();
							}
							mopo=str.split("_")[1];
						}
						 st=string[0];
					}
				}
				MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",st);
				List<Criterion> l=new ArrayList();
				l.add(Restrictions.eq("type.id",t.getId()));
				l.add(Restrictions.eq("position", Integer.parseInt(mopo)));
				List<MonitoringPoint> li=commonDao.findByCriterions(MonitoringPoint.class, l);
				commonDao.saveOrUpdate(tdp);
				if(li.size()>0){
					li.get(0).setDrawPosition(tdp);
				}
			}else{
					Map  mp=(Map)me.getValue();
					Set<Map.Entry> s=mp.entrySet();
					TTopo tTopo=null;
					List lis=commonDao.loadAll(TTopo.class);
					if(lis.size()>0){
						tTopo=(TTopo)lis.get(0);
					}
					if(tTopo==null){
						tTopo=new TTopo();
					}
					for(Map.Entry m:s){
						if("w".equals(m.getKey())){
							String str=(String)m.getValue();
							float f=Float.parseFloat(str.split("px")[0]);
							tTopo.setSizeW(f);
						}
						if("h".equals(m.getKey())){
							String str=(String)m.getValue();
							float fl=Float.parseFloat(str.split("px")[0]);
							tTopo.setSizeH(fl);
						}
						if("lef".equals(m.getKey())){
//							float lefF=new BigDecimal((BigInteger)m.getValue()).floatValue();
							float lefF=((Number)m.getValue()).floatValue();
							tTopo.setPosX(lefF);
						}
						if("top".equals(m.getKey())){
							float topF=((Number)m.getValue()).floatValue();
							tTopo.setPosY(topF);
						}
						tTopo.setImageName("main.png");
						
					}
					commonDao.saveOrUpdate(tTopo);
				
			}
		}
	}

	public Map getMpPic() {

		Map map=new HashMap();
		List list= commonDao.findByCriterions(MonitoringPoint.class, Restrictions.isNotNull("drawPosition.id"));					
		List tTopoList=commonDao.loadAll(TTopo.class);
		map.put("mpList", list);
		map.put("tTopo", tTopoList);
		return map;
	}
	
	public List getMonitorPDataList() {

		return commonDao.findByCriterions(MonitoringType.class);
	}

	public List getIconList(String code) {
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				code);
		final List<MonitoringPoint> point = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
	
		return point;
	}

	public List getMPPath(long v,int m) {
		
		List li=commonDao.findByCriterions(MonitoringType.class, Restrictions.eq("id", v));
		List l=new ArrayList();
		l.add(Restrictions.eq("type.id", v));
		l.add(Restrictions.eq("position", m));
		List list=commonDao.findByCriterions(MonitoringPoint.class, l);
		if(li.size()>0){
			li.add(m);
			if(list.size()>0){
				
				li.add(list.get(0));
			}
		}
		return li;
	}


	public Map getMainData() {
		Map m=new HashMap();
		
		//BMWY list
		List bmwyDataList=getBMWYDataList();
		
		//JRX List
		List jrxDataList=getJRXDataList();
		
		//GTGC List
		List gtgcDataList=getGTGCDataList();
		
		//GTCD List
		List gtcdDataList=getGTCDDataList();
		
		//KSW List
		List kswDataList=getKSWDataList();
		
		//JYL List
		List jylDataList=getJYLDataList();
		
		//AQCG List
		List aqcgDataList=getAQCGDataList();
		
		//BDGC List
		List bdgcDataList=getBDGCDataList();
		
		//SLL List
		List sllDataList=getSLLDataList();
		
		//NBWY List
		List nbwyDataList=getNBWYDataList();
		
		//alarmRecord List
		List alarmRecordDataList=getAlarmRecordDataList();
		
		m.put(Constants.JCD_BMWY,bmwyDataList);
		m.put(Constants.JCD_JRX, jrxDataList);
		m.put(Constants.JCD_GTGC,gtgcDataList);
		m.put(Constants.JCD_GTCD, gtcdDataList);
		m.put(Constants.JCD_KSW, kswDataList);
		m.put(Constants.JCD_JYL, jylDataList);
		m.put(Constants.JCD_AQCG, aqcgDataList);
		m.put(Constants.JCD_BDGC, bdgcDataList);
		m.put(Constants.JCD_SLL, sllDataList);
		m.put(Constants.JCD_NBWY, nbwyDataList);
		m.put("ALARM", alarmRecordDataList);
		return m;
	}

	private List getAlarmRecordDataList() {
		return commonDao.loadAll(AlarmRecord.class);
	}


	private List getBMWYDataList(){
		//BMWY List
		 MonitoringType monitoringType=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_BMWY);
		final List<MonitoringPoint> dataList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.isNotNull("drawPosition.id"),
																	Restrictions.eq("type.id", monitoringType.getId()));
		final Integer [] posArr=new Integer [dataList.size()+1];
		if(dataList.size()>0){
			int i=0;
			for(MonitoringPoint mp: dataList){
				int pos=mp.getPosition();
				posArr[i++]=pos;
			}
		}else{
			posArr[0]=null;
		}
		List<BMWY> bmwyList=template.execute(new TransactionCallback() {
			public Object doInTransaction(TransactionStatus status) {

				Criteria criteria=t4ddbDao.getSession().createCriteria(BMWY.class);
				criteria.setMaxResults(dataList.size());
				criteria.add(Restrictions.in("monitoringPosition", posArr));
				criteria.addOrder(Order.desc("dateTime"));
				return criteria.list();
			}
		});
		if(bmwyList.size()>0){
			for(MonitoringPoint mp: dataList){
				for(BMWY bmwy: bmwyList){
					if(mp.getPosition()==bmwy.getMonitoringPosition()){
						List ll=new ArrayList();
						Map map=new HashMap();
						map.put("de", bmwy.getdE());
						map.put("dh", bmwy.getdH());
						map.put("dn", bmwy.getdN());
						map.put("mpName", Constants.JCD_BMWY);
						ll.add(map);
						mp.setLatestValue(ll);
					}
				}
			}
		}
		return dataList;
	}
	
	
	private List getJRXDataList(){
		//JRX List
		 MonitoringType monitoringType=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_JRX);
		List<MonitoringPoint> dataList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.isNotNull("drawPosition.id"),
																	Restrictions.eq("type.id", monitoringType.getId()));
		 Integer [] posArr=new Integer [dataList.size()];
		if(dataList.size()>0){
			int i=0;
			for(MonitoringPoint mp: dataList){
				int pos=mp.getPosition();
				posArr[i++]=pos;
			}
		}else{
			posArr=new Integer[]{null};
		}
		
		Criteria jrxCriteria=commonDao.getSession().createCriteria(JRX.class);
		jrxCriteria.setMaxResults(posArr.length);
		jrxCriteria.add(Restrictions.in("monitoringPosition", posArr));
		jrxCriteria.addOrder(Order.desc("dateTime"));
		List<JRX> jrxList=jrxCriteria.list();
		if(jrxList.size()>0){
			for(MonitoringPoint mp: dataList){
				for(JRX jrx: jrxList){
					if(mp.getPosition()==jrx.getMonitoringPosition()){
						List ll=new ArrayList();
						Map map=new HashMap();
						map.put("value", jrx.getValue());
						map.put("mpName", Constants.JCD_JRX);
						ll.add(map);
						mp.setLatestValue(ll);
					}
				}
			}
		}
		return dataList;
	}
	
	private List getGTGCDataList(){
		List<MonitoringPoint> dataList=getDataList(Constants.JCD_GTGC);
		Integer [] posArr=new Integer [dataList.size()];
		if(dataList.size()>0){
			int i=0;
			for(MonitoringPoint mp: dataList){
				int pos=mp.getPosition();
				posArr[i++]=pos;
			}
		}else{
			posArr=new Integer[]{null};
		}
		Criteria gtgcCriteria=commonDao.getSession().createCriteria(GTGC.class);
		gtgcCriteria.setMaxResults(posArr.length);
		gtgcCriteria.add(Restrictions.in("monitoringPosition", posArr));
		gtgcCriteria.addOrder(Order.desc("dateTime"));
		List<GTGC> gtgcList=gtgcCriteria.list();
		if(gtgcList.size()>0){
			for(MonitoringPoint mp: dataList){
				for(GTGC gtgc: gtgcList){
					if(mp.getPosition()==gtgc.getMonitoringPosition()){
						List ll=new ArrayList();
						Map map=new HashMap();
						map.put("value", gtgc.getValue());
						map.put("mpName", Constants.JCD_GTGC);
						ll.add(map);
						mp.setLatestValue(ll);
					}
				}
			}
		}
		return dataList;
	}


	private List<MonitoringPoint> getDataList(String str) {
		 MonitoringType monitoringType=commonDao.findUniqueBy(MonitoringType.class, "code",str);
			
		  return commonDao.findByCriterions(MonitoringPoint.class, Restrictions.isNotNull("drawPosition.id"),
																		Restrictions.eq("type.id", monitoringType.getId()));
	}
	
	private List getGTCDDataList(){
		List<MonitoringPoint> dataList=getDataList(Constants.JCD_GTCD);
		Integer [] posArr=new Integer [dataList.size()];
		if(dataList.size()>0){
			int i=0;
			for(MonitoringPoint mp: dataList){
				int pos=mp.getPosition();
				posArr[i++]=pos;
			}
		}else{
			posArr=new Integer[]{null};
		}
		
		Criteria gtcdCriteria=commonDao.getSession().createCriteria(GTCD.class);
		gtcdCriteria.setMaxResults(posArr.length);
		gtcdCriteria.add(Restrictions.in("monitoringPosition", posArr));
		gtcdCriteria.addOrder(Order.desc("dateTime"));
		List<GTCD> gtcdList=gtcdCriteria.list();
		if(gtcdList.size()>0){
			for(MonitoringPoint mp: dataList){
				for(GTCD gtcd: gtcdList){
					if(mp.getPosition()==gtcd.getMonitoringPosition()){
						List ll=new ArrayList();
						Map map=new HashMap();
						map.put("value", gtcd.getValue());
						map.put("mpName", Constants.JCD_GTCD);
						ll.add(map);
						mp.setLatestValue(ll);
					}
				}
			}
		}
		return dataList;
	}
	
	
	private List getKSWDataList(){
		List<MonitoringPoint> dataList=getDataList(Constants.JCD_KSW);
		Integer [] posArr=new Integer [dataList.size()];
		if(dataList.size()>0){
			int i=0;
			for(MonitoringPoint mp: dataList){
				int pos=mp.getPosition();
				posArr[i++]=pos;
			}
		}else{
			posArr=new Integer[]{null};
		}
		
		Criteria kswCriteria=commonDao.getSession().createCriteria(KSW.class);
		kswCriteria.setMaxResults(posArr.length);
		kswCriteria.add(Restrictions.in("monitoringPosition", posArr));
		kswCriteria.addOrder(Order.desc("dateTime"));
		List<KSW> kswList=kswCriteria.list();
		if(kswList.size()>0){
			for(MonitoringPoint mp: dataList){
				for(KSW ksw: kswList){
					if(mp.getPosition()==ksw.getMonitoringPosition()){
						List ll=new ArrayList();
						Map map=new HashMap();
						map.put("value", ksw.getValue());
						map.put("mpName", Constants.JCD_KSW);
						ll.add(map);
						mp.setLatestValue(ll);
					}
				}
			}
		}
		return dataList;
	}
	
	private List getJYLDataList(){
		List<MonitoringPoint> dataList=getDataList(Constants.JCD_JYL);
		Integer [] posArr=new Integer [dataList.size()];
		if(dataList.size()>0){
			int i=0;
			for(MonitoringPoint mp: dataList){
				int pos=mp.getPosition();
				posArr[i++]=pos;
			}
		}else{
			posArr=new Integer[]{null};
		}
		
		Criteria jylCriteria=commonDao.getSession().createCriteria(JYL.class);
		jylCriteria.setMaxResults(posArr.length);
		jylCriteria.add(Restrictions.in("monitoringPosition", posArr));
		jylCriteria.addOrder(Order.desc("dateTime"));
		List<JYL> jylList=jylCriteria.list();
		if(jylList.size()>0){
			for(MonitoringPoint mp: dataList){
				for(JYL jyl: jylList){
					if(mp.getPosition()==jyl.getMonitoringPosition()){
						List ll=new ArrayList();
						Map map=new HashMap();
						map.put("value", jyl.getValue());
						map.put("mpName", Constants.JCD_JYL);
						ll.add(map);
						mp.setLatestValue(ll);
					}
				}
			}
		}
		return dataList;
	}
	
	private List getAQCGDataList(){
		List<MonitoringPoint> dataList=getDataList(Constants.JCD_AQCG);
		Integer [] posArr=new Integer [dataList.size()];
		if(dataList.size()>0){
			int i=0;
			for(MonitoringPoint mp: dataList){
				int pos=mp.getPosition();
				posArr[i++]=pos;
			}
		}else{
			posArr=new Integer[]{null};
		}
		
		Criteria aqcgCriteria=commonDao.getSession().createCriteria(AQCG.class);
		aqcgCriteria.setMaxResults(posArr.length);
		aqcgCriteria.add(Restrictions.in("monitoringPosition", posArr));
		aqcgCriteria.addOrder(Order.desc("dateTime"));
		List<AQCG> aqcgList=aqcgCriteria.list();
		if(aqcgList.size()>0){
			for(MonitoringPoint mp: dataList){
				for(AQCG aqcg: aqcgList){
					if(mp.getPosition()==aqcg.getMonitoringPosition()){
						List ll=new ArrayList();
						Map map=new HashMap();
						map.put("value", aqcg.getValue());
						map.put("mpName", Constants.JCD_AQCG);
						ll.add(map);
						mp.setLatestValue(ll);
					}
				}
			}
		}
		return dataList;
	}
	
	

	
	private List getBDGCDataList(){
		List<MonitoringPoint> dataList=getDataList(Constants.JCD_BDGC);
		Integer [] posArr=new Integer [dataList.size()];
		if(dataList.size()>0){
			int i=0;
			for(MonitoringPoint mp: dataList){
				int pos=mp.getPosition();
				posArr[i++]=pos;
			}
		}else{
			posArr=new Integer[]{null};
		}
		
		Criteria bdgcCriteria=commonDao.getSession().createCriteria(BDGC.class);
		bdgcCriteria.setMaxResults(posArr.length);
		bdgcCriteria.add(Restrictions.in("monitoringPosition", posArr));
		bdgcCriteria.addOrder(Order.desc("dateTime"));
		List<BDGC> bdgcList=bdgcCriteria.list();
		if(bdgcList.size()>0){
			for(MonitoringPoint mp: dataList){
				for(BDGC bdgc: bdgcList){
					if(mp.getPosition()==bdgc.getMonitoringPosition()){
						List ll=new ArrayList();
						Map map=new HashMap();
						map.put("value", bdgc.getValue());
						map.put("mpName", Constants.JCD_BDGC);
						ll.add(map);
						mp.setLatestValue(ll);
					}
				}
			}
		}
		return dataList;
	}
	
	
	private List getSLLDataList(){
		List<MonitoringPoint> dataList=getDataList(Constants.JCD_SLL);
		Integer [] posArr=new Integer [dataList.size()];
		if(dataList.size()>0){
			int i=0;
			for(MonitoringPoint mp: dataList){
				int pos=mp.getPosition();
				posArr[i++]=pos;
			}
		}else{
			posArr=new Integer[]{null};
		}
		
		Criteria sllCriteria=commonDao.getSession().createCriteria(SLL.class);
		sllCriteria.setMaxResults(posArr.length);
		sllCriteria.add(Restrictions.in("monitoringPosition", posArr));
		sllCriteria.addOrder(Order.desc("dateTime"));
		List<SLL> sllList=sllCriteria.list();
		if(sllList.size()>0){
			for(MonitoringPoint mp: dataList){
				for(SLL sll: sllList){
					if(mp.getPosition()==sll.getMonitoringPosition()){
						List ll=new ArrayList();
						Map map=new HashMap();
						map.put("value", sll.getValue());
						map.put("mpName", Constants.JCD_BDGC);
						ll.add(map);
						mp.setLatestValue(ll);
					}
				}
			}
		}
		return dataList;
	}
	
	
	private List getNBWYDataList(){
		List<MonitoringPoint> dataList=getDataList(Constants.JCD_NBWY);
		Integer [] posArr=new Integer [dataList.size()];
		if(dataList.size()>0){
			int i=0;
			for(MonitoringPoint mp: dataList){
				int pos=mp.getPosition();
				posArr[i++]=pos;
			}
		}else{
			posArr=new Integer[]{null};
		}
		
		Criteria nbwyCriteria=commonDao.getSession().createCriteria(NBWY.class);
		nbwyCriteria.setMaxResults(posArr.length);
		nbwyCriteria.add(Restrictions.in("monitoringPosition", posArr));
		nbwyCriteria.addOrder(Order.desc("dateTime"));
		List<NBWY> nbwyList=nbwyCriteria.list();
		if(nbwyList.size()>0){
			for(MonitoringPoint mp: dataList){
				for(NBWY nbwy: nbwyList){
					if(mp.getPosition()==nbwy.getMonitoringPosition()){
						List ll=new ArrayList();
						Map map=new HashMap();
						map.put("value", nbwy.getValue());
						map.put("mpName", Constants.JCD_NBWY);
						ll.add(map);
						mp.setLatestValue(ll);
					}
				}
			}
		}
		return dataList;
	}
//	private List getList(List<MonitoringPoint> dataList,Class entity,String str){
//		Integer [] posArr=new Integer [dataList.size()];
//		if(dataList.size()>0){
//			int i=0;
//			for(MonitoringPoint mp: dataList){
//				int pos=mp.getPosition();
//				posArr[i++]=pos;
//			}
//		}
//		
//		Criteria jrxCriteria=commonDao.getSession().createCriteria(entity);
//		jrxCriteria.setMaxResults(posArr.length);
//		jrxCriteria.add(Restrictions.in("monitoringPosition", posArr));
//		jrxCriteria.addOrder(Order.desc("dateTime"));
//		List<JRX> jrxList=jrxCriteria.list();
//		if(jrxList.size()>0){
//			for(MonitoringPoint mp: dataList){
//				for(JRX jrx: jrxList){
//					if(mp.getPosition()==jrx.getMonitoringPosition()){
//						List ll=new ArrayList();
//						Map map=new HashMap();
//						map.put("value", jrx.getValue());
//						map.put("idName", Constants.JCD_JRX);
//						ll.add(map);
//						mp.setLatestValue(ll);
//					}
//				}
//			}
//		}
//		return null;
//	}
	
}
