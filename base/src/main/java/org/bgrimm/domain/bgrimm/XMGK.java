package org.bgrimm.domain.bgrimm;


import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="project")
public class XMGK {

	@Id
	@GeneratedValue
	private int id;
    private String projectname;
    private String unit;
    private String contents;
    private Date time;
    private Date completion;
    private String surface1;
    private String internal1;
    private String elevation1;
    private String saturation1;
    private String water1;
    private String video1;
    private String seepage1;
    private String rainfall1;
    private String waterpressure;
    private String turbidity1;
    private String hp;
    private String temperature;
    private String surface2;
    private String saturation2;
    private String internal2;
    private String water2;
    private String elevation2;
    private String video2;
    private String rainfall2;
    private String dampressure;
    private String seepage2;
    private String turbidity2;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Date getCompletion() {
		return completion;
	}
	public void setCompletion(Date completion) {
		this.completion = completion;
	}
	public String getSurface1() {
		return surface1;
	}
	public void setSurface1(String surface1) {
		this.surface1 = surface1;
	}
	public String getInternal1() {
		return internal1;
	}
	public void setInternal1(String internal1) {
		this.internal1 = internal1;
	}
	public String getElevation1() {
		return elevation1;
	}
	public void setElevation1(String elevation1) {
		this.elevation1 = elevation1;
	}
	public String getSaturation1() {
		return saturation1;
	}
	public void setSaturation1(String saturation1) {
		this.saturation1 = saturation1;
	}
	public String getWater1() {
		return water1;
	}
	public void setWater1(String water1) {
		this.water1 = water1;
	}
	public String getVideo1() {
		return video1;
	}
	public void setVideo1(String video1) {
		this.video1 = video1;
	}
	public String getSeepage1() {
		return seepage1;
	}
	public void setSeepage1(String seepage1) {
		this.seepage1 = seepage1;
	}
	public String getRainfall1() {
		return rainfall1;
	}
	public void setRainfall1(String rainfall1) {
		this.rainfall1 = rainfall1;
	}
	public String getWaterpressure() {
		return waterpressure;
	}
	public void setWaterpressure(String waterpressure) {
		this.waterpressure = waterpressure;
	}
	public String getTurbidity1() {
		return turbidity1;
	}
	public void setTurbidity1(String turbidity1) {
		this.turbidity1 = turbidity1;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getSurface2() {
		return surface2;
	}
	public void setSurface2(String surface2) {
		this.surface2 = surface2;
	}
	public String getSaturation2() {
		return saturation2;
	}
	public void setSaturation2(String saturation2) {
		this.saturation2 = saturation2;
	}
	public String getInternal2() {
		return internal2;
	}
	public void setInternal2(String internal2) {
		this.internal2 = internal2;
	}
	public String getWater2() {
		return water2;
	}
	public void setWater2(String water2) {
		this.water2 = water2;
	}
	public String getElevation2() {
		return elevation2;
	}
	public void setElevation2(String elevation2) {
		this.elevation2 = elevation2;
	}
	public String getVideo2() {
		return video2;
	}
	public void setVideo2(String video2) {
		this.video2 = video2;
	}
	public String getRainfall2() {
		return rainfall2;
	}
	public void setRainfall2(String rainfall2) {
		this.rainfall2 = rainfall2;
	}
	public String getDampressure() {
		return dampressure;
	}
	public void setDampressure(String dampressure) {
		this.dampressure = dampressure;
	}
	public String getSeepage2() {
		return seepage2;
	}
	public void setSeepage2(String seepage2) {
		this.seepage2 = seepage2;
	}
	public String getTurbidity2() {
		return turbidity2;
	}
	public void setTurbidity2(String turbidity2) {
		this.turbidity2 = turbidity2;
	}
    
}
