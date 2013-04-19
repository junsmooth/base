package org.bgrimm.service.core;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Service;

@Service("mySecurityMetadataSource")
public class MySecurityMetadataSource implements FilterInvocationSecurityMetadataSource{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MySecurityMetadataSource.class);

	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		if (logger.isDebugEnabled()) {
			logger.debug("getAttributes(Object) - start"); //$NON-NLS-1$
		}
		   String requestUrl = ((FilterInvocation) object).getRequestUrl();
		if (logger.isInfoEnabled()) {
			logger.info("getAttributes(Object) - String requestUrl=" + requestUrl); //$NON-NLS-1$
		}
		 Collection<ConfigAttribute> configAttributes = new ArrayList<ConfigAttribute>();  
		 
		 ConfigAttribute configAttribute = new SecurityConfig("ROLE_MENU_QUERY");  
         configAttributes.add(configAttribute);  
		if (logger.isDebugEnabled()) {
			logger.debug("getAttributes(Object) - end"); //$NON-NLS-1$
		}
		return configAttributes;
	}

	public Collection<ConfigAttribute> getAllConfigAttributes() {
		// TODO Auto-generated method stub
		return new ArrayList();
	}

	public boolean supports(Class<?> clazz) {
		return true;
	}

}
