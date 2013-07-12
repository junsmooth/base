package org.bgrimm.domain.system;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_icon")
public class TIcon extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 8068115935984451712L;
	@Column(name = "iconname", nullable = false, length = 100)
	private String iconName;
	@Column(name = "iconpath", length = 300)
	private String iconPath;
	@Column(name = "iconcls", length = 200)
	private String iconCls;
	@Column(name="extension",length=20)
	private String iconExtension;
	
	@ManyToOne
	@JoinColumn(name="type_id")
	private TIconType type;
	public TIconType getType() {
		return type;
	}

	public void setType(TIconType type) {
		this.type = type;
	}

	public String getIconExtension() {
		return iconExtension;
	}

	public void setIconExtension(String iconExtension) {
		this.iconExtension = iconExtension;
	}

	public String getIconName() {
		return iconName;
	}

	public void setIconName(String iconName) {
		this.iconName = iconName;
	}

	public String getIconPath() {
		return iconPath;
	}

	public void setIconPath(String iconPath) {
		this.iconPath = iconPath;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	@Override
	public String toString() {
		return "TIcon [iconName=" + iconName + ", iconPath=" + iconPath
				+ ", iconCls=" + iconCls + ", iconExtension=" + iconExtension
				+ ", type=" + type + ", toString()=" + super.toString() + "]";
	}
	

}
