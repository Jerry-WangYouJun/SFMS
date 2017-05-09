package com.hyg.service;

import java.util.List;
import java.util.Map;

import com.hyg.pojo.InstockDetail;
import com.hyg.pojo.Inventory;
import com.hyg.pojo.OutstockDetail;

public interface InventoryServiceI {

	public void saveOrUpdate(String stockid, InstockDetail temp);

	public List<Map> findByWhere(Map param);

	public Long findCountByWhere(Map param);

	public void updateOutstock(String stockid, OutstockDetail temp);

	public List<Map> findByAjax(String stockId,String q);

}
