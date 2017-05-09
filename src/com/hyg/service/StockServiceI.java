package com.hyg.service;

import java.util.List;

import com.hyg.core.model.Grid;
import com.hyg.pojo.Stock;

public interface StockServiceI {

	List<Stock> findStockDicMaps();

	Grid findStockList(Stock stock);

	Integer insertStock(Stock stock);

	Integer deleteStock(int  id);


}
