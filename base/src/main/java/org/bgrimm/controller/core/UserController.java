package org.bgrimm.controller.core;

import java.util.List;
import java.util.Map;

import org.bgrimm.domain.core.PageList;
import org.bgrimm.domain.core.PagedQuery;
import org.bgrimm.domain.core.TUser;
import org.bgrimm.service.RoleService;
import org.bgrimm.service.core.CommonService;
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

	@Autowired
	private RoleService roleService;

	@RequestMapping("roles")
	public @ResponseBody
	Map getRoles() {
		List result = roleService.getRoles();
		Map m = JSONUtils.resultJsonMap(result, true);
		return m;
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
