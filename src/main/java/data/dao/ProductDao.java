package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import mysql.db.DbConnect;

public class ProductDao {
	
	DbConnect db=new DbConnect();
	
		//totalcount
		public int getTotalCount()
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select count(*) from product";
			int n=0;
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next())
				n=rs.getInt(1);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			
			return n;
		}
		
		//페이지에서 필요한 만큼만 리턴하기(전체출력)
		public List<data.dto.ProductDto> getAllMembers()
		{
			List<data.dto.ProductDto> list=new Vector<data.dto.ProductDto>();
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select * from product order by product_id";

			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next())
				{
					data.dto.ProductDto dto=new data.dto.ProductDto();
					dto.setProduct_id(rs.getInt("product_id"));
					dto.setCategory_id(rs.getInt("category_id"));
					dto.setProduct_name(rs.getString("product_name"));
					dto.setProduct_price(rs.getInt("product_price"));
					dto.setMain_img(rs.getString("main_img"));
					dto.setDetail_img(rs.getString("detail_img"));

					list.add(dto);				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}				

			return list;
		}		
			
		// product_id로 제품사진 가져오기
		public String getProductPhoto(int product_id) {
			String main_img = "";

			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select main_img from product where product_id=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, product_id);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					main_img = rs.getString("main_img");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			return main_img;
		}
		
		// product_id로 디테일 제품사진 가져오기
				public String getProductDetailPhoto(int product_id) {
					String detail_img = "";

					Connection conn = db.getConnection();
					PreparedStatement pstmt = null;
					ResultSet rs = null;

					String sql = "select detail_img from product where product_id=?";

					try {
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, product_id);
						rs = pstmt.executeQuery();

						if (rs.next()) {
							detail_img = rs.getString("detail_img");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						db.dbClose(rs, pstmt, conn);
					}
					return detail_img;
				}
		
		// product_id로 제품명 가져오기
		public String getProductName(int product_id) {
			String product_name = "";
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select product_name from product where product_id=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, product_id);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					product_name = rs.getString("product_name");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			return product_name;
		}

}
