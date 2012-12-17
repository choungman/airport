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
import beans.ScheduleBean;

import model.*;

@WebServlet("/InsertMemberAction")
public class FindScheduleAction extends HttpServlet implements Action {
	private static final long serialVersionUID = 1L;
	
	private Forward forward;
	private ScheduleDAO scheduledao;
	private ScheduleBean schedulebean;
	
	public FindScheduleAction() {
		forward = new Forward();
		scheduledao = new ScheduleDAO();
		schedulebean = new ScheduleBean();
	}
	public Forward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ArrayList<ScheduleBean> list = new ArrayList<ScheduleBean>();
		ArrayList<ScheduleBean> back_list = new ArrayList<ScheduleBean>();
		String departure = request.getParameter("departure");
		String destination = request.getParameter("destination");
		String departureDate = request.getParameter("departure_date");
		String back_date = request.getParameter("back_date");
		int people = Integer.parseInt(request.getParameter("adult")) + Integer.parseInt(request.getParameter("child")) + Integer.parseInt(request.getParameter("toddler"));
		String section = request.getParameter("section");
		String seat = request.getParameter("seat");
		
		list = scheduledao.getAirplainList(departure, destination, departureDate, people);
		back_list = scheduledao.getAirplainList(destination, departure, back_date, people);
		
		request.setAttribute("scheduleList", list);
		request.setAttribute("scheduleList2", back_list);
		request.setAttribute("people", people);
		request.setAttribute("seat", seat);
		request.setAttribute("adult", request.getParameter("adult"));
		request.setAttribute("child", request.getParameter("child"));
		request.setAttribute("toddler", request.getParameter("toddler"));
		
		if(section.equals("왕복")) {
			forward.setPath("./moveAirplainList.do");
		}
		else if(section.equals("편도")) {
			forward.setPath("./moveEachAirplainList.do");
		}
		return forward;
	}

}
