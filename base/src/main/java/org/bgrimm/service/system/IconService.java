package org.bgrimm.service.system;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.domain.system.TIcon;
import org.bgrimm.domain.system.TIconType;
import org.hibernate.criterion.Order;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("iconService")
@Transactional
public class IconService {
	@Autowired
	private CommonDao commonDao;

	public Object getPagedList(int page, int rows) {
		PagedQuery pq = new PagedQuery(TIcon.class, page, rows);
		List<Order> list = new ArrayList();
		list.add(Order.asc("iconName"));
		PageList pl = commonDao.getPagedList(pq, list);
		return pl;
	}

	public Object typedIcons(String type) {
		TIconType t = commonDao.findUniqueByProperty(TIconType.class, "name",
				type.toUpperCase());
		return commonDao.findByProperty(TIcon.class, "type.id", t.getId());
	}

	public String upload(HttpServletRequest req, HttpServletResponse resp) {
		String newfileName = generateName();
		String postFix = "";
		String savedPath = req.getSession().getServletContext()
				.getRealPath("/")
				+ "/resources/custom/images/";
		DiskFileItemFactory fac = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setHeaderEncoding("UTF-8");
		try {
			req.setCharacterEncoding("UTF-8");
			List fileList = upload.parseRequest(req);
			for (Object obj : fileList) {
				if (obj instanceof DiskFileItem) {
					DiskFileItem item = (DiskFileItem) obj;
					String fileName = item.getName();
					if (fileName == null)
						continue;
					postFix = StringUtils.substringAfterLast(fileName, ".");
					BufferedInputStream in = new BufferedInputStream(
							item.getInputStream());// 获得文件输入流
					BufferedOutputStream outStream = new BufferedOutputStream(
							new FileOutputStream(new File(savedPath
									+ newfileName + "." + postFix)));// 获得文件输出流
					Streams.copy(in, outStream, true);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}

		return newfileName + "." + postFix;

	}

	private String generateName() {
		return System.currentTimeMillis() + "";
	}

	public Object iconTypes() {
		return commonDao.loadAll(TIconType.class);
	}

	public Object isValidName(String iconName, String id) {
		if (StringUtils.isNumeric(id)) {
			TIcon icon = commonDao.findUniqueByProperty(TIcon.class, "id",
					Long.parseLong(id));
			if (icon.getIconName().equals(iconName)) {
				return true;
			}
		}
		TIcon icon = commonDao.findUniqueByProperty(TIcon.class, "iconName",
				iconName);
		if (icon == null) {
			return true;
		}
		return false;
	}

	public void saveOrUpdate(TIcon icon) {
		TIcon ico = null;
		if (icon.getId() == 0) {
			String cssName = "custom" + System.currentTimeMillis();
			icon.setIconCls(cssName);
			ico = icon;
		} else {
			ico = commonDao.findUniqueBy(TIcon.class, "id", icon.getId());
			// icon cls not passed from request
			icon.setIconCls(ico.getIconCls());
			BeanUtils.copyProperties(icon, ico);
		}
		commonDao.saveOrUpdate(ico);
	}

	public void remove(long id) {
		commonDao.deleteEntityById(TIcon.class, id);
	}

	public void generateIconClass(HttpServletRequest req)
			throws FileNotFoundException {
		// TODO remove unused icon
		List<TIcon> iconList = commonDao.loadAll(TIcon.class);
		String path = req.getSession().getServletContext().getRealPath("/")
				+ "/resources/custom/css/icon.css";
		PrintWriter pw = null;
		try {
			pw = new PrintWriter(path);
			for (TIcon icon : iconList) {
				String css = "." + icon.getIconCls();
				String iconName = StringUtils.substringAfterLast(
						icon.getIconPath(), "/");
				css += "{background:url('../images/" + iconName + "');";
				css += "background-size:16px 16px;";
				css += "background-repeat:no-repeat;}";
				pw.write(css);
				pw.write("\n");
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (pw != null)
				pw.close();
		}

	}

	public TIcon getIcon(long id) {
		return commonDao.findUniqueBy(TIcon.class, "id", id);
	}
}
