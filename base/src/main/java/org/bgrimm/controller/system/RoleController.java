package org.bgrimm.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.bgrimm.domain.system.AuthData;
import org.bgrimm.domain.system.TAuthority;
import org.bgrimm.domain.system.TMenu;
import org.bgrimm.domain.system.TOperation;
import org.bgrimm.domain.system.TRole;
import org.bgrimm.service.system.MenuService;
import org.bgrimm.service.system.RoleService;
import org.bgrimm.uitls.Constants;
import org.bgrimm.uitls.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		for(TRole role:roles){
			role.setAuths(null);
		}
		return roles;
	}

	@RequestMapping(value = "auth/saveAuth", method = RequestMethod.POST)
	public @ResponseBody
	Object saveAuth(@ModelAttribute("data") AuthData data) {
		long roleid = data.getRoleid();
		List<Map<String, String>> datas = data.getData();
		TRole role = roleService.getUniqueById(roleid);
		Set<TAuthority> authSets = new HashSet();
		for (Map<String, String> pair : datas) {
			long menuid = Long.parseLong(pair.get("menuid"));
			String opids = pair.get("auths");
			String[] ids = StringUtils.split(opids, ",");
			
			TMenu menu =menuService.getUniqueById(menuid);
			
			for(String opid:ids){
				long oid=Long.parseLong(opid);
				TOperation operation =roleService.getUniqueOperationById(oid);
				String AUTHORITY="ROLE_"+menu.getModuleName()+"_"+operation.getOpcode();
				TAuthority auth=roleService.getUniqueAuthorityByName(AUTHORITY);
				if(auth==null){
					auth=new TAuthority();
					auth.setName(AUTHORITY);
					roleService.saveOrUpdateAuthority(auth);
				}
				
				authSets.add(auth);
			}
		}
		role.setAuths(authSets);
		roleService.saveOrUpdate(role);
		return JsonMsg.simpleSuccessJson();
	}

	@RequestMapping("addOrUpdate")
	public String addOrUpdate(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		if (StringUtils.isNumeric(id)) {
			long pid = Long.parseLong(id);
			TRole role = roleService.getUniqueById(pid);
			model.addAttribute("role", role);
		}
		return "role/add";
	}

	@RequestMapping("editAuth")
	public String editAuth(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");

		if (StringUtils.isNumeric(id)) {
			List<TOperation> operations = roleService.loadAllOperations();
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
	public @ResponseBody
	Object getAuth(HttpServletRequest req, Model model, @RequestParam String id) {
		// String id = req.getParameter("id");
		List<Map> result = new ArrayList();
		List<TOperation> operations = roleService.loadAllOperations();
		if (StringUtils.isNumeric(id)) {
			TMenu menu = menuService.getRootMenu();
			TRole role = roleService.getUniqueById(Long.parseLong(id));
			Set auths = role.getAuths();

			Map m = getMenuMap(menu, auths, operations);

			Map rootMenuMap = new HashMap();
			rootMenuMap.put("id", menu.getId());
			rootMenuMap.put("name", menu.getMenuName());
			for (TOperation op : operations) {
				String auth = "ROLE_" + menu.getModuleName() + "_"
						+ op.getOpcode();
				Map opMap = new HashMap();
				opMap.put("id", op.getId());
				opMap.put("name", op.getName());
				opMap.put("opcode", op.getOpcode());
				if (haveAuth(auths, auth)) {
					opMap.put("checked", true);
				}
				rootMenuMap.put(op.getName(), opMap);
			}
			if (menu.getSubMenus() != null) {
				List<Map> children = new ArrayList();
				for (TMenu subMenu : menu.getSubMenus()) {
					Map m1 = new HashMap();
					m1.put("id", subMenu.getId());
					m1.put("name", subMenu.getMenuName());
					children.add(m1);
				}
				rootMenuMap.put("children", children);
			}

			result.add(m);
			return result;
		}
		return null;
	}

	private Map getMenuMap(TMenu menu, Set<TAuthority> auths,
			List<TOperation> operations) {
		Map m = new HashMap();
		m.put("id", menu.getId());
		m.put("name", menu.getMenuName());
		for (TOperation op : operations) {
			String auth = "ROLE_" + menu.getModuleName() + "_" + op.getOpcode();
			Map opMap = new HashMap();
			opMap.put("id", op.getId());
			opMap.put("name", op.getName());
			opMap.put("opcode", op.getOpcode());
			if (isSysManager(auths)) {
				opMap.put("checked", true);
			} else if (haveAuth(auths, auth)) {
				opMap.put("checked", true);
			}
			m.put(op.getName(), opMap);
		}
		if (menu.getSubMenus() != null) {
			List<Map> children = new ArrayList();
			for (TMenu subMenu : menu.getSubMenus()) {
				Map m1 = getMenuMap(subMenu, auths, operations);
				children.add(m1);
			}
			m.put("children", children);
		}

		return m;
	}

	private boolean isSysManager(Set<TAuthority> auths) {
		for (TAuthority auth : auths) {
			if (Constants.AUTH_SYSTEM.equals(auth.getName())) {
				return true;
			}
		}
		return false;

	}

	private boolean haveAuth(Set<TAuthority> auths, String auth) {

		for (TAuthority au : auths) {
			if (au.getName().equals(auth)) {
				return true;
			}
		}
		return false;
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
