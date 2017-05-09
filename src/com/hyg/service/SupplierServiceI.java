package com.hyg.service;

import java.util.List;

import com.hyg.core.model.Grid;
import com.hyg.pojo.Supplier;

public interface SupplierServiceI {

	List<Supplier> findSupplierDicMaps();

	Grid findSupplierList(Supplier supplier);

	Integer addSupplier(Supplier supplier);

}
