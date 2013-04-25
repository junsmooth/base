package org.bgrimm.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.bgrimm.domain.system.TMenu;
import org.bgrimm.domain.system.TOperation;
import org.bgrimm.domain.system.TRole;
import org.bgrimm.service.system.MenuService;
import org.bgrimm.service.system.RoleService;
import org.bgrimm.uitls.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("role")
public class RoleController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(RoleController.class);

	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;

	@RequestMapping("list")
	public String list() {
		return "role/list";
	}

	@RequestMapping("list/data")
	public @ResponseBody
	List<TRole> datalist() {
		List<TRole> roles = roleService.getAllRoles();
		return roles;
	}

	@RequestMapping("addOrUpdate")
	public String addOrUpdate(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		if (StringUtils.isNumeric(id)) {
			long pid = Long.parseLong(id);
			TRole role = roleService.getUniqueById(pid);
			model.addAttribute("menu", role);
		}
		return "role/add";
	}

	@RequestMapping("editAuth")
	public String editAuth(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");

		if (StringUtils.isNumeric(id)) {
			List<TOperation> operations = roleService.getCommonService()
					.loadAll(TOperation.class);
			model.addAttribute("roleid", id);
			List<Map> ops = new ArrayList();
			for (TOperation op : operations) {
				Map o = new HashMap();
				o.put("id", op.getId());
				o.put("name", op.getName());
				ops.add(o);
			}
			model.addAttribute("ops", ops);
		}
		return "role/editAuth";
	}

	@RequestMapping("auth/edit")
	public @ResponseBody Object getAuth(HttpServletRequest req, Model model,@RequestParam String id) {
//		String id = req.getParameter("id");
		List<Map> result=new ArrayList();
		if (StringUtils.isNumeric(id)) {
			TMenu menu = menuService.getRootMenu();
			Map m=new HashMap();
			m.put("id", menu.getId());
			m.put("name", menu.getMenuName());
			TOperation op=new TOperation();
			op.setName("View");
			op.setId(1);
			op.setOpcode("VIEW");
			m.put(op.getName(), op);
			result.add(m);
			return result;
		}
		return null;
	}

	@RequestMapping("save")
	public @ResponseBody
	JsonMsg saveMenu(TRole role) {
		if (logger.isInfoEnabled()) {
			logger.info("saveMenu(TRole) - roletosave:" + role); //$NON-NLS-1$
		}

		roleService.saveOrUpdate(role);
		return JsonMsg.simpleSuccessJson();

	}
}
