package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet implements Action {
	private static final long serialVersionUID = 1L;
	
	private Forward forward;
	private MemberDAO  memberdao;
	private MemberBean memberbean;
	
	public LoginAction() {
		forward = new Forward();
		memberdao = new MemberDAO();
	}
	public Forward execute(HttpServletRequest request, HttpServletResponse response) {
		memberbean = memberdao.login(request.getParameter("id"), request.getParameter("password"));
		
		if(memberbean != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", memberbean.getID());
			session.setAttribute("name", memberbean.getName());
			session.setAttribute("ssn", memberbean.getSsn());
			session.setAttribute("blackList", memberbean.isBlackList());
			forward.setPath("./moveHome.do");
		}
		else {
			forward.setPath("./moveLoginFail.do");
		}
		
		return forward;
	}
}
