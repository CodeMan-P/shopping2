package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLXML;

import com.bean.User;

import java.sql.Connection;

import com.util.DbConn;

public class UserDao {

	static Connection conn = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;

	public static boolean isExist(User user) {
		String name, pwd;
		String sql = "select * from users where name = ? and pwd = ?";
		name = user.getName();
		pwd = user.getPwd();
		if (conn == null) {
			conn = DbConn.getCon();
		}
		try {
			pst = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			pst.setString(1, name);
			pst.setString(2, pwd);
			rs = pst.executeQuery();

			if (rs.isBeforeFirst()) {
				getUserInfo(user);
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static synchronized void getUserInfo(User user) {
		try {
			String val, val2;
			if (rs.next()) {
				val = rs.getString("cardNum");
				if (val != null) {
					user.setCardNum(Integer.parseInt(val));
				}
				val2 = rs.getString("money");
				if (val2 != null) {
					user.setMoney(Double.parseDouble(val2));
				}
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
