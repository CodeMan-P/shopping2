/**
 * 
 */
package com.dao;

import java.sql.Connection;
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

	public static LinkedList<Products> getList(){
		LinkedList<Products> list = new LinkedList<Products>();
		String sql = "SELECT * FROM products;";
		if (conn == null) {
			conn = DbConn.getCon();
		}
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
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
