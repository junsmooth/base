package org.bgrimm.service;

import org.bgrimm.domain.bgrimm.TableParam;

public interface IDryBeachElevationService {

	Object getAllPoints();

	Object getDryBeachPageList(TableParam param);

}
