package com.hyg.service;

import java.util.List;

import com.hyg.pojo.InstockDetail;

public interface InstockDetailServiceI {

	int deleteDetailsByInstockId(Integer instockId);

	int saveOrUpdate(InstockDetail detail);

	List<InstockDetail> searchDetailsByInstockId(String instockId);

	int deleteDetailByPK(String id);

}
