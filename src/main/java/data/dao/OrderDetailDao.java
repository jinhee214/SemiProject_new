package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import data.dto.BoardDto;
import data.dto.orders_detailDto;
import mysql.db.DbConnect;

public class OrderDetailDao {

	DbConnect db = new DbConnect();
	
	//주문 세부사항 등록
		public void insertOrderDetail(orders_detailDto dto) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;

			String sql = "insert into orders_detail values(null,?,?,?,?,?,?)";

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, dto.getOrder_id());
				pstmt.setInt(2, dto.getProduct_id());
				pstmt.setInt(3, dto.getPrice());
				pstmt.setInt(4, dto.getCnt());
				pstmt.setString(5, dto.getColor());
				pstmt.setString(6, dto.getInsurance());


				pstmt.execute();			

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}		
		}
		
		//주문 보기
		public orders_detailDto getOneOrder(int orderId) {
			orders_detailDto dto = new orders_detailDto();

			Connection conn = db.getConnection();
			Statement stmt = null;
			ResultSet rs = null;

			String sql = "select * from orders_detail where order_id="+orderId;

			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);

				if(rs.next()) {

					dto.setProduct_id(rs.getInt("product_id"));
					dto.setPrice(rs.getInt("price"));
					dto.setCnt(rs.getInt("cnt"));
					dto.setColor(rs.getString("color"));
					dto.setInsurance(rs.getString("insurance"));


				}


			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			return dto;
		}

}
