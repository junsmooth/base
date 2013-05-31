package org.bgrimm.tag;

import org.apache.log4j.Logger;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.bgrimm.domain.system.TMenu;
import org.bgrimm.utils.Constants;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

public class MenuTag extends TagSupport {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MenuTag.class);

	private static final long serialVersionUID = 5235848893919233497L;
	private List<TMenu> parentMenus;

	public List<TMenu> getParentMenus() {
		return parentMenus;
	}

	public void setParentMenus(List<TMenu> parentMenus) {
		this.parentMenus = parentMenus;
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
		Object principal = SecurityContextHolder.getContext()
				.getAuthentication();
		if (principal != null
				&& principal instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) principal;
			Collection<GrantedAuthority> auths=token.getAuthorities();
			for (TMenu pMenu : parentMenus) {
				String title = pMenu.getMenuName();
				
				if(!hasAuth(pMenu,auths)){
					continue;
				}
				String iconCls = pMenu.getIcon() == null ? "folder" : pMenu
						.getIcon().getIconCls();

				menuString.append("<div  title=\"" + title + "\" iconCls=\""
						+ iconCls + "\">");
				int submenusize = pMenu.getSubMenus().size();
				if (submenusize == 0) {
					menuString.append("</div>");
				}
				if (submenusize > 0) {
					menuString.append("<ul>");
				}
				for (TMenu sMenu : pMenu.getSubMenus()) {
					if(!hasAuth(sMenu,auths)){
						continue;
					}
					if (sMenu.getParentMenu().getId() == pMenu.getId()) {
						String icon = "pictures";
						if (sMenu.getIcon() != null) {
							icon = sMenu.getIcon().getIconCls();
						}
						// menuString.append("<li><div> <a class=\""+function.getFunctionName()+"\" iconCls=\""+icon+"\" target=\"tabiframe\"  href=\""+function.getFunctionUrl()+"\"> <span class=\"icon "+icon+"\" >&nbsp;</span> <span class=\"nav\">"+function.getFunctionName()+"</span></a></div></li>");
						menuString.append("<li><div  title=\""
								+ sMenu.getMenuName() + "\" url=\""
								+ sMenu.getUrl() + "\" iconCls=\""+icon+"\"> <a  href=\"#\" > <span class=\"icon " + icon
								+ "\" >&nbsp;</span> <span class=\"nav\" >"
								+ sMenu.getMenuName() + "</span></a></div></li>");
					}
				}
				if (submenusize > 0) {
					menuString.append("</ul></div>");
				}
			}	
		}
	
		return menuString.toString();
	}

	private boolean hasAuth(TMenu pMenu, Collection<GrantedAuthority> auths) {
		String module=pMenu.getModuleName();
		for(GrantedAuthority auth:auths){
			String AUTH="ROLE_"+module+"_VIEW";
			if(auth.getAuthority().equals(Constants.AUTH_SYSTEM)){
				return true;
			}
			if(auth.getAuthority().equals(AUTH)){
				return true;
			}
		}
		return false;
	}
}
