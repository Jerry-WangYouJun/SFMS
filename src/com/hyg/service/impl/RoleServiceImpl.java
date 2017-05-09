package com.hyg.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.hyg.core.model.Grid;
import com.hyg.mapping.RoleMapper;
import com.hyg.pojo.Role;
import com.hyg.service.RoleServiceI;

@Service
public class RoleServiceImpl implements RoleServiceI {
	@Resource
	private RoleMapper roleDao;
	@Autowired
	private HttpServletRequest request;

	@Override
	public List<Role> findRoleDicMaps() {
		List<Role> results = this.roleDao.selectRoleByWhere(new Role());
		return results;
	}

	@Override
	public Grid findRoleList(Role role) {
		String pageIndex = request.getParameter("page");
		String rowsIndex = request.getParameter("rows");
		PageHelper.startPage(Integer.parseInt(pageIndex),
				Integer.parseInt(rowsIndex));
		Grid grid = new Grid();
		List<Role> results = roleDao.selectRoleByWhere(role);
		Long total = this.roleDao.selectRoleCountByWhere(role);
		grid.setRows(results);
		grid.setTotal(total);
		return grid;
	}

	@Override
	public Integer addRole(Role role) {
		return this.roleDao.insert(role);
	}

}
