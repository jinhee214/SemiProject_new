package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Vector;

import data.dto.UserDto;
import data.dto.UserDto;
import mysql.db.DbConnect;

public class UserDao {
	
	DbConnect db=new DbConnect();
	
	///회원가입관련/////////////////////////////////////////////////////////////////
	//아이디 중복 체크_boolean(String id)
	public boolean isIdCheck(String user_id)
	{
		boolean isid=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select*from user where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, user_id);
			
			//싱행
			rs=pstmt.executeQuery();
			
			if(rs.next()) //해당아이디 존재할경우 true
				isid=true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isid;
		
	}
	//아이디에 따른 회원정보 전체 조회(String id)
	public String getName(String user_id)
	{
		
		String name="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select*from user where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, user_id);
			
			//싱행
			rs=pstmt.executeQuery();
			
			if(rs.next()) //해당아이디 존재할경우 true
				name=rs.getString("user_name");
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			db.dbClose(rs, pstmt, conn);
		}

		return name;
	}
	
	//insert메서드
	public void insertMember(UserDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into user (user_name,user_id,user_pw,user_hp,user_addr,user_point,user_joinday) values (?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getUser_name());
			pstmt.setString(2, dto.getUser_id());
			pstmt.setString(3, dto.getUser_pw());
			pstmt.setString(4, dto.getUser_hp());
			pstmt.setString(5, dto.getUser_addr());
			pstmt.setInt(6, dto.getUser_point());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
			
		
	}
	
	///로그인관련/////////////////////////////////////////////////////////////////
	//로그인할떄 아이디 비번 체크
			
	public boolean isIdPass(String user_id,String user_pw)
	{
		boolean b=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
				
		String sql="select * from user where user_id=? and user_pw=?";
				
		try {
			pstmt=conn.prepareStatement(sql);
					
			//바인딩
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			
			//실행
			rs=pstmt.executeQuery();
			
			if(rs.next())
				{
					b=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
				
				
				
			return b;
		}

	//(삭제나 수정할때)비밀번호 체크 -> id에 맞는 비번인지를 확인
	public boolean isPassEqual(String user_id,String user_pw)
	{
		boolean b=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from user where useR_id=? and user_pw=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				b=true;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return b;
	}
	

	
	///수정,삭제관련/////////////////////////////////////////////////////////////////
	//id에 맞는 dto 반환
	public UserDto getUser(String user_id)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		UserDto dto=new UserDto();
		
		String sql="select * from user where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pw(rs.getString("user_pw"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_hp(rs.getString("user_hp"));
				dto.setUser_addr(rs.getString("user_addr"));
				dto.setUser_joinday(rs.getTimestamp("user_joinday"));
				dto.setIs_admin(rs.getString("is_admin"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		
		return dto;
	}
	
	//수정하는 메서드 // 아이디 매칭되는 거로 비번, 전화번호, 이름, 주소 변경
	public void updateUser(UserDto dto)
	{

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		//이름,핸드폰,주소,이메일
		String sql="update user set user_name=?,user_pw=?,user_hp=?,user_addr=? where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getUser_name());
			pstmt.setString(2, dto.getUser_pw());
			pstmt.setString(3, dto.getUser_hp());
			pstmt.setString(4, dto.getUser_addr());
			pstmt.setString(5, dto.getUser_id());
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
		
	}
	
	//admin의 삭제 or 회원탈퇴 (id로 조회)
	public void deleteUser(String user_id)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from user where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, user_id);
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	


}
	
	
			