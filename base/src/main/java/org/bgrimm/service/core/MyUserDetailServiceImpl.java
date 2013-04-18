package org.bgrimm.service.core;

import org.apache.log4j.Logger;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("myUserDetailServiceImpl")
public class MyUserDetailServiceImpl implements UserDetailsService {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MyUserDetailServiceImpl.class);

	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		if (logger.isDebugEnabled()) {
			logger.debug("loadUserByUsername(String) - start"); //$NON-NLS-1$
		}


		if (logger.isDebugEnabled()) {
			logger.debug("loadUserByUsername(String) - end"); //$NON-NLS-1$
		}
		return null;
	}

}
