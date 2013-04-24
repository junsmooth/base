package org.bgrimm.service.core;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.bgrimm.domain.core.TMenu;
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
	private static Map<String, Collection<ConfigAttribute>> resourceMap =null;
	@Autowired
	private MenuService menuService;
	
	
	public MySecurityMetadataSource() {

	}
	private void loadDef(){
		resourceMap=new HashMap<String, Collection<ConfigAttribute>>();
		List<TMenu> menus = menuService.getAllMenus();
		for (TMenu menu : menus) {
			Collection<ConfigAttribute> configAttributes = new HashSet<ConfigAttribute>();
			ConfigAttribute cofig = new SecurityConfig("ROLE_"
					+ menu.getModuleName() + "_VIEW");
			configAttributes.add(cofig);
			String menuUrl = menu.getUrl();
			String[] urlsplits = StringUtils.split(menuUrl, "/");
			// split url, get the base path: /=/,/MENU=MENU,/SYSTEM=SYSTEM,...
			if (urlsplits.length > 0) {
				menuUrl = urlsplits[0];
			}
			resourceMap.put(menuUrl, configAttributes);
		}
		
	}

	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		if (logger.isDebugEnabled()) {
			logger.debug("getAttributes(Object) - start"); //$NON-NLS-1$
		}
		if(resourceMap==null){
			loadDef();
		}
		
		String requestUrl = ((FilterInvocation) object).getRequestUrl();
		if (logger.isInfoEnabled()) {
			logger.info("getAttributes(Object) - String requestUrl=" + requestUrl); //$NON-NLS-1$
		}
		String[] urlsplits = StringUtils.split(requestUrl, "/");
		String baseUrl = requestUrl;
		if (urlsplits.length > 0) {
			baseUrl = urlsplits[0];
		}
		return resourceMap.get(baseUrl);
	}

	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return new ArrayList();
	}

	public boolean supports(Class<?> clazz) {
		return true;
	}

}
