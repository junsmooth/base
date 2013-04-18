package org.bgrimm.service.core;

import org.apache.log4j.Logger;

import java.util.Collection;

import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service("myAccessDecisionManager")
public class MyAccessDecisionManager implements AccessDecisionManager{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MyAccessDecisionManager.class);

	public void decide(Authentication authentication, Object object,
			Collection<ConfigAttribute> configAttributes)
			throws AccessDeniedException, InsufficientAuthenticationException {
		if (logger.isDebugEnabled()) {
			logger.debug("decide(Authentication, Object, Collection<ConfigAttribute>) - start"); //$NON-NLS-1$
		}

		
		if (logger.isDebugEnabled()) {
			logger.debug("decide(Authentication, Object, Collection<ConfigAttribute>) - end"); //$NON-NLS-1$
		}
	}

	public boolean supports(ConfigAttribute attribute) {
		// TODO Auto-generated method stub
		return true;
	}

	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return true;
	}

}
