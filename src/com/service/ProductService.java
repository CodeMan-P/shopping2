package com.service;

import java.util.LinkedList;

import com.bean.Products;
import com.dao.ProductDao;

public class ProductService {

	public static LinkedList<Products> getList(){
		return ProductDao.getList();
	}
}
