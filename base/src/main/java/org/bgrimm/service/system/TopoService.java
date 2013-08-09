package org.bgrimm.service.system;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
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
import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.bgrimm.T4DDBDao;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.common.AlarmRecord;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.common.TDrawingPosition;
import org.bgrimm.domain.bgrimm.common.TTopo;
import org.bgrimm.domain.t4ddb.BMWY;
import org.bgrimm.utils.Constants;
import org.bgrimm.utils.DataUtils;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
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
				Map  mp=(Map)me.getValue();
				Set<Map.Entry> s=mp.entrySet();
				String st="";
				String mopo="";
				long dpId=0;
				MonitoringPoint monitoringPoint=new MonitoringPoint();
				for(Map.Entry m:s){
					if("x".equals(m.getKey())){
						tdp.setX((Integer)m.getValue());
					}else if("y".equals(m.getKey())){
						tdp.setY((Integer)m.getValue());
					}
					if("sId".equals(m.getKey())){
						String str=(String)m.getValue();
						monitoringPoint=commonDao.findUniqueBy(MonitoringPoint.class, "id", Long.parseLong(str));
						tdp=monitoringPoint.getDrawPosition();
						if(tdp==null){
							tdp=new TDrawingPosition();
						}
					}
				}
				commonDao.saveOrUpdate(tdp);
				monitoringPoint.setDrawPosition(tdp);
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
		Order order=Order.asc("position");
		Criteria criteria=commonDao.getSession().createCriteria(MonitoringPoint.class);
		criteria.add(Restrictions.eq("type.id", t.getId()));
		criteria.add(Restrictions.isNull("drawPosition.id"));
		criteria.addOrder(order);
//		 List<MonitoringPoint> point = commonDao.findByCriterions(
//				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()),Restrictions.isNull("drawPosition.id"));
	
		return criteria.list();
	}

	public List getMPPath(long v,int m) {
		
		List li=commonDao.findByCriterions(MonitoringType.class, Restrictions.eq("id", v));
		List l=new ArrayList();
		l.add(Restrictions.eq("type.id", v));
		l.add(Restrictions.eq("position", m));
		List list=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", v),Restrictions.eq("position", m));
		if(li.size()>0){
			li.add(m);
			if(list.size()>0){
				
				li.add(list.get(0));
			}
		}
		return li;
	}


	public List getMainData() {
		List alarmRecordDataList=getAlarmRecordDataList();
		List allDataList= getAllDataList();
		allDataList.add(alarmRecordDataList);
		 return allDataList;
	}

	private List getAllDataList() {
		List<MonitoringPoint> mpDataList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.isNotNull("drawPosition.id"));
		for(MonitoringPoint mp:mpDataList){
			if(Constants.JCD_BMWY.equals(mp.getType().getCode())){
				setBMWYData(mp);
			}else{
				setData(mp);
			}
		}
		return mpDataList;
	}


	private void setData(MonitoringPoint mp) {

		try {
			String clsName=mp.getType().getDomainClsName();
			if(StringUtils.isNotEmpty(clsName)){
				Criteria criteria=commonDao.getSession().createCriteria(Class.forName(clsName));
				criteria.setMaxResults(1);
				criteria.add(Restrictions.eq("monitoringPosition", mp.getPosition()));
				criteria.addOrder(Order.desc("dateTime"));
				List list=criteria.list();
				if(list.size()>0){
					//DataUtils.setDecimalDigits(list,null);
					mp.setMpValue(list.get(0));
				}
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}


	private void setBMWYData(final MonitoringPoint mp) {

		List<BMWY> bmwyList=template.execute(new TransactionCallback<List<BMWY>>() {
			public List<BMWY> doInTransaction(TransactionStatus status) {

				Criteria criteria=t4ddbDao.getSession().createCriteria(BMWY.class);
				criteria.setMaxResults(1);
				criteria.add(Restrictions.eq("monitoringPosition", mp.getPosition()));
				criteria.addOrder(Order.desc("dateTime"));
				List list= criteria.list();
				if(list.size()>0){
					//DataUtils.setDecimalDigits(list,Constants.JCD_BMWY);
					mp.setMpValue(list.get(0));
				}
				return null;
			}
		});
			
	}


	private List getAlarmRecordDataList() {
		return commonDao.loadAll(AlarmRecord.class);
	}


	public void deletePic(Long imgId) {

		MonitoringPoint mPoint=commonDao.findUniqueBy(MonitoringPoint.class, "id", imgId);
		long id=mPoint.getDrawPosition().getId();
		mPoint.setDrawPosition(null);
		commonDao.save(mPoint);
		commonDao.deleteEntityById(TDrawingPosition.class, id);
	}
	


}
