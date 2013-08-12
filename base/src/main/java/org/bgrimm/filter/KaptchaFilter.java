//package org.bgrimm.filter;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.bgrimm.utils.JSONUtils;
//import org.springframework.security.core.context.SecurityContext;
//import org.springframework.security.core.context.SecurityContextHolder;
//
//public class KaptchaFilter implements Filter {
//
//	public void init(FilterConfig filterConfig) throws ServletException {
//
//	}
//
//	public void doFilter(ServletRequest request, ServletResponse response,
//			FilterChain chain) throws IOException, ServletException {
//		boolean captchaValidated = validationKaptcha((HttpServletRequest) request);
//		String result = "";
//		RedirectResponseWrapper redirectResponseWrapper = new RedirectResponseWrapper(
//				(HttpServletResponse) response);
//		if (!captchaValidated) {
//			result = JSONUtils.simpleJSON(false, "验证码错误");
//			redirectResponseWrapper.getWriter().write(result);
//			redirectResponseWrapper.getWriter().flush();
//			return;
//		}
//		chain.doFilter(request, redirectResponseWrapper);
//		if (isAuthenticationError(redirectResponseWrapper)) {
//			result = JSONUtils.simpleJSON(false, "用户名或密码错误");
//			redirectResponseWrapper.getWriter().write(result);
//			redirectResponseWrapper.getWriter().flush();
//		} else {
//			result = JSONUtils.simpleJSON(true, "Login Success!");
//			redirectResponseWrapper.getWriter().write(result);
//			redirectResponseWrapper.getWriter().flush();
//		}
//
//	}
//
//	private boolean isAuthenticated(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		if (session == null)
//			return false;
//		Object contextFromSession = session
//				.getAttribute("SPRING_SECURITY_CONTEXT");
//		if (contextFromSession == null)
//			return false;
//		if (!(contextFromSession instanceof SecurityContext))
//			return false;
//		return true;
//	}
//
//	private boolean isAuthenticationError(RedirectResponseWrapper response) {
//		String redirect = response.getRedirect();
//
//		if (redirect != null && redirect.contains("login?login_error")) {
//
//			return true;
//		}
//		return false;
//	}
//
//	private boolean validationKaptcha(HttpServletRequest request) {
//		String c = (String) request.getSession().getAttribute(
//				com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
//		String parm = (String) request.getParameter("CheckCode");
//
//		if (c != null && parm != null) {
//			if (c.equals(parm)) {
//				return true;
//			} else {
//				return false;
//			}
//		}
//		return false;
//	}
//
//	public void destroy() {
//
//	}
//
//}
