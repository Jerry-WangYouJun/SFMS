package com.hyg.service;

import java.util.List;

import com.hyg.core.model.Grid;
import com.hyg.pojo.Dictionary;

public interface DictionaryServiceI {
	public List<Dictionary> findDicMaps(String dicNo);

	public Grid findDicList(Dictionary dictionary);

	public Integer addDic(Dictionary dictionary);
}
