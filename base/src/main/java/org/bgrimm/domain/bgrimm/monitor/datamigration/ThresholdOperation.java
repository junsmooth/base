package org.bgrimm.domain.bgrimm.monitor.datamigration;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "t_thresholdop")
public class ThresholdOperation extends IdEntity {
	private String opName;

	public String getOpName() {
		return opName;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	private String displayName;
/**
 * 
 * @param i Real Value
 * @param j Threshold Value
 * @return
 */
	public boolean checkViolate(double i, double j) {
		if ("GT".equals(opName)) {
			return i > j;
		} else if ("GE".equals(opName)) {
			return Math.abs(i - j) < 0.00001 || (i - j) > 0.00001;
		} else if ("LT".equals(opName)) {
			return i < j;
		} else if ("LE".equals(opName)) {
			return Math.abs(i - j) < 0.00001 || (j - i) > 0.00001;
		}

		return false;
	}
	public boolean checkViolate(Object obj,double j){
		double i;
		try {
			i = Double.parseDouble(obj.toString());
			return checkViolate(i, j);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return false;
		
	}
}
