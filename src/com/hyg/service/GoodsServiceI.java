package com.hyg.service;

import java.util.List;

import com.hyg.core.model.Grid;
import com.hyg.pojo.Goods;

public interface GoodsServiceI {

	public List<Goods> findByAjax(String q);

	public Grid findGoodsList(Goods goods);

	public Integer addGoods(Goods goods);

}
