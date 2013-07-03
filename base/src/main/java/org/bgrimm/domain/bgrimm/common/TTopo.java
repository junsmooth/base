package org.bgrimm.domain.bgrimm.common;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "t_topo_img")
public class TTopo extends IdEntity {
	public double getPosX() {
		return posX;
	}

	public void setPosX(double posX) {
		this.posX = posX;
	}

	public double getPosY() {
		return posY;
	}

	public void setPosY(double posY) {
		this.posY = posY;
	}

	public double getSizeW() {
		return sizeW;
	}

	public void setSizeW(double sizeW) {
		this.sizeW = sizeW;
	}

	public double getSizeH() {
		return sizeH;
	}

	public void setSizeH(double sizeH) {
		this.sizeH = sizeH;
	}

	public List<TDrawingPosition> getDrawPoints() {
		return drawPoints;
	}

	public void setDrawPoints(List<TDrawingPosition> drawPoints) {
		this.drawPoints = drawPoints;
	}

	// Image Postion
	private double posX;
	private double posY;
	// Image Size
	private double sizeW;
	private double sizeH;
	@Transient
	private List<TDrawingPosition> drawPoints;
}
