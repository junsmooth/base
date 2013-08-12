package org.bgrimm.domain.bgrimm;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name="tailings")
public class WKKGK{

	@Id
	@GeneratedValue
	private int id;
	private String time;
	private String using;
	private String type;
	private String dams;
	private String tlevel;
	private String area;
	private String standard;
	private String early;
	private String dambottom;
	private String alignment1;
	private String alignment2;
	private String height;
	private String total;
	private String effective;
	private String alignment3;
	private String damhigh;
	private String length;
	private String slope;
	private String damwidth;
	private String daminslope;
	private String damoutslope1;
	private String damoutslope2;
	private String avgslope;
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getUsing() {
		return using;
	}
	public void setUsing(String using) {
		this.using = using;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDams() {
		return dams;
	}
	public void setDams(String dams) {
		this.dams = dams;
	}
	public String getTlevel() {
		return tlevel;
	}
	public void setTlevel(String tlevel) {
		this.tlevel = tlevel;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getEarly() {
		return early;
	}
	public void setEarly(String early) {
		this.early = early;
	}
	public String getDambottom() {
		return dambottom;
	}
	public void setDambottom(String dambottom) {
		this.dambottom = dambottom;
	}
	public String getAlignment1() {
		return alignment1;
	}
	public void setAlignment1(String alignment1) {
		this.alignment1 = alignment1;
	}
	public String getAlignment2() {
		return alignment2;
	}
	public void setAlignment2(String alignment2) {
		this.alignment2 = alignment2;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getEffective() {
		return effective;
	}
	public void setEffective(String effective) {
		this.effective = effective;
	}
	public String getAlignment3() {
		return alignment3;
	}
	public void setAlignment3(String alignment3) {
		this.alignment3 = alignment3;
	}
	public String getDamhigh() {
		return damhigh;
	}
	public void setDamhigh(String damhigh) {
		this.damhigh = damhigh;
	}
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public String getSlope() {
		return slope;
	}
	public void setSlope(String slope) {
		this.slope = slope;
	}
	public String getDamwidth() {
		return damwidth;
	}
	public void setDamwidth(String damwidth) {
		this.damwidth = damwidth;
	}
	public String getDaminslope() {
		return daminslope;
	}
	public void setDaminslope(String daminslope) {
		this.daminslope = daminslope;
	}
	public String getDamoutslope1() {
		return damoutslope1;
	}
	public void setDamoutslope1(String damoutslope1) {
		this.damoutslope1 = damoutslope1;
	}
	public String getDamoutslope2() {
		return damoutslope2;
	}
	public void setDamoutslope2(String damoutslope2) {
		this.damoutslope2 = damoutslope2;
	}
	public String getAvgslope() {
		return avgslope;
	}
	public void setAvgslope(String avgslope) {
		this.avgslope = avgslope;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
}
