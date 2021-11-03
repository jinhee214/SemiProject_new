package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.OrderDto;
import mysql.db.DbConnect;

public class orderDao {
	
	DbConnect db=new DbConnect();
	
	public OrderDto getOder(String order_id)
	{
		OrderDto dto=new OrderDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from orders where order_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, order_id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
			dto.setOrder_id(rs.getInt("order_id"));
			dto.setUser_id(rs.getString("user_id"));
			dto.setOrder_date(rs.getTimestamp("order_date"));
			dto.setOrder_addr(rs.getString("order_addr"));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}				
		return dto;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
