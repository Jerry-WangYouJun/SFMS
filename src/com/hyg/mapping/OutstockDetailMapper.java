package com.hyg.mapping;

import java.util.List;

import com.hyg.pojo.OutstockDetail;

public interface OutstockDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OutstockDetail record);

    int insertSelective(OutstockDetail record);

    OutstockDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OutstockDetail record);

    int updateByPrimaryKey(OutstockDetail record);

	List<OutstockDetail> selectByOutstockId(String outstockId);
}