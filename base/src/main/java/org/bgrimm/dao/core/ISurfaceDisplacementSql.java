package org.bgrimm.dao.core;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public interface ISurfaceDisplacementSql {


	public final static String surfaceDispHql="select a.logtime,a.dN from BMWY a where a.logtime  between dateadd(day,-7,getdate()) and getdate()  order by LogTime";
}
