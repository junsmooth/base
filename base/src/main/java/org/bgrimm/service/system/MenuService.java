package org.bgrimm.service.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.common.TDrawingPosition;
import org.bgrimm.domain.bgrimm.common.TTopo;
import org.bgrimm.domain.system.TIcon;
import org.bgrimm.domain.system.TMenu;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service("menuService")
@Transactional
public class MenuService {
//
//	@Autowired
//	private MenuDao menuDao;
	@Autowired
	private CommonDao commonDao;
	private List<String> getCurrentAuthorities() {
		UserDetails userDetails = (UserDetails) SecurityContextHolder
				.getContext().getAuthentication().getPrincipal();
		Object[] bojs = userDetails.getAuthorities().toArray();
		List<String> list = new ArrayList<String>();
		for (Object obj : bojs) {
			list.add(obj.toString());
		}
		return list;
	}

	public void removeEntity(long id	){
		commonDao.deleteEntityById(TMenu.class, id);
	}
	public List<TMenu> getParentMenus() {
		return commonDao.findByCriterions(TMenu.class,
				Restrictions.eq("parentMenu.id", 1L));
	}
	public TMenu getRootMenu() {
		return commonDao.findUniqueByProperty(TMenu.class, "id", 1L);
	}
	public List<TMenu> getAllMenus(){
		return commonDao.loadAll(TMenu.class);
	}
	
	public List<TIcon> getAllIcon() {
		return commonDao.loadAll(TIcon.class);
	}

	public TMenu getUniqueById(long pid) {
		return commonDao.findUniqueByProperty(TMenu.class, "id", pid);
	}

	public void saveOrUpdate(TMenu menu) {
		commonDao.saveOrUpdate(menu);
	}

	public Object isValidModuleName(String menumodulename,String id) {
		
		if(StringUtils.isNumeric(id)){
			TMenu m1=commonDao.findUniqueByProperty(TMenu.class, "id", Long.parseLong(id));
			if(m1.getModuleName().equals(menumodulename)){
				return true;
			}
		}
		TMenu menu=commonDao.findUniqueByProperty(TMenu.class, "moduleName", menumodulename);
		if(menu==null){
			return true;
		}
		return false;
	}

	public Object isValidMenuName(String menuName, String id) {
		if(StringUtils.isNumeric(id)){
			TMenu m1=commonDao.findUniqueByProperty(TMenu.class, "id", Long.parseLong(id));
			if(m1.getMenuName().equals(menuName)){
				return true;
			}
		}
		TMenu menu=commonDao.findUniqueByProperty(TMenu.class, "menuName", menuName);
		if(menu==null){
			return true;
		}
		return false;
	}

	public List getMonitorPDataList() {

		return commonDao.findByCriterions(MonitoringType.class, Restrictions.eq("enabled", true));
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
	

}
