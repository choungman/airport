package model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;

import beans.MemberBean;

public class MemberDAO {
	private DBConnect dbconn;
	DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
	}
	
	//로그인
	public MemberBean login(String id, String password) {
		MemberBean member = new MemberBean();
		
		try {
			dbconn = new DBConnect();
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select * from 회원 where ID=? and PASSWORD=?");
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member.setID(rs.getString("ID"));
				member.setName(rs.getString("이름"));
				member.setSsn(rs.getString("주민번호"));
				member.setBlackList(rs.getString("블랙리스트"));
			}
			else {
				return null;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(rs != null) try {rs.close();} catch(Exception e) {}
		}
		return member;
	}
	//회원 추가
	public void InsertMember(MemberBean memberbean) {				
		try {
			dbconn = new DBConnect();
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("insert into 회원(ID, PASSWORD, 이름, 주민번호) values(?, ? , ?, ?)");
			
			pstmt.setString(1, memberbean.getID());
			pstmt.setString(2, memberbean.getPassword());
			pstmt.setString(3, memberbean.getName());
			pstmt.setString(4, memberbean.getSsn());
			
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
