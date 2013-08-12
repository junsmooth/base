package org.bgrimm.domain.system;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.validator.constraints.NotEmpty;

@Entity(name = "t_menu")
public class TMenu extends IdEntity implements java.io.Serializable,
		Comparable<TMenu> {
	private static final long serialVersionUID = 7745791364255292541L;
	@Column(name = "menuname", nullable = false, length = 50)
	@NotEmpty
	private String menuName;

	@Column(name = "modulename", nullable = false, length = 50)
	private String moduleName;

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	private String url;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "parentMenu")
	private List<TMenu> subMenus;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "iconid")
	private TIcon icon;
	@ManyToOne
	@JoinColumn(name = "parentid")
	private TMenu parentMenu;
	@Column(name = "menuorder", length = 50)
	private String menuOrder;

	public String getMenuOrder() {
		return menuOrder;
	}

	public void setMenuOrder(String menuOrder) {
		this.menuOrder = menuOrder;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<TMenu> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(List<TMenu> subMenus) {
		this.subMenus = subMenus;
	}

	public TIcon getIcon() {
		return icon;
	}

	public void setIcon(TIcon icon) {
		this.icon = icon;
	}

	public TMenu getParentMenu() {
		return parentMenu;
	}

	public void setParentMenu(TMenu parentMenu) {
		this.parentMenu = parentMenu;
	}

	@Override
	public String toString() {
		return super.toString() + "TMenu [menuName=" + menuName + ", url="
				+ url + ", subMenus=" + subMenus + ", icon=" + icon
				+ ", parentMenu="
				+ (parentMenu != null ? parentMenu.getId() : "")
				+ ", menuOrder=" + menuOrder + "]";
	}

	public int compareTo(TMenu o) {
		if(menuOrder==null||o.getMenuOrder()==null){
			return 0;
		}
		return menuOrder.compareTo(o.getMenuOrder());
	}

}
