package org.bgrimm.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

//流动资产明细(现金/银行存款等)

public class CurrentAssets {
	@Id
	@GeneratedValue
	private long id;

}
