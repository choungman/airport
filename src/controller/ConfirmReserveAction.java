package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.MemberBean;
import beans.ReservationBean;
import beans.ScheduleBean;

import model.*;

@WebServlet("/ConfirmReserveAction")
public class ConfirmReserveAction extends HttpServlet implements Action {
	private static final long serialVersionUID = 1L;
	
	private Forward forward;
	private ScheduleDAO scheduledao;
	private ReservationBean reservationBean;
	
	public ConfirmReserveAction() {
		forward = new Forward();
		scheduledao = new ScheduleDAO();
		reservationBean = new ReservationBean();
	}
	public Forward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		ArrayList<ReservationBean> list = new ArrayList<ReservationBean>();
				
		list = scheduledao.getConfirmReserveList((String)session.getAttribute("id"));
		
		request.setAttribute("confirmReserveList", list);
		
		forward.setPath("./moveConfirmReserve.do");
		return forward;
	}

}
