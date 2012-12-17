package model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;
import javax.sql.*;

import beans.CustomerBean;
import beans.MemberBean;
import beans.ReservationBean;
import beans.ScheduleBean;

public class ScheduleDAO {
	private DBConnect dbconn;
	DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ScheduleDAO() {
		dbconn = new DBConnect();
	}
	
	//비행기 목록
	public ArrayList<ScheduleBean> getAirplainList(String departure, String destination, String departureDate, int people) {
		ArrayList<ScheduleBean> list = new ArrayList<ScheduleBean>();
		ScheduleBean schedulebean = new ScheduleBean();
		
		try {
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("select * from 스케쥴 where 출발공항=? and 도착공항=? and TO_CHAR(출발일시,'YYYY-MM-DD') LIKE '" + departureDate + "%'");
			pstmt.setString(1, departure);
			pstmt.setString(2, destination);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				schedulebean.setScheduleNumber(Integer.parseInt(rs.getString("스케쥴번호")));
				schedulebean.setAirplainNumber(Integer.parseInt(rs.getString("항공기번호")));
				schedulebean.setDeparture(rs.getString("출발공항"));
				schedulebean.setDepartureDate(rs.getString("출발일시"));
				schedulebean.setDestination(rs.getString("도착공항"));
				schedulebean.setArriveDate(rs.getString("도착일시"));
				schedulebean.setGate(rs.getShort("게이트번호"));
				
				PreparedStatement imsi_pstmt;
				ResultSet imsi_rs;
				
				imsi_pstmt = conn.prepareStatement("select count(*) from 예약 where 스케쥴번호=" + schedulebean.getScheduleNumber());
				imsi_rs = imsi_pstmt.executeQuery();
				
				int seat = 0;
				if(imsi_rs.next()) {
					seat = imsi_rs.getInt(1);
				}
	
				imsi_pstmt = conn.prepareStatement("select * from 항공기 where 항공기번호=" + schedulebean.getAirplainNumber());
				imsi_rs = imsi_pstmt.executeQuery();
				
				int max_seat = 0;
				if(imsi_rs.next()) {
					max_seat = imsi_rs.getInt("좌석수");
					schedulebean.setAirport(imsi_rs.getString("항공사"));
					schedulebean.setAirplainName(imsi_rs.getString("항공기이름"));
				}

				schedulebean.setSeat(max_seat - seat);
				if((max_seat - seat) > people) {
					list.add(schedulebean);
				}

				imsi_pstmt.close();
				imsi_rs.close();
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
	//예약
	public void reservation(int schedule_num1, String name[], String birthday[], int grade1[], int people, String id, int fee, int grade) {
		try {
			ReservationBean[] bean = new ReservationBean[people];
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			
			for(int i=0; i<people; i++) {
				bean[i] = new ReservationBean();
				pstmt = conn.prepareStatement("insert into 고객 values(고객_seq.nextval, ?, ?, ?, ?)");
				pstmt.setString(1, id);
				pstmt.setString(2, name[i]);
				pstmt.setString(3, birthday[i]);
				pstmt.setInt(4, grade1[i]);
				pstmt.executeUpdate();
				pstmt = conn.prepareStatement("select * from 고객 where id='"+ id + "' and 이름='" + name[i] + "' order by 고객번호 desc");
				rs = pstmt.executeQuery();
				if(rs.next()){
					bean[i].setCustomerNumber(rs.getInt("고객번호"));
					bean[i].setCustomerName(rs.getString("이름"));
				}
				bean[i].setId(id);
				bean[i].setFee(fee);
				bean[i].setGrade(grade);
				bean[i].setScheduleNumber(schedule_num1);
				pstmt = conn.prepareStatement("select * from 스케쥴 where 스케쥴번호='" + schedule_num1 + "'");
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					bean[i].setDepartureDate(rs.getString("출발일시"));
					bean[i].setGate(Integer.parseInt(rs.getString("게이트번호")));
					bean[i].setDeparture(rs.getString("출발공항"));
					bean[i].setDestination(rs.getString("도착공항"));
					
					PreparedStatement imsi_pstmt;
					ResultSet imsi_rs;
					
					imsi_pstmt = conn.prepareStatement("select * from 항공기 where 항공기번호=" + rs.getString("항공기번호"));
					imsi_rs = imsi_pstmt.executeQuery();
					
					if(imsi_rs.next()) {
						bean[i].setAirplainName(imsi_rs.getString("항공기이름"));
					}
					
					imsi_pstmt = conn.prepareStatement("select * from 좌석 where 항공기번호="+ rs.getString("항공기번호") + " and 좌석등급=" + grade + " and 예약유무='X' and 출발일시=TO_DATE(?, 'YYYY-MM-DD HH:MI:SS')");
					imsi_pstmt.setString(1, bean[i].getDepartureDate().substring(0, 19));
					imsi_rs = imsi_pstmt.executeQuery();
					
					if(imsi_rs.next()) {
						String seatNumber = imsi_rs.getString("좌석번호");
						bean[i].setSeatNumber(seatNumber);
						
						imsi_pstmt = conn.prepareStatement("update 좌석 set 예약유무='O' where 좌석번호='" + seatNumber + "'");
						imsi_pstmt.executeUpdate();
					}
					bean[i].setCustomerGrade(grade1[i]);
				}
				
				pstmt = conn.prepareStatement("insert into 예약 values(?, ?, ?, TO_DATE(?, 'YYYY-MM-DD HH:MI:SS'), ?, ?, ?, ?, ?, ?, ?, ?)");
				pstmt.setInt(1, bean[i].getCustomerNumber());
				pstmt.setString(2, bean[i].getId());
				pstmt.setInt(3, bean[i].getScheduleNumber());
				pstmt.setString(4, bean[i].getDepartureDate().substring(0, 19));
				pstmt.setInt(5, bean[i].getGate());
				pstmt.setInt(6, bean[i].getFee());
				pstmt.setString(7, bean[i].getDeparture());
				pstmt.setString(8, bean[i].getDestination());
				pstmt.setString(9, bean[i].getCustomerName());
				pstmt.setString(10, bean[i].getAirplainName());
				pstmt.setString(11, bean[i].getSeatNumber());
				pstmt.setInt(12, bean[i].getGrade());
				
				pstmt.executeUpdate();
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if(conn != null) try {conn.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(rs != null) try {rs.close();} catch(Exception e) {}
		}
	}
	public ArrayList<ReservationBean> getConfirmReserveList(String id) {
		ArrayList<ReservationBean> list = new ArrayList<ReservationBean>();
		ReservationBean bean = new ReservationBean();

		try {
			ds = dbconn.getDataSource();
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("select * from 예약 where id='" + id + "'");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean.setCustomerNumber(Integer.parseInt(rs.getString("고객번호")));
				bean.setId(rs.getString("id"));
				bean.setScheduleNumber(Integer.parseInt(rs.getString("스케쥴번호")));
				bean.setDepartureDate(rs.getString("출발일시"));
				bean.setGate(Integer.parseInt(rs.getString("게이트번호")));
				bean.setFee(Integer.parseInt(rs.getString("요금")));
				bean.setDeparture(rs.getString("출발공항"));
				bean.setDestination(rs.getString("도착공항"));
				bean.setCustomerName(rs.getString("고객이름"));
				bean.setAirplainName(rs.getString("항공기이름"));
				bean.setSeatNumber(rs.getString("좌석번호"));
				bean.setGrade(rs.getShort("좌석등급"));
				
				list.add(bean);
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
}
