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

import beans.CustomerBean;
import beans.MemberBean;
import beans.ReservationBean;
import beans.ScheduleBean;

import model.*;

@WebServlet("/InsertMemberAction")
public class ReservationAction extends HttpServlet implements Action {
	private static final long serialVersionUID = 1L;
	
	private Forward forward;
	private ScheduleDAO scheduledao;
	
	public ReservationAction() {
		forward = new Forward();
		scheduledao = new ScheduleDAO();
	}
	public Forward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		int schedule_num1 = Integer.parseInt(request.getParameter("schedule_num1"));
		int schedule_num2 = 0;
		if(request.getParameter("schedule_num2") != null) {
			schedule_num2 = Integer.parseInt(request.getParameter("schedule_num2"));
		}
		int people = Integer.parseInt(request.getParameter("people"));
		int grade =  Integer.parseInt(request.getParameter("seat"));
		int fee = Integer.parseInt(request.getParameter("fee"));
		String[] name = new String[people];
		String[] birthday = new String[people];
		int[] grade1 = new int[people];
		String id = (String)session.getAttribute("id");
		for(int i=0; i<people; i++) {
			name[i] = request.getParameter("name"+(i+1));
			birthday[i] = request.getParameter("birthday"+(i+1));
			grade1[i] = Integer.parseInt(request.getParameter("grade"+(i+1)));
		}
		scheduledao.reservation(schedule_num1, name, birthday, grade1, people, id, fee, grade);
		if(request.getParameter("schedule_num2") != null) {
			scheduledao.reservation(schedule_num2, name, birthday, grade1, people, id, fee, grade);
		}
		
		
		forward.setPath("./moveReservationResult.do");
		return forward;
	}

}
