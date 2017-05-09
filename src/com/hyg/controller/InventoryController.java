package com.hyg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.swing.StringUIClientPropertyKey;

import com.github.pagehelper.PageHelper;
import com.hyg.core.StringUtils;
import com.hyg.core.model.Grid;
import com.hyg.pojo.Inventory;
import com.hyg.service.InventoryServiceI;

@Controller
@RequestMapping("/inventory")
public class InventoryController extends BaseController {
	@Resource(name="inventoryServiceImpl")
	private InventoryServiceI inventoryService;
	@RequestMapping("/list")
	private String inventoryList(){
		
		return "inventory_list";
	}
	
	@RequestMapping("/query")
	@ResponseBody
	private Grid queryInventory(HttpServletRequest request){
		Grid grid = new Grid();
		String page = request.getParameter("page");
		String pageSize = request.getParameter("rows");
		String itemNo = request.getParameter("itemNo");
		String itemName = request.getParameter("itemName");
		String stockId = request.getParameter("stockId");
		
		Map param = new HashMap();
		if (StringUtils.isNotEmpty(itemNo)) {
			param.put("itemNo", "%" + itemNo + "%");
		}
		if (StringUtils.isNotEmpty(itemName)) {
			param.put("itemName", "%" + itemName + "%");
		}
		if (StringUtils.isNotEmpty(stockId)) {
			param.put("stockId",  stockId );
		}
		
		PageHelper.startPage(Integer.parseInt(page),Integer.parseInt(pageSize));
		PageHelper.orderBy("stockId");
		
		List<Map> result = this.inventoryService.findByWhere(param);
		Long total = this.inventoryService.findCountByWhere(param);
		
		grid.setRows(result);
		grid.setTotal(total);
		return grid;
	}
	
	@RequestMapping("/search/{stockId}")
	@ResponseBody
	public Grid searchGoods(HttpServletRequest request,@PathVariable("stockId") String stockId){
		Grid grid = new Grid();
		String q = request.getParameter("q");
		List<Map> results = this.inventoryService.findByAjax(stockId,q);
		grid.setRows(results);
		return grid;
	}
	
}
