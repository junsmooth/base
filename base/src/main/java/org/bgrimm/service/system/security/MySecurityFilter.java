









package org.bgrimm.service.system.security;

import org.apache.log4j.Logger;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Service;

@Service("myFilter")
public class MySecurityFilter extends AbstractSecurityInterceptor implements
		Filter {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MySecurityFilter.class);

	@Autowired
	@Qualifier("mySecurityMetadataSource")
	private FilterInvocationSecurityMetadataSource securityMetadataSource;

	public void setSecurityMetadataSource(
			FilterInvocationSecurityMetadataSource securityMetadataSource) {
		this.securityMetadataSource = securityMetadataSource;
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (logger.isDebugEnabled()) {
			logger.debug("doFilter(ServletRequest, ServletResponse, FilterChain) - start"); //$NON-NLS-1$
		}

		FilterInvocation fi = new FilterInvocation(request, response, chain);
		invoke(fi);

		if (logger.isDebugEnabled()) {
			logger.debug("doFilter(ServletRequest, ServletResponse, FilterChain) - end"); //$NON-NLS-1$
		}
	}

	private void invoke(FilterInvocation fi) throws IOException,
			ServletException {
		// object为FilterInvocation对象
		// super.beforeInvocation(fi);源码
		// 1.获取请求资源的权限
		// 执行Collection<ConfigAttribute> attributes =
		// SecurityMetadataSource.getAttributes(object);
		// 2.是否拥有权限
		// this.accessDecisionManager.decide(authenticated, object, attributes);
		InterceptorStatusToken token = super.beforeInvocation(fi);
		try {
			fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
		} finally {
			super.afterInvocation(token, null);
		}
	}

	public void destroy() {

	}

	public SecurityMetadataSource getSecurityMetadataSource() {
		return securityMetadataSource;
	}

	@Autowired
	@Qualifier("myAuthenticationManager")
	public void setAuthenticationManager(
			AuthenticationManager authenticationManager) {
		if (logger.isInfoEnabled()) {
			logger.info("setAuthenticationManager(AuthenticationManager)"); //$NON-NLS-1$
		}
		super.setAuthenticationManager(authenticationManager);
	}

	@Autowired
	@Qualifier("myAccessDecisionManager")
	public void setAccessDecisionManager(
			AccessDecisionManager accessDecisionManager) {
		super.setAccessDecisionManager(accessDecisionManager);
	}

	@Override
	public Class<?> getSecureObjectClass() {
		return FilterInvocation.class;
	}

	@Override
	public SecurityMetadataSource obtainSecurityMetadataSource() {
		return this.securityMetadataSource;
	}

}
