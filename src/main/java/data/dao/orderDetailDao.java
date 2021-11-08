package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.orders_detailDto;
import mysql.db.DbConnect;

public class orderDetailDao {
	
	DbConnect db=new DbConnect();
	
	public void insertorderDeatil(orders_detailDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into orders_detail values(null,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getOrder_id());
			pstmt.setInt(2, dto.getProduct_id());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setInt(4, dto.getCnt());
			pstmt.setString(5, dto.getColor());
			pstmt.setString(6, dto.getInsurance());
			
			pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
