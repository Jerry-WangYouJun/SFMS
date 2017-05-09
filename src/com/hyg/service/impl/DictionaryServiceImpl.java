package com.hyg.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.hyg.core.model.Grid;
import com.hyg.mapping.DictionaryMapper;
import com.hyg.pojo.Dictionary;
import com.hyg.service.DictionaryServiceI;
@Service
public class DictionaryServiceImpl implements DictionaryServiceI {
	@Resource
	private DictionaryMapper dictionaryDao;
	@Autowired
	private HttpServletRequest request;
	@Override
	public List<Dictionary> findDicMaps(String dicNo) {
		List<Dictionary> results = this.dictionaryDao.selectDicsByDicNo(dicNo);
		return results;
	}
	@Override
	public Grid findDicList(Dictionary dictionary) {
		String pageIndex = request.getParameter("page");
		String rowsIndex = request.getParameter("rows");
		PageHelper.startPage(Integer.parseInt(pageIndex), Integer.parseInt(rowsIndex));
		Grid grid = new Grid();
		List<Dictionary> results = this.dictionaryDao.selectDicsBywhere(dictionary);
		Long total = this.dictionaryDao.selectDicsCountBywhere(dictionary);
		grid.setRows(results);
		grid.setTotal(total);
//		List<Dictionary> d = test();
		return grid;
	}

	@Override
	public Integer addDic(Dictionary dictionary) {
		return this.dictionaryDao.insert(dictionary);
	}
	
}
