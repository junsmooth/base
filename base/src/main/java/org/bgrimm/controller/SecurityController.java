package org.bgrimm.controller;

import org.bgrimm.uitls.JSONUtils;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("security")
public class SecurityController {
	//This url is not accessable if user not logined
	@RequestMapping("validUser")
	public @ResponseBody
	Object getCurrentUser() {
		Object principal = SecurityContextHolder.getContext()
				.getAuthentication();
		if (principal != null
				&& principal instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) principal;
			String user=token.getName();
			return JSONUtils.resultJsonMap(user, true);
		}
		return JSONUtils.resultJsonMap("", false);
	}
}
