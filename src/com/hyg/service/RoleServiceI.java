package com.hyg.service;

import java.util.List;

import com.hyg.core.model.Grid;
import com.hyg.pojo.Role;

public interface RoleServiceI {

	List<Role> findRoleDicMaps();

	Grid findRoleList(Role role);

	Integer addRole(Role role);

}
