package org.bgrimm.controller;

import java.util.List;

import javax.validation.Valid;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.common.AlarmColor;
import org.bgrimm.domain.system.TIcon;
import org.bgrimm.service.AlarmService;
import org.bgrimm.utils.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value = "alarmcolor", method = RequestMethod.GET)
	public String alarmcolor() {
		return "alarm/alarmcolor";
	}

	@RequestMapping(value = "alarmcolor", method = RequestMethod.POST)
	public @ResponseBody
	Object saveColor(@Valid AlarmColor color, BindingResult result) {
		if (result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			String err = "";
			for (ObjectError e : errors) {
				err += e.getObjectName() + ":" + e.getDefaultMessage() + "\n";
			}

			return JsonMsg.createJsonMsg(false, "操作失败", err);
		}
		try {
			service.saveOrUpdate(color);
			return JsonMsg.simpleSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.createJsonMsg(false, "操作失败", e.getMessage());
		}

	}
	@RequestMapping(value = "alarmcolor/{id}", method = RequestMethod.DELETE)
	public @ResponseBody
	Object delete(@PathVariable long id) {
		try {
			service.remove(id);
			return JsonMsg.simpleSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.createJsonMsg(false, "操作失败", e.getMessage());
		}
	}

	@RequestMapping(value = "alarmcolor/{id}/edit", method = RequestMethod.GET)
	public String editIcon(@PathVariable long id, Model model) {
		AlarmColor color = service.getAlarmColor(id);
		model.addAttribute("color", color);
		return "alarm/newColor";
	}

	@RequestMapping(value = "alarmcolor/new", method = RequestMethod.GET)
	public String newColor() {
		return "alarm/newColor";
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
		return service.getPagedAlarmRecords(param);
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

	@RequestMapping("alarmcolor/validateColorName")
	public @ResponseBody
	Object validateColorName(@RequestParam("colorName") String iconName,
			@RequestParam String id) {
		return service.isValidName(iconName, id);
	}

	@RequestMapping("showAlarmrecord/data")
	public @ResponseBody
	Object showAlarmRecordList(TableParam param) {
		return service.getShowAlarmRecordList();
	}
}
