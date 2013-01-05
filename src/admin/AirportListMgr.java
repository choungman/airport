package admin;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;


public class AirportListMgr {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@oracle.huohuohuo.cafe24.com:1521:orcl";
	String user = "huohuohuo";
	String password = "mju12345";
	
	
	public AirportListMgr() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//공항 목록 출력
	public Vector getAirportList() {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM 공항목록";
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				AirportListBean alb = new AirportListBean();
				alb.setAirportName(rs.getString("공항명"));
				alb.setNation(rs.getString("국가"));
				vecList.add(alb);
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
	

}
