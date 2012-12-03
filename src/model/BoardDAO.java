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
			pstmt = conn.prepareStatement("select * from(select " + boardName + ".*, rownum as rnum from " + boardName + ") where rnum between " + page_list + " and 10 order by num desc");
			//pstmt = conn.prepareStatement("select * from " + boardName + " where number<="+ page_list +" order by number desc limit 10");
			
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
			
			String contents = bean.getContents().replace("\n", "<br/>");
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getWriter());
			pstmt.setString(4, contents);
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
}
