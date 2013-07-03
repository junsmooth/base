package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.AlarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("alarm")
public class AlarmController {
	@Autowired
	private AlarmService service;
	
	@RequestMapping("threshold")
	public String threshold() {
		return "alarm/threshold";
	}
	
	@RequestMapping("alarmcolor")
	public String alarmcolor() {
		return "alarm/alarmcolor";
	}
	

	@RequestMapping("alarmtype")
	public String alarmtype() {
		return "alarm/alarmtype";
	}
	@RequestMapping("alarmrecord")
	public String alarmRecord() {
		return "alarm/alarmrecord";
	}
	@RequestMapping("threshold/data")
	public @ResponseBody
	Object thresholdList() {
		return service.getAllThreshold();
	}
	@RequestMapping("alarmrecord/data")
	public @ResponseBody
	Object alarmRecordList(TableParam param) {
		return service.getPagedAlarmRecords( param);
	}
	@RequestMapping("alarmtype/data")
	public @ResponseBody
	Object alarmTypeList() {
		return service.getAllAlarmType();
	}
	
	@RequestMapping("alarmcolor/data")
	public @ResponseBody
	Object alarmColorList() {
		return service.getAllAlarmColor();
	}
	
	@RequestMapping("showAlarmrecord/data")
	public @ResponseBody
	Object showAlarmRecordList(TableParam param) {
		return service.getShowAlarmRecordList();
	}
}
