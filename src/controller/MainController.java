package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
    	
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
    		request.setAttribute("main", "1");
    		request.setAttribute("sub", "1");
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
    		request.setAttribute("sub", "2"); 
    	}
    	else if(command.equals("/moveFindAirplain.do")) {
			if(session.getAttribute("id") == null) {
	    		forward.setPath("main.jsp");
	    		request.setAttribute("page", "login_please");
	    		request.setAttribute("main", "1");
	    		request.setAttribute("sub", "1");
			}
			else {
	    		forward.setPath("main.jsp");
	    		request.setAttribute("page", "find_airplain");
	    		request.setAttribute("main", "2");
	    		request.setAttribute("sub", "1");	
			}
    	}
    	else if(command.equals("/moveAirplainList.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "airplain_list");
    		request.setAttribute("main", "2");
    		request.setAttribute("sub", "1");
    	}
    	else if(command.equals("/moveEachAirplainList.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "each_airplain_list");
    		request.setAttribute("main", "2");
    		request.setAttribute("sub", "1");
    	}
    	else if(command.equals("/moveReservation.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "reservation");
    		request.setAttribute("main", "2");
    		request.setAttribute("sub", "1");
    	}
    	else if(command.equals("/moveReservationResult.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "reservation_result");
    		request.setAttribute("main", "2");
    		request.setAttribute("sub", "1");
    	}
    	else if(command.equals("/moveNotice.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "notice_board");
    		request.setAttribute("main", "3");
    		request.setAttribute("sub", "1");
    	}
    	else if(command.equals("/moveBoard.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "notice_board");
    		request.setAttribute("main", "4");
    		request.setAttribute("sub", "1");
    	}
		else if(command.equals("/moveDeleteCheck.do")) {
    		forward.setPath("delete_check.jsp");
    	}
		else if(command.equals("/moveModifyCheck.do")) {
    		forward.setPath("modify_check.jsp");
    	}
		else if(command.equals("/moveModifyBoard.do")) {
    		action = new ModifyCheckAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	else if(command.equals("/moveData.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "notice_board");
    		request.setAttribute("main", "4");
    		request.setAttribute("sub", "2");
    	}
    	else if(command.equals("/moveConfirmReserve.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "confirmReserve");
    		request.setAttribute("main", "5");
    		request.setAttribute("sub", "1");
    	}
    	else if(command.equals("/moveInfoModify.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "infoModify");
    		request.setAttribute("main", "5");
    		request.setAttribute("sub", "2");
    	}
    	else if(command.equals("/moveMemberWithdrawal.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "memberWithdrawal");
    		request.setAttribute("main", "5");
    		request.setAttribute("sub", "3");
    	}
    	else if(command.equals("/moveQnA.do")) {
    		forward.setPath("main.jsp");
    		request.setAttribute("page", "notice_board");
    		request.setAttribute("main", "6");
    		request.setAttribute("sub", "1");
    	}
    	
    	//비행기 검색,예약 액션
    	else if(command.equals("/findScheduleAction.do")) {
    		action = new FindScheduleAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	else if(command.equals("/reservationAction.do")) {
    		action = new ReservationAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	
    	//Mypage 나의 예약 사항 보여주기 
    	else if(command.equals("/displayConfirmReserveAction.do")) {
			if(session.getAttribute("id") == null) {
	    		forward.setPath("main.jsp");
	    		request.setAttribute("page", "login_please");
	    		request.setAttribute("main", "1");
	    		request.setAttribute("sub", "1");
			}
			else {
	    		action = new ConfirmReserveAction();
	    		try{
	    			forward = action.execute(request, response);
	    		}
	    		catch(Exception e){
	    			e.printStackTrace();
	    		}
			}
    	}
    	else if(command.equals("/deleteReservationAction.do")) {
    		action = new DeleteReservationAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	
    	
    	//회원가입,로그인 액션
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

    	//게시판 관련 액션 or 페이지이동
    	else if(command.equals("/moveViewBoard.do")) {
    		forward.setPath("./view_board.jsp");
    	}
		else if(command.equals("/moveWriteBoard.do")) {
    		forward.setPath("./write_board.jsp");
    	}
		else if(command.equals("/moveViewContents.do")) {
    		forward.setPath("./view_contents.jsp");
    	}
		else if(command.equals("/boardDisplayAction.do")) {
    		action = new BoardDisplayAction();
    		request.setAttribute("boardName", request.getParameter("boardName"));
    		request.setAttribute("page", request.getParameter("page"));
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
		else if(command.equals("/noticeBoardDisplayAction.do")) {
    		action = new BoardDisplayAction();
    		request.setAttribute("boardName", "noticeboard");
    		request.setAttribute("page", "1");
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
		else if(command.equals("/ContentsDisplayAction.do")) {
    		action = new ContentsDisplayAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
		else if(command.equals("/writeBoardAction.do")) {
    		action = new WriteBoardAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
		else if(command.equals("/modifyBoardAction.do")) {
    		action = new ModifyBoardAction();
    		try{
    			forward = action.execute(request, response);
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
			
		}
		else if(command.equals("/deleteBoardAction.do")) {
			action = new DeleteBoardAction();
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
