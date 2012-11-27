package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

@WebServlet("/InsertMemberAction")
public class InsertMemberAction extends HttpServlet implements Action {
	private static final long serialVersionUID = 1L;
	
	private Forward forward;
	private MemberDAO memberdao;
	private MemberBean memberbean;
	
	public InsertMemberAction() {
		forward = new Forward();
		memberdao = new MemberDAO();
		memberbean = new MemberBean();
	}
	public Forward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		memberbean.setID(request.getParameter("id"));
		memberbean.setPassword(request.getParameter("password"));
		memberbean.setName(request.getParameter("name"));
<<<<<<< HEAD
		//memberbean.setEmail(request.getParameter("email"));
		//memberbean.setNickName(request.getParameter("nickName"));
		String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		//memberbean.setPhone(phone);
		//memberbean.setAddress(request.getParameter("address"));
=======
		memberbean.setName(request.getParameter("ssn1") + request.getParameter("ssn2"));
>>>>>>> 33539d3da42d056f3489b74bb74aa457f72d791d
		
		memberdao.InsertMember(memberbean);
		
		forward.setPath("./moveInsertMemberResult.do");
		return forward;
	}

}
