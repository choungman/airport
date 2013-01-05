package admin;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;


public class ScheduleMgr {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@oracle.huohuohuo.cafe24.com:1521:orcl";
	String user = "huohuohuo";
	String password = "mju12345";
	
	
	public ScheduleMgr() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//스케쥴 목록 출력
	public Vector getScheduleList() {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM 스케쥴";
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ScheduleBean sb = new ScheduleBean();
				sb.setScheduleNumber(rs.getInt("스케쥴번호"));
				sb.setGateNumber(rs.getInt("게이트번호"));
				sb.setDepartureAirport(rs.getString("출발공항"));
				sb.setDepartureDate(rs.getString("출발일시"));
				sb.setArriveAirport(rs.getString("도착공항"));
				sb.setArriveDate(rs.getString("도착일시"));
				sb.setAirplaneNumber(rs.getInt("항공기번호"));
				vecList.add(sb);
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
	
	//스케쥴 추가
		public boolean scheduleInsert(ScheduleBean sb){
			Connection conn = null;
			PreparedStatement pstmt = null;
			boolean flag = false;
			
			try {
				conn = DriverManager.getConnection(url, user, password);
				String sql = "INSERT INTO 스케쥴 VALUES(?,?,?,TO_DATE(?,'YYYY-MM-DD HH24:MI'),?,TO_DATE(?,'YYYY-MM-DD HH24:MI'),?)";
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, sb.getScheduleNumber());
				pstmt.setInt(2, sb.getGateNumber());
				pstmt.setString(3, sb.getDepartureAirport());
				pstmt.setString(4, sb.getDepartureDate());
				pstmt.setString(5, sb.getArriveAirport());
				pstmt.setString(6, sb.getArriveDate());
				pstmt.setInt(7, sb.getAirplaneNumber());
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
