/**
 * 
 */
package com.dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import com.bean.Products;
import com.util.DbConn;

/**
 * @author Administrator
 *
 */
public class ProductDao {
	static Connection conn = null;
	static Statement st = null;
	static ResultSet rs = null;
	static PreparedStatement pst = null;

	public static boolean editPro(Products p) {
		if (conn == null) {
			conn = DbConn.getCon();
		}
		String sql = "update products set pname=?,price=?,sum=?,img=? where pid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, p.getPname());
			pst.setDouble(2, p.getPrice());
			pst.setInt(3, p.getSum());
			pst.setString(4, p.getImg());
			pst.setInt(5, p.getPid());
			int result = pst.executeUpdate();
			if (result > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public static boolean delePro(int deleId) {
		String sql = "delete from products where pid = ?";
		if (conn == null) {
			conn = DbConn.getCon();
		}
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, deleId);
			int result = pst.executeUpdate();
			if (result > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public static boolean addPro(Products p) {
		// insert into products column(pname,price,sum,img)
		// values("asasas啊是",123,123123,"asdas");
		String sql = "insert into products(pname,price,sum,img) values(?,?,?,?)";
		try {
			if (conn == null) {
				conn = DbConn.getCon();
			}
			pst = conn.prepareStatement(sql);
			pst.setString(1, p.getPname());
			pst.setDouble(2, p.getPrice());
			pst.setInt(3, p.getSum());

			pst.setString(4, p.getImg());

			int result = pst.executeUpdate();
			if (result > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public static LinkedList<Products> getList() {
		LinkedList<Products> list = new LinkedList<Products>();
		String sql = "SELECT * FROM products;";
		if (conn == null) {
			conn = DbConn.getCon();
		}
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Products p = new Products();
				p.setPid(rs.getInt("pid"));
				p.setPname(rs.getString("pname"));
				p.setPrice(rs.getDouble("price"));
				p.setSum(rs.getInt("sum"));
				p.setImg(rs.getString("img"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
