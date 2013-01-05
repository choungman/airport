package admin;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;


public class ReserveMgr {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@oracle.huohuohuo.cafe24.com:1521:orcl";
	String user = "huohuohuo";
	String password = "mju12345";
	
	
	public ReserveMgr() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//예약 목록 출력
	public Vector getReserveList() {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM 예약";
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReserveBean rb = new ReserveBean();
				rb.setCustomerNumber(rs.getInt("고객번호"));
				rb.setId(rs.getString("id"));
				rb.setScheduleNumber(rs.getInt("스케쥴번호"));
				rb.setDepartureDate(rs.getString("출발일시"));
				rb.setGateNumber(rs.getInt("게이트번호"));
				rb.setFee(rs.getInt("요금"));
				rb.setDepartureAirport(rs.getString("출발공항"));
				rb.setArriveAirport(rs.getString("도착공항"));
				rb.setCustomerName(rs.getString("고객이름"));
				rb.setAirplaneName(rs.getString("항공기이름"));
				rb.setSeatingNumber(rs.getString("좌석번호"));
				rb.setSeatingGrade(rs.getString("좌석등급"));
				vecList.add(rb);
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
	

	//예약 추가
	public boolean reserveInsert(ReserveBean rb){
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO 예약 VALUES(?,?,?,TO_DATE(?,'YYYY-MM-DD HH24:MI'),?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, rb.getCustomerNumber());
			pstmt.setString(2, rb.getId());
			pstmt.setInt(3, rb.getScheduleNumber());
			pstmt.setString(4, rb.getDepartureDate());
			pstmt.setInt(5, rb.getGateNumber());
			pstmt.setInt(6, rb.getFee());
			pstmt.setString(7, rb.getDepartureAirport());
			pstmt.setString(8, rb.getArriveAirport());
			pstmt.setString(9, rb.getCustomerName());
			pstmt.setString(10, rb.getAirplaneName());
			pstmt.setString(11, rb.getSeatingNumber());
			pstmt.setString(12, rb.getSeatingGrade());
			
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
