package admin;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;

public class MemberMgr {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@oracle.huohuohuo.cafe24.com:1521:orcl";
	String user = "huohuohuo";
	String password = "mju12345";
	
	
	public MemberMgr() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//회원 목록 출력
	public Vector getMemberList() {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM 회원";
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberBean mb = new MemberBean();
				mb.setID(rs.getString("id"));
				mb.setPassword(rs.getString("password"));
				mb.setName(rs.getString("이름"));
				mb.setSsn(rs.getString("주민번호"));
				mb.setBlackList(rs.getString("블랙리스트"));
				vecList.add(mb);
			}
			
			
				
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(rs != null) try {rs.close();} catch(Exception e) {}
		}
		return vecList;
	}
	
	//회원 추가
	public boolean memberInsert(MemberBean mb){
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO 회원 VALUES(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, mb.getID());
			pstmt.setString(2, mb.getPassword());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getSsn());
			pstmt.setString(5, mb.getBlackList());

			int count = pstmt.executeUpdate();
			if(count > 0){
				flag = true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
		}
		return flag;
		
	}
	//회원 추가
	public boolean memberDelete(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "DELETE FROM 회원 WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			int count = pstmt.executeUpdate();
			if(count > 0){
				flag = true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
		}
		return flag;
		
	}
}
