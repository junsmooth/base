package org.bgrimm.service;

import org.bgrimm.domain.bgrimm.TableParam;

public interface IWaterLevelService {

	Object getAllPoints();

	Object getWaterLevelPageList(TableParam param);

}
