package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.MemberDto;
import dto.ProductDto;
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
		public List<ProductDto> getAllMembers()
		{
			List<ProductDto> list=new Vector<ProductDto>();
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select * from product order by product_id";

			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next())
				{
					ProductDto dto=new ProductDto();
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

}
