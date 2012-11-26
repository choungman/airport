package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MainFrontController
 */
@WebServlet("/MainFrontController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Forward forward;

    public MainController() {
    	forward = new Forward(); 
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = requestURI.substring(contextPath.length());
		Action action = null;
    	
    	//페이지 이동
    	if(command.equals("/moveHome.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "home");
    		request.setAttribute("main", "1");
    		request.setAttribute("sub", "1");
    	}
    	else if(command.equals("/moveLoginFail.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "login_fail");
    	}
    	else if(command.equals("/moveJoinMember.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "join_member");
    	}
    	else if(command.equals("/moveInsertMemberResult.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "insert_member_result");
    		request.setAttribute("main", "1");
    		request.setAttribute("sub", "1");
    	}
    	else if(command.equals("/moveHelp.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "help");
    		request.setAttribute("main", "1");
    		request.setAttribute("sub", "3");
    	}
    	else if(command.equals("/moveFindAirport.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "findAirport");
    		request.setAttribute("main", "2");
    		request.setAttribute("sub", "1");
    	}
    	
    	else if(command.equals("/moveNotice.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "notice");
    		request.setAttribute("main", "3");
    		request.setAttribute("sub", "1");
    	}
    	
    	else if(command.equals("/moveBoard.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "board");
    		request.setAttribute("main", "4");
    		request.setAttribute("sub", "1");
    	}
    	else if(command.equals("/moveInfoModify.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "infoModify");
    		request.setAttribute("main", "5");
    		request.setAttribute("sub", "1");
    	}
    	
    	else if(command.equals("/moveQnA.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "qna");
    		request.setAttribute("main", "6");
    		request.setAttribute("sub", "1");
    	}
    	
    	
    	//액션 수행
    	else if(command.equals("/loginAction.do")) {
    		action = new LoginAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	else if(command.equals("/logoutAction.do")) {
    		action = new LogoutAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	else if(command.equals("/insertMemberAction.do")) {
    		action = new InsertMemberAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
		dispatcher.forward(request, response);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
