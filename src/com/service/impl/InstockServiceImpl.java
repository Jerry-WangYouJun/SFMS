package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapping.InstockMapper;
import com.pojo.Instock;
import com.service.InstockServiceI;
import com.service.InventoryServiceI;
@Service
public class InstockServiceImpl implements InstockServiceI {
	@Resource
	private InstockMapper instockDao;
	
	
	@Resource(name="inventoryServiceImpl")
	private InventoryServiceI inventoryService;

	@Override
	public List<Map> findInstockInfo(Map map) {
		// TODO Auto-generated method stub
		List<Map> results = this.instockDao.selectInstockInfo(map);
		return results;
	}

	@Override
	public Long findInstockCount(Map results) {
		// TODO Auto-generated method stub
		Long total = this.instockDao.instockCountByMap(results);
		return total;
	}

	@Override
	public int insertInstock(Instock instock) {
		// TODO Auto-generated method stub
		instock.setInstockstate("00");
		int rows = this.instockDao.insert(instock);
		return rows;
	}

	@Override
	public Instock findInstockByPK(Integer id) {
		// TODO Auto-generated method stub
		Instock instock = this.instockDao.selectByPrimaryKey(id);
		return instock;
	}

	@Override
	public int updateInstock(Instock instock) {
		// TODO Auto-generated method stub
		int rows = this.instockDao.updateByPrimaryKeySelective(instock);
		return rows;
	}

	@Override
	public int deleteInstock(Integer id) {
		// TODO Auto-generated method stub
		 int rows = 0;
		
		//删除主单信息
		rows  = this.instockDao.deleteByPrimaryKey(id);
		
		return rows;
	}
	
}
