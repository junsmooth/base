package org.bgrimm.service.core.security;

import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.Logger;
import org.bgrimm.domain.core.TAuthority;
import org.bgrimm.domain.core.TRole;
import org.bgrimm.domain.core.TUser;
import org.bgrimm.service.core.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.acls.domain.GrantedAuthoritySid;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("myUserDetailServiceImpl")
public class MyUserDetailServiceImpl implements UserDetailsService {
	@Autowired
	@Qualifier("commonService")
	private CommonService commonService;

	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(MyUserDetailServiceImpl.class);

	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		if (logger.isDebugEnabled()) {
			logger.debug("loadUserByUsername(String) - start"); //$NON-NLS-1$
		}
		TUser user = commonService.findUniqueByProperty(TUser.class,
				"username", username);

		Set<TRole> roles = user.getRoles();

		if (logger.isInfoEnabled()) {
			logger.info("loadUserByUsername(String) - Set<TRole> roles=" + roles); //$NON-NLS-1$
		}
		Set<GrantedAuthority> auths = new HashSet<GrantedAuthority>();
		for (TRole role : roles) {
			Set<TAuthority> authoritys = role.getAuths();
			for (TAuthority auth : authoritys) {
				GrantedAuthority ga = new SimpleGrantedAuthority(auth.getName());
				auths.add(ga);
			}
		}

		if (logger.isInfoEnabled()) {
			logger.info("loadUserByUsername(String) - TUser user=" + user); //$NON-NLS-1$
		}

		//auths.add(new SimpleGrantedAuthority("ROLE_MENU_QUERY"));
		if (logger.isDebugEnabled()) {
			logger.debug("loadUserByUsername(String) - end"); //$NON-NLS-1$
		}
		user.setAuthoritis(auths);
		return user;
	}

}
