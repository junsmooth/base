package org.bgrimm.service.system.security;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.bgrimm.domain.system.TMenu;
import org.bgrimm.service.system.MenuService;
import org.bgrimm.utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Service;

@Service("mySecurityMetadataSource")
public class MySecurityMetadataSource implements
		FilterInvocationSecurityMetadataSource {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(MySecurityMetadataSource.class);

	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
	private static List blacklist = new ArrayList();
	private static List whitlist = new ArrayList();
	@Autowired
	private MenuService menuService;

	public MySecurityMetadataSource() {

	}

	private void loadDef() {
		Properties prop = new Properties();
		InputStream in = getClass().getClassLoader().getResourceAsStream(
				"security_url_checklist.properties");
		blacklist.clear();
		whitlist.clear();
		try {
			prop.load(in);
			for(Object key:prop.keySet()){
				if("allow".equals(prop.get(key))){
					whitlist.add(key);
				}else{
					blacklist.add(key);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		List<TMenu> menus = menuService.getAllMenus();
		for (TMenu menu : menus) {
			Collection<ConfigAttribute> configAttributes = new HashSet<ConfigAttribute>();
			ConfigAttribute cofig = new SecurityConfig("ROLE_"
					+ menu.getModuleName() + "_VIEW");
			configAttributes.add(cofig);
			resourceMap.put(menu.getModuleName(), configAttributes);
		}

	}

	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		if (logger.isDebugEnabled()) {
			logger.debug("getAttributes(Object) - start"); //$NON-NLS-1$
		}
		if (resourceMap == null) {
			loadDef();
		}

		String requestUrl = ((FilterInvocation) object).getRequestUrl();
		if(whitlist.contains(requestUrl)){
			return defaultAttributes();
		}
		if(blacklist.contains(requestUrl)){
			return deniedAttributes();
		}
		
		if (logger.isInfoEnabled()) {
			logger.info("getAttributes(Object) - String requestUrl=" + requestUrl); //$NON-NLS-1$
		}
		List<TMenu> menus = menuService.getAllMenus();
		for (TMenu m : menus) {
			String url = m.getUrl();
			if ("".equals(url) || "/".equals(url)) {
				continue;
			}
			if (requestUrl.contains(url)) {
				return resourceMap.get(m.getModuleName());
			}
		}
		return deniedAttributes();
	}

	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return new ArrayList();
	}

	private Collection<ConfigAttribute> defaultAttributes() {
		Collection<ConfigAttribute> configAttributes = new HashSet<ConfigAttribute>();
		ConfigAttribute config = new SecurityConfig(Constants.AUTH_DEFAULT_VIEW);
		configAttributes.add(config);
		return configAttributes;
	}

	private Collection<ConfigAttribute> deniedAttributes() {
		Collection<ConfigAttribute> configAttributes = new HashSet<ConfigAttribute>();
		ConfigAttribute config = new SecurityConfig(Constants.AUTH_DENIED_VIEW);
		configAttributes.add(config);
		return configAttributes;
	}

	public boolean supports(Class<?> clazz) {
		return true;
	}

}
