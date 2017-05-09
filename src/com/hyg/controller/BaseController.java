package com.hyg.controller;

import java.util.List;

import javax.annotation.Resource;

import com.hyg.pojo.Department;
import com.hyg.pojo.Dictionary;
import com.hyg.pojo.Stock;
import com.hyg.pojo.Supplier;
import com.hyg.service.DepartmentServiceI;
import com.hyg.service.DictionaryServiceI;
import com.hyg.service.StockServiceI;
import com.hyg.service.SupplierServiceI;

public class BaseController {
	@Resource(name="departmentServiceImpl")
	private DepartmentServiceI deptService;

	@Resource(name="dictionaryServiceImpl")
	private DictionaryServiceI dictionaryService;
	
	@Resource(name="stockServiceImpl")
	private StockServiceI stockService;

	@Resource(name="supplierServiceImpl")
	private SupplierServiceI supplierService;
	
	/**
	 * 部门下拉框
	 * @return
	 */
	public List<Department> getDeptSelects(){
		return this.deptService.findDeptSelect();
	}
	
	/**
	 * 仓库下拉框
	 * @return
	 */
	public List<Stock> getStockSelects(){
		return this.stockService.findStockDicMaps();
	}
	/**
	 * 供应商下拉框
	 * @return
	 */
	public List<Supplier> getSupplierSelects(){
		return this.supplierService.findSupplierDicMaps();
	}
	/**
	 * 根据字典编码查找字典下拉框
	 * @param dicNo 字典编码
	 * @return
	 */
	public List<Dictionary> getDictionarySelects(String dicNo){
		return this.dictionaryService.findDicMaps(dicNo);
	}
	
}
