package com.hyg.mapping;

import java.util.List;

import com.hyg.pojo.Stock;

public interface StockMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Stock record);

    int insertSelective(Stock record);

    Stock selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Stock record);

    int updateByPrimaryKey(Stock record);

	List<Stock> selectAll();
	
	List<Stock>  selectByWhere(Stock stock);

	Long selectCountByWhere(Stock stock);
    
}