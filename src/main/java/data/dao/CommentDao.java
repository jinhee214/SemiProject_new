package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import data.dto.CommentDto;
import mysql.db.DbConnect;

public class CommentDao {

	DbConnect db = new DbConnect();
	
	//¥Ò±€ ≥÷±‚
	public void insertComment(CommentDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into comment values(null,?,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getBoardId());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getContent());
			

			pstmt.execute();			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}		
	}
	
	//∞‘Ω√±€ø° ¥ﬁ∏∞ ¥Ò±€∏∏ ªÃ±‚
	public List<CommentDto> getCommentsByBoardId(int boardId){
		List<CommentDto> list = new Vector<CommentDto>();
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from comment where board_id="+boardId+" order by comment_id desc";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				CommentDto dto = new CommentDto();
				dto.setCommentId(rs.getInt("comment_id"));
				dto.setBoardId(rs.getInt("board_id"));
				dto.setUserId(rs.getString("user_id"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
				
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}		
		
		return list;		
	}
	
	//¥Ò±€ ªË¡¶
	public void deleteComment(String commentId) {
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		
		String sql = "delete from comment where comment_id="+commentId;
		
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
		
	}
	
}
