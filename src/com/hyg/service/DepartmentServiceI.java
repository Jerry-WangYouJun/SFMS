package com.hyg.service;

import java.util.List;

import com.hyg.core.model.Grid;
import com.hyg.pojo.Department;

public interface DepartmentServiceI {
	public Grid findDeptList(Department department);
	
	public List<Department> findDeptSelect();

	public Integer addDept(Department department);
}
