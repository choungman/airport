package model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;

import beans.BoardBean;

public class BoardDAO {
	private DBConnect dbconn;
	DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BoardDAO() {
		dbconn = new DBConnect();
	}
	
	public int getCountBoardList(String boardName){
		int count = 0;
		
		try {
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select count(*) from " + boardName);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(rs != null) try {rs.close();} catch(Exception e) {}
		}
		return count;
	}
	//자유게시판 글 불러오기
	public List<BoardBean> getBoardList(String boardName, int page) {
		List<BoardBean> list = new ArrayList<BoardBean>();
		
		int page_list = (page * 10) - 10;
		
		try {
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select * from (select " + boardName +".*, rownum as NO from " + boardName + ") where NO between " + page_list + " and 10 order by num desc");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean boardbean = new BoardBean();
				boardbean.setIndex(rs.getInt("num"));
				boardbean.setTitle(rs.getString("title"));
				boardbean.setWriter(rs.getString("writer"));
				boardbean.setContents(rs.getString("content"));
				boardbean.setDate(rs.getString("in_date"));
				boardbean.setClickCount(rs.getInt("click_count"));	
				
				list.add(boardbean);
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(rs != null) try {rs.close();} catch(Exception e) {}
		}
		
		return list;
	}
	public BoardBean getBoardContents(String boardName, int index) {
		BoardBean bean = new BoardBean();
		
		try {
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select * from " + boardName + " where num = ?");
			pstmt.setInt(1, index);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean.setIndex(rs.getInt("num"));
				bean.setTitle(rs.getString("title"));
				bean.setWriter(rs.getString("writer"));
				bean.setContents(rs.getString("content"));
				bean.setDate(rs.getString("in_date"));
				bean.setClickCount(rs.getInt("click_count"));	
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(rs != null) try {rs.close();} catch(Exception e) {}
		}
		
		return bean;
	}
	//조회수 증가
	public void increaseClickCount(String boardName, int index) {
		try {
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("update " + boardName + " set click_count=click_count+1 where num=" + index);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(rs != null) try {rs.close();} catch(Exception e) {}
		}
	}
	public void writeBoard(String boardName, BoardBean bean) {
		try {
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("insert into " + boardName + "(num, title, PASSWORD, writer, content, in_date, click_count) values(NOTICEBOARD_SEQ.NEXTVAL, ?, ?, ?, ?, TO_DATE(?, 'yyyy-mm-dd hh24:mi:ss'), 0)");
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getWriter());
			pstmt.setString(4, bean.getContents());
			pstmt.setString(5, bean.getDate());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(rs != null) try {rs.close();} catch(Exception e) {}
		}
	}
	public boolean checkPassword(String boardName, int index, String password) {
		boolean check = false;

		try {
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select password from " + boardName + " where num=" + index);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("password").equals(password)){
					check = true;
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(rs != null) try {rs.close();} catch(Exception e) {}
		}
		
		return check;
	}
	public void modifyBoard(String boardName, int index, BoardBean bean) {
		try {
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("update " + boardName + " set title=?, writer=?, content=? where num=" + index);

			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getContents());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(rs != null) try {rs.close();} catch(Exception e) {}
		}
	}
	public void deleteBoard(String boardName, int index) {
		try {
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("delete from " + boardName + " where num=" + index);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(rs != null) try {rs.close();} catch(Exception e) {}
		}
	}
}
