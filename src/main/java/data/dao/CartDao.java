package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import data.dto.CartDto;
import mysql.db.DbConnect;

public class CartDao {
//(�Ƹ� �޸�) 11/04 15:05
	DbConnect db = new DbConnect();
	
	// ��ٱ��� ���� �� ����ھ��̵�&��ǰ&��ǰ����&���������� ���� ��ǰ�� ��ٱ��Ͽ� �̹� �ִ��� Ȯ��
	public boolean checkCart(CartDto dto) {
		
		boolean b =false;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from cart where user_id=? and product_id=? and color=? and insurance=?";

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setInt(2, dto.getProduct_id());
			pstmt.setString(3, dto.getColor());
			pstmt.setString(4, dto.getInsurance());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				b = true;
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return b;
	}

	// ��ٱ��Ͽ� ���1 - ����ھ��̵�&��ǰ&��ǰ����&���������� ���� ��ǰ�� ��ٱ��Ͽ� �̹� ���� ��� ������ +1
	public void updateCntCart(CartDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update cart set cnt=cnt+1 where user_id=? and product_id=? and color=? and insurance=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setInt(2, dto.getProduct_id());
			pstmt.setString(3, dto.getColor());
			pstmt.setString(4, dto.getInsurance());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// ��ٱ��Ͽ� ���2 - ������ ��ٱ��Ͽ� ���� ��ǰ�� ���� �� cart db�� insert
	public void insertCart(CartDto dto) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into cart(product_id, user_id, price, cnt, color, insurance) values(?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getProduct_id());
			pstmt.setString(2, dto.getUser_id());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setInt(4, dto.getCnt());
			pstmt.setString(5, dto.getColor());
			pstmt.setString(6, dto.getInsurance());

			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// ��ٱ��� ��ǰ ��� �����ֱ�. (����¡ ó�� �� ��)
	public List<CartDto> readCart(String user_id) {

		List<CartDto> list = new Vector<CartDto>();

		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;

		String sql = "select * from cart where user_id = '" + user_id + "'";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				CartDto dto = new CartDto();

				dto.setProduct_id(rs.getInt("product_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPrice(rs.getInt("price"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setColor(rs.getString("color"));
				dto.setInsurance(rs.getString("insurance"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		return list;
	}

	// ��ٱ��Ͽ��� ��ǰ ����
	public void deleteCart(String user_id, int product_id, String color, String insurance) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from cart where user_id=? and product_id=? and color=? and insurance=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, product_id);
			pstmt.setString(3, color);
			pstmt.setString(4, insurance);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// ��ٱ��� ��ǰ�� ���� ����
	public void updateCart(int cnt, String user_id, int product_id, String color, String insurance) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update cart set cnt=? where user_id=? and product_id=? and color=? and insurance=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cnt);
			pstmt.setString(2, user_id);
			pstmt.setInt(3, product_id);
			pstmt.setString(4, color);
			pstmt.setString(5, insurance);

			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// ��ٱ��� ��ǰ �Ѿ� ���ϱ�
	public int totalCart() {
		int total = 0;
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;

		String sql = "select sum(price*cnt) from cart";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next())
				total = rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		return total;
	}

	// ������ �� ��ٱ��� ����
	public void resetCart(String user_id) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from cart where user_id=?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
