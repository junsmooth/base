package org.bgrimm.service;

import java.util.List;

import org.bgrimm.domain.Role;
import org.bgrimm.persistence.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService {
	@Autowired
	private RoleMapper mapper;

	public List<Role> getRoles() {
		return mapper.getRoles();
	}
}
