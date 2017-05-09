package com.hyg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.hyg.core.DateUtils;
import com.hyg.core.model.Grid;
import com.hyg.pojo.Instock;
import com.hyg.pojo.Stock;
import com.hyg.pojo.Supplier;
import com.hyg.service.InstockServiceI;
import com.hyg.service.InventoryServiceI;

@Controller
@RequestMapping("/instock")
public class InstockController extends BaseController {
	@Resource(name="instockServiceImpl")
	private InstockServiceI instockService;
	
	@RequestMapping("/list")
	public String instockList(){
		
		return "instock_list";
	}
	@ResponseBody
	@RequestMapping("/query")
	public Grid queryInstock(HttpServletRequest request,Model model){
		String page = request.getParameter("page");
		String pageSize = request.getParameter("rows");
		String instockNo = request.getParameter("instockNo");
		String stockId = request.getParameter("stockId");
		String supplierId = request.getParameter("supplierId");
		String instockState = request.getParameter("instockState");
		String instockDateStart = request.getParameter("instockDateStart");
		String instockDateEnd = request.getParameter("instockDateEnd");
		
		Map map = new HashMap();
		map.put("instockNo", instockNo);
		map.put("stockId", stockId);
		map.put("supplierId", supplierId);
		map.put("instockState", instockState);
		map.put("instockDateStart", instockDateStart);
		map.put("instockDateEnd", instockDateEnd);
		
		//分页插件
		PageHelper.startPage(Integer.parseInt(page), Integer.parseInt(pageSize));
		PageHelper.orderBy("instockNo desc");

		Grid grid = new Grid();
		List<Map> results  = this.instockService.findInstockInfo(map);
		
		Long rows = this.instockService.findInstockCount(map);
		
		grid.setRows(results);
		grid.setTotal(rows);
		return grid;
	}
	@RequestMapping("/save_input")
	public ModelAndView saveInput(){
		ModelAndView modelAndView = new ModelAndView();
		Instock  instock = new Instock();
		instock.setInstockno("RK"+ DateUtils.getDate14());
		
		//仓库下拉框
		
		List<Stock> stocks = this.getStockSelects();
		//供应商下拉框
		List<Supplier> suppliers = this.getSupplierSelects();
		
		
		modelAndView.addObject("instock",instock);
		modelAndView.addObject("stocks",stocks);
		modelAndView.addObject("suppliers",suppliers);
		modelAndView.setViewName("/instock_input");
		return modelAndView;
	}
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseBody
	public Map saveInstock(Instock instock){
		Map map = new HashMap();
		int rows = this.instockService.insertInstock(instock);
		if (rows > 0) {
			map.put("success", true);
			map.put("msg", "保存入库单信息成功!");
		}else{
			map.put("success", false);
			map.put("msg", "保存入库单信息失败!");
		}
		return map;
	}
	@RequestMapping(value="/save_input/{id}",method=RequestMethod.GET)
	public String updateInput(@PathVariable("id") Integer id,Map map){
		Instock instock = this.instockService.findInstockByPK(id);
		
		//仓库下拉框
		
		List<Stock> stocks = this.getStockSelects();
		//供应商下拉框
		List<Supplier> suppliers = this.getSupplierSelects();
		map.put("instock", instock);
		map.put("stocks",stocks);
		map.put("suppliers", suppliers);
		return "instock_input";
	}
	@RequestMapping(value="/save" ,method=RequestMethod.PUT)
	@ResponseBody
	public Map upateInstock(Instock instock){
		Map map = new HashMap();
		int rows = this.instockService.updateInstock(instock);
		if (rows > 0) {
			map.put("success", true);
			map.put("msg", "修改入库单信息成功!");
		}else{
			map.put("success", false);
			map.put("msg", "修改入库单信息失败!");
		}
		return map;
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public Map deleteInstock(@PathVariable("id")Integer id){
		Map map = new HashMap();
		int rows = this.instockService.deleteInstock(id);
		if (rows > 0) {
			map.put("success", true);
			map.put("msg", "删除入库单信息成功!");
		}else{
			map.put("success", false);
			map.put("msg", "删除入库单信息失败!");
		}
		return map;
	}
	
	@RequestMapping(value="/hang/{id}")
	public ModelAndView hangMaterial(@PathVariable("id") Integer id){
		Map map = new HashMap();
		map.put("id", id);
		ModelAndView modelAndView = new ModelAndView();
		List<Map> results = this.instockService.findInstockInfo(map);
		if (results.size() > 0) {
			modelAndView.addObject("instock",results.get(0));
		}
		modelAndView.setViewName("instock_hang");
		return modelAndView;
	}
	
	@RequestMapping("/detail/{id}")
	public ModelAndView showDetails(@PathVariable("id") Integer id){
		Map map = new HashMap();
		map.put("id", id);
		ModelAndView modelAndView = new ModelAndView();
		List<Map> results = this.instockService.findInstockInfo(map);
		if (results.size() > 0) {
			modelAndView.addObject("instock",results.get(0));
		}
		modelAndView.setViewName("instock_detail");
		return modelAndView;
	}
	@RequestMapping("/confirm/{id}")
	@ResponseBody
	public Map confirmInstock(@PathVariable("id") Integer id){
		Map map = new HashMap();
		map = this.instockService.confirmInstock(id);
		
		return map;
	}
	
}
