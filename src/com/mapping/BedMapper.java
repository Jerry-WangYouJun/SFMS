package com.mapping;

import java.util.List;

import com.core.Bed;

public interface BedMapper {
    List<Bed> findAllBed();
    int insertBed(Bed bed);
	List<Bed> queryBedsByWhere(Bed bed);
	int updateBed(Bed bed);
	int deleteBed(Bed bed);
}