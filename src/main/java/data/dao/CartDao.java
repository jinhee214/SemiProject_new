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

	DbConnect db = new DbConnect();

	// 장바구니에 담기
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

	// 장바구니 제품 목록 보여주기. (페이징 처리 안 함)
	public List<CartDto> readCart() {

		List<CartDto> list = new Vector<CartDto>();

		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;

		String sql = "select * from cart order by cart_id";

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

	// 장바구니에서 제품 삭제
	public void deleteCart(String idx) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from cart where product_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// 장바구니 제품의 수량 수정
	public void updateCart(int product_id, int cnt) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update cart set cnt=? where product_id=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cnt);
			pstmt.setInt(2, product_id);

			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
