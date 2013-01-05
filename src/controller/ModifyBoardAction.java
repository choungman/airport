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

@WebServlet("/ModifyBoardAction")
public class ModifyBoardAction extends HttpServlet implements Action {
	private static final long serialVersionUID = 1L;
	
	private Forward forward;
	private BoardDAO boarddao;
	
	public ModifyBoardAction() {
		forward = new Forward();
		boarddao = new BoardDAO();
	}
	public Forward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		BoardDAO boarddao = new BoardDAO();
		BoardBean bean = new BoardBean();
		bean.setTitle(request.getParameter("title"));
		bean.setWriter(request.getParameter("writer"));
		bean.setContents(request.getParameter("contents"));
		
		boarddao.modifyBoard(request.getParameter("boardName"), Integer.parseInt(request.getParameter("index")), bean);
		forward.setPath("./contents/notice_board.jsp");
		
		return forward;
	}
}
