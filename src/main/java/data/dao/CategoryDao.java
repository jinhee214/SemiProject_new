package data.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import mysql.db.DbConnect;

public class CategoryDao {
	
	DbConnect db = new DbConnect();
	
	//id·Î category name return ÇÏ±â
	public String getNameById(int id) {
		
		String name = "";
	
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select category_name from category where category_id="+id;
		
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				name = rs.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return name;
	}

}
