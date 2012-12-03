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

@WebServlet("/WriteBoardAction")
public class WriteBoardAction extends HttpServlet implements Action {
	private static final long serialVersionUID = 1L;
	
	private Forward forward;
	private BoardDAO boarddao;
	
	public WriteBoardAction() {
		forward = new Forward();
		boarddao = new BoardDAO();
	}
	public Forward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		BoardBean bean = new BoardBean();
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date(System.currentTimeMillis()));
		String date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(cal.getTime());
		
		bean.setTitle(request.getParameter("title"));
		bean.setPassword(request.getParameter("password"));
		bean.setWriter(request.getParameter("writer"));
		bean.setContents(request.getParameter("contents"));
		bean.setDate(date);
		boarddao.writeBoard(request.getParameter("boardName"), bean);
		
		forward.setPath("./boardDisplayAction.do?boardName=" + request.getParameter("boardName") + "&page=1");
		
		return forward;
	}
}
