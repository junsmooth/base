/**
 * 数据同步后台服务进程<p>
 * 用于把采集到的值包括表面位移的值按一小时统计一次的频率存入到新表中
 */
package org.bgrimm.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.service.impl.DataMigrationService;
import org.bgrimm.utils.Constants;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

@Controller
public class DataMigrationController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(DataMigrationController.class);
	@Autowired
	DataMigrationService service;

	@Scheduled(fixedRate = 60 * 60 * 1000 * 24)
	public void dataMigration() {
		// Current Time->00:00:00
		// DateTime end = new DateTime().toDateMidnight().toDateTime();
		List<MonitoringPoint> points = service.loadMonitoringPoints();
		for (MonitoringPoint mp : points) {
			if (mp.getType().getCode().equals(Constants.JCD_SP)) {
				continue;
			}
			DateTime startDateTime = service.startTimeOfThisMigration(mp);
			if (startDateTime == null) {
				continue;// No old data, nothing need to do
			}
			DateTime endDateTime = service.endTimeOfThisMigration(mp);
			// For Performance consideration,Migrate data by oneday period
			for (; startDateTime.getMillis() < endDateTime.getMillis();) {
				DateTime endDate = startDateTime.plusDays(1).toDateMidnight()
						.toDateTime();
				if (endDate.getMillis() > endDateTime.getMillis()) {
					endDate = endDateTime;
				}
				service.migrationData(startDateTime, endDate, mp);
				startDateTime = endDate;// 0:0:0
			}
		}
	}

}
