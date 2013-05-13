package org.bgrimm.service.system.security;

import java.util.Collection;
import java.util.Iterator;

import org.apache.log4j.Logger;
import org.bgrimm.uitls.Constants;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

@Service("myAccessDecisionManager")
public class MyAccessDecisionManager implements AccessDecisionManager {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(MyAccessDecisionManager.class);

	public void decide(Authentication authentication, Object object,
			Collection<ConfigAttribute> configAttributes)
			throws AccessDeniedException, InsufficientAuthenticationException {
		if (logger.isInfoEnabled()) {
			logger.info("decide(Authentication, Object, Collection<ConfigAttribute>) - decide: - object=" + object); //$NON-NLS-1$
		}

		if (configAttributes == null) {
			return;
		}
		// 所请求的资源拥有的权限(一个资源对多个权限)

		Iterator<ConfigAttribute> iterator = configAttributes.iterator();
		while (iterator.hasNext()) {
			ConfigAttribute configAttribute = iterator.next();
			// 访问所请求资源所需要的权限
			String needPermission = configAttribute.getAttribute();

			if (logger.isInfoEnabled()) {
				logger.info("decide(Authentication, Object, Collection<ConfigAttribute>) - String needPermission=" + needPermission); //$NON-NLS-1$
			}

			// 用户所拥有的权限authentication
			for (GrantedAuthority ga : authentication.getAuthorities()) {
				String ownedauthority = ga.getAuthority();

				if (logger.isInfoEnabled()) {
					logger.info("decide(Authentication, Object, Collection<ConfigAttribute>) - String ownedauthority=" + ownedauthority); //$NON-NLS-1$
				}
				String authority = ga.getAuthority();
				if (Constants.AUTH_SYSTEM.equals(authority)) {
					if (logger.isInfoEnabled()) {
						logger.info("decide(Authentication, Object, Collection<ConfigAttribute>) - USER HAS ROLE_SYSTEM AUTHORITY."); //$NON-NLS-1$
					}
					return;
				}
				if (needPermission.equals(ga.getAuthority())) {
					return;
				}
			}
		}
		if (logger.isDebugEnabled()) {
			logger.debug("decide(Authentication, Object, Collection<ConfigAttribute>) - end"); //$NON-NLS-1$
		}
		// 没有权限
		throw new AccessDeniedException("Acces Denied.");

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
