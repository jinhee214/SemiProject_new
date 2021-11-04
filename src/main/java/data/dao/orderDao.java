package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.OrderDto;
import mysql.db.DbConnect;

public class orderDao {
	
	DbConnect db=new DbConnect();
	
	//주문번호로 결제목록 가져오기
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
	
	//결제목록 추가
	public void insertOrder(OrderDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into orders values(null,?,now(),?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getOrder_addr());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
