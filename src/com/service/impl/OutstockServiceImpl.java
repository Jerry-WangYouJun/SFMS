package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapping.OutstockMapper;
import com.pojo.Outstock;
import com.pojo.OutstockDetail;
import com.service.InventoryServiceI;
import com.service.OutstockServiceI;
@Service
public class OutstockServiceImpl implements OutstockServiceI {
	@Resource
	private OutstockMapper outstockDao;
	
	@Resource(name="inventoryServiceImpl")
	private InventoryServiceI inventoryService;

	@Override
	public List<Map> findOutstockInfo(Map map) {
		// TODO Auto-generated method stub
		List<Map> results = this.outstockDao.selectOutstockInfo(map);
		return results;
	}

	@Override
	public Long findOutstockCount(Map results) {
		// TODO Auto-generated method stub
		Long total = this.outstockDao.outstockCountByMap(results);
		return total;
	}

	@Override
	public int insertOutstock(Outstock outstock) {
		// TODO Auto-generated method stub
		outstock.setOutstockstate("00");
		int rows = this.outstockDao.insert(outstock);
		return rows;
	}

	@Override
	public Outstock findOutstockByPK(Integer id) {
		// TODO Auto-generated method stub
		Outstock outstock = this.outstockDao.selectByPrimaryKey(id);
		return outstock;
	}

	@Override
	public int updateOutstock(Outstock outstock) {
		// TODO Auto-generated method stub
		int rows = this.outstockDao.updateByPrimaryKeySelective(outstock);
		return rows;
	}

	@Override
	public int deleteOutstock(Integer id) {
		// TODO Auto-generated method stub
		 int rows = 0;
		//删除主单信息
		rows  = this.outstockDao.deleteByPrimaryKey(id);
		return rows;
	}

}
