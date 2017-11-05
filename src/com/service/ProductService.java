package com.service;

import java.util.LinkedList;

import com.bean.Products;
import com.dao.ProductDao;

public class ProductService {

	public static LinkedList<Products> getList(){
		return ProductDao.getList();
	}
	public static boolean addPro(Products p){
		return ProductDao.addPro(p);
		
	}
	public static boolean delePro(int deleId){
		return ProductDao.delePro(deleId);
		
	}
	public static boolean editPro(Products p){
		return ProductDao.editPro(p);
		
	}
}
