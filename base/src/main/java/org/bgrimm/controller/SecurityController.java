package org.bgrimm.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.bgrimm.utils.JSONUtils;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("security")
public class SecurityController {
	// This url is not accessable if user not logined
	@RequestMapping("validUser")
	public @ResponseBody
	Object getCurrentUser() {
		Object principal = SecurityContextHolder.getContext()
				.getAuthentication();
		if (principal != null
				&& principal instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) principal;
			String user = token.getName();
			return JSONUtils.resultJsonMap(user, true);
		}
		return JSONUtils.resultJsonMap("", false);
	}
	@RequestMapping("hasRole/{role}")
	public @ResponseBody
	Object hasRole(@PathVariable String role) {
		Object principal = SecurityContextHolder.getContext()
				.getAuthentication();
		List<String> authList = new ArrayList();
		if (principal != null
				&& principal instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) principal;
			Collection<GrantedAuthority> auths = token.getAuthorities();
			for (GrantedAuthority auth : auths) {
				if(role.equals(auth.getAuthority())){
					return true;
				}
			}
		}
		return false;
	}
	
	@RequestMapping("authority")
	public @ResponseBody
	Object getAuths() {
		Object principal = SecurityContextHolder.getContext()
				.getAuthentication();
		List<String> authList = new ArrayList();
		if (principal != null
				&& principal instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) principal;
			Collection<GrantedAuthority> auths = token.getAuthorities();
			for (GrantedAuthority auth : auths) {
				authList.add(auth.getAuthority());
			}
		}
		return authList;
	}
}
