package org.bgrimm.controller.system;

import javax.servlet.http.HttpServletRequest;

import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.domain.system.TUser;
import org.bgrimm.service.system.CommonService;
import org.bgrimm.uitls.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private CommonService commonService;

	public void setCommonService(CommonService commonService) {
		this.commonService = commonService;
	}

	@RequestMapping("list")
	public String list() {
		return "user/list";
	}
	@RequestMapping("rolelist")
	public String rolelist() {
		return "user/roleList";
	}
	@RequestMapping("list/data")
	public @ResponseBody
	Object userList(@RequestParam int page, @RequestParam int rows) {
		PagedQuery pq = new PagedQuery(TUser.class, page, rows);
		PageList pl = commonService.getPagedList(pq);
		return pl;
	}

	@RequestMapping("remove")
	public @ResponseBody
	JsonMsg remove(@RequestParam long id) {
		try {
			commonService.deleteEntityById(TUser.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.createJsonMsg(false, "操作失败", e.getMessage());
		}
		return JsonMsg.simpleSuccessJson();
	}

	@RequestMapping("addOrUpdate")
	public String addOrUpdate(HttpServletRequest req, Model model,
			@RequestParam long id) {
		return "user/add";

	}

}
