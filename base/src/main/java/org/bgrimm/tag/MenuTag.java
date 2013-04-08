package org.bgrimm.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.bgrimm.domain.core.TMenu;

public class MenuTag extends TagSupport {
	private static final long serialVersionUID = 5235848893919233497L;
	private List<TMenu> parentMenus;
	private List<TMenu> childMenus;

	public List<TMenu> getParentMenus() {
		return parentMenus;
	}

	public void setParentMenus(List<TMenu> parentMenus) {
		this.parentMenus = parentMenus;
	}

	public List<TMenu> getChildMenus() {
		return childMenus;
	}

	public void setChildMenus(List<TMenu> childMenus) {
		this.childMenus = childMenus;
	}

	@Override
	public int doStartTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public int doEndTag() throws JspException {
		System.out.println("doEndTag......");
		try {
			JspWriter out = this.pageContext.getOut();
			out.print(end().toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	public StringBuffer end() {
		StringBuffer sb = new StringBuffer();
		sb.append("<div id=\"nav\" class=\"easyui-accordion\" fit=\"true\" border=\"false\">");
sb.append(createMenus());
		sb.append("</div>");
		return sb;
	}

	public String createMenus() {
		StringBuffer menuString = new StringBuffer();
		for (TMenu pMenu : parentMenus) {
			menuString.append("<div  title=\"" + pMenu.getMenuName()
					+ "\" iconCls=\"" + pMenu.getIcon().getIconCls() + "\">");
			int submenusize = pMenu.getSubMenus().size();
			if (submenusize == 0) {
				menuString.append("</div>");
			}
			if (submenusize > 0) {
				menuString.append("<ul>");
			}
			for (TMenu sMenu : childMenus) {

				if (sMenu.getParentMenu().getId() == pMenu.getId()) {
					String icon = "folder";
					if (sMenu.getIcon() != null) {
						icon = sMenu.getIcon().getIconCls();
					}
					// menuString.append("<li><div> <a class=\""+function.getFunctionName()+"\" iconCls=\""+icon+"\" target=\"tabiframe\"  href=\""+function.getFunctionUrl()+"\"> <span class=\"icon "+icon+"\" >&nbsp;</span> <span class=\"nav\">"+function.getFunctionName()+"</span></a></div></li>");
					menuString.append("<li><div onclick=\"addTab(\'"
							+ sMenu.getMenuName() + "\',\'" + sMenu.getUrl()
							+ "\',\'" + icon + "\')\"  title=\""
							+ sMenu.getMenuName() + "\" url=\""
							+ sMenu.getUrl() + "\" iconCls=\"" + icon
							+ "\"> <a class=\"" + sMenu.getMenuName()
							+ "\" href=\"#\" > <span class=\"icon " + icon
							+ "\" >&nbsp;</span> <span class=\"nav\" >"
							+ sMenu.getMenuName() + "</span></a></div></li>");
				}
			}
			if (submenusize > 0) {
				menuString.append("</ul></div>");
			}
		}
		return menuString.toString();
	}
}
