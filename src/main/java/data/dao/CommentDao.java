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
	
	//´ñ±Û ³Ö±â
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
	
	//°Ô½Ã±Û¿¡ ´Þ¸° ´ñ±Û¸¸ »Ì±â
	public List<CommentDto> getCommentsByBoardId(int boardId){
		List<CommentDto> list = new Vector<CommentDto>();
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select user_id, content, writeday from comment where board_id="+boardId+" order by comment_id";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				CommentDto dto = new CommentDto();
				
				dto.setUserId(rs.getString(1));
				dto.setContent(rs.getString(2));
				dto.setWriteday(rs.getTimestamp(3));
				
				list.add(dto);
				
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}		
		
		return list;		
	}
}
