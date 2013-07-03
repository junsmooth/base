package org.bgrimm.domain.bgrimm.common;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.bgrimm.domain.bgrimm.AttrValue;
import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "t_drawingposition")
public class TDrawingPosition extends IdEntity {
	// Position of this point
	private double x;
	private double y;
	@OneToOne(mappedBy = "drawPosition", cascade = { CascadeType.PERSIST,
			CascadeType.MERGE, CascadeType.REFRESH })
	private MonitoringPoint monPoint;
	@Transient
	private List<AttrValue> values;

	public List<AttrValue> getValues() {
		return values;
	}

	public void setValues(List<AttrValue> values) {
		this.values = values;
	}

	public MonitoringPoint getMonPoint() {
		return monPoint;
	}

	public void setMonPoint(MonitoringPoint monPoint) {
		this.monPoint = monPoint;
	}

	public double getX() {
		return x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
		this.y = y;
	}

}
