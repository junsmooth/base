package org.bgrimm.domain.bgrimm;

public class AttrValue {
	// attName in Chinese
	private String attName;
	private String attValue;
	// Monitoring Time of this value
	private String time;

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getAttName() {
		return attName;
	}

	public void setAttName(String attName) {
		this.attName = attName;
	}

	public String getAttValue() {
		return attValue;
	}

	public void setAttValue(String attValue) {
		this.attValue = attValue;
	}

	public String getAtt() {
		return att;
	}

	public void setAtt(String att) {
		this.att = att;
	}

	// attName in Englisth
	private String att;
}
