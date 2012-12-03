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

@WebServlet("/ContentsDisplayAction")
public class ContentsDisplayAction extends HttpServlet implements Action {
	private static final long serialVersionUID = 1L;
	
	private Forward forward;
	private BoardDAO boarddao;
	private BoardBean boardbean;
	
	public ContentsDisplayAction() {
		forward = new Forward();
		boarddao = new BoardDAO();
		boardbean = new BoardBean();
	}
	public Forward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		boardbean = boarddao.getBoardContents(request.getParameter("boardName"), Integer.parseInt(request.getParameter("index")));
		boarddao.increaseClickCount(request.getParameter("boardName"), Integer.parseInt(request.getParameter("index")));
		
		request.setAttribute("boardContents", boardbean);
		forward.setPath("./moveViewContents.do");
		
		return forward;
	}
}
