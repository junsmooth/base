package org.bgrimm.domain.bgrimm.common;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "t_drawingposition")
public class TDrawingPosition extends IdEntity {
	private double x;
	private double y;
	@OneToOne(mappedBy = "drawPosition", cascade = { CascadeType.PERSIST,
			CascadeType.MERGE, CascadeType.REFRESH })
	private MonitoringPoint monPoint;

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
