package admin;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;


public class AirplaneMgr {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@oracle.huohuohuo.cafe24.com:1521:orcl";
	String user = "huohuohuo";
	String password = "mju12345";
	
	
	public AirplaneMgr() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//항공기 목록 출력
	public Vector getAirplaneList() {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM 항공기";
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				AirplaneBean apb = new AirplaneBean();
				apb.setAirplaneNumber(rs.getInt("항공기번호"));
				apb.setAirplaneName(rs.getString("항공기이름"));
				apb.setAirline(rs.getString("항공사"));
				apb.setSeating(rs.getInt("좌석수"));
				vecList.add(apb);
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
	
	//항공기 추가
	public boolean airplaneInsert(AirplaneBean apb){
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO 항공기 VALUES(?,?,?,?)";
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, apb.getAirplaneNumber());
			pstmt.setString(2, apb.getAirplaneName());
			pstmt.setString(3, apb.getAirline());
			pstmt.setInt(4, apb.getSeating());
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
