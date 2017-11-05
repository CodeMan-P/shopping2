package com.service;

import com.bean.User;
import com.dao.UserDao;

public class UserService {

	public static boolean isExist(User user){
		return UserDao.isExist(user);
	}
	public static boolean addUser(User user){
		return UserDao.addUser(user);
	}
}
