package org.bgrimm.controller.system;

import java.util.List;
import java.util.Map;

import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.domain.system.TUser;
import org.bgrimm.service.system.CommonService;
import org.bgrimm.service.system.RoleService;
import org.bgrimm.uitls.JSONUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@RequestMapping("list/data")
	public @ResponseBody
	Object userList(@RequestParam int page, @RequestParam int rows) {
		PagedQuery pq = new PagedQuery(TUser.class, page, rows);
		PageList pl = commonService.getPagedList(pq);
		System.out.println(pl.getRows());
		System.out.println(pl.getTotal());
		return pl;
	}

}
