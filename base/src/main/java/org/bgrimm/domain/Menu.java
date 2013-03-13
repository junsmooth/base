package org.bgrimm.domain;

public class Menu {

	private int id;
	private String text;
	private String iconCls;
	private boolean leaf = false;
	private String controller;
	public String getController() {
		return controller;
	}

	public void setController(String controller) {
		this.controller = controller;
	}

	private Menu parent;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public boolean isLeaf() {
		return leaf;
	}

	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}

	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}

}
