package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

import beans.BoardBean;

import model.*;

@WebServlet("/DeleteBoardAction")
public class DeleteBoardAction extends HttpServlet implements Action {
	private static final long serialVersionUID = 1L;
	
	private Forward forward;
	private BoardDAO boarddao;
	
	public DeleteBoardAction() {
		forward = new Forward();
		boarddao = new BoardDAO();
	}
	public Forward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		boolean check;
		BoardDAO boarddao = new BoardDAO();
		check = boarddao.checkPassword(request.getParameter("boardName"), Integer.parseInt(request.getParameter("index")), request.getParameter("password"));
		
		if(check == true){
			boarddao.deleteBoard(request.getParameter("boardName"), Integer.parseInt(request.getParameter("index")));
			forward.setPath("./contents/notice_board.jsp");
		}
		else{
			forward.setPath("./fail_password_check.jsp");
		}
		
		return forward;
	}
}
