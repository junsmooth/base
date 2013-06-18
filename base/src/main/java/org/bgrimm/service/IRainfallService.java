package org.bgrimm.service;

import org.bgrimm.domain.bgrimm.TableParam;

public interface IRainfallService {

	Object getAllPoints();

	Object getRainfallPageList(TableParam param);

}
