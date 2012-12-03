package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BoardBean;

import java.io.UnsupportedEncodingException;
import java.util.*;

import model.*;

@WebServlet("/BoardDisplayAction")
public class BoardDisplayAction extends HttpServlet implements Action {
	private static final long serialVersionUID = 1L;
	
	private Forward forward;
	private BoardDAO boarddao;
	private List<BoardBean> boardList;
	
	public BoardDisplayAction() {
		forward = new Forward();
		boarddao = new BoardDAO();
	}
	public Forward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		boardList = boarddao.getBoardList((String)request.getAttribute("boardName"), Integer.parseInt((String)request.getAttribute("page")));
		request.setAttribute("boardList", boardList);
		forward.setPath("./moveViewBoard.do");
		
		return forward;
	}
}
