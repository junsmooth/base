package org.bgrimm.service;

import org.bgrimm.domain.bgrimm.TableParam;

public interface ISeepageService {

	public Object getAllPoints();

	public Object getSeepagePageList(TableParam param);

}
