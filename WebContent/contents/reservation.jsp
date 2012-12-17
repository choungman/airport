<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int airplainNum1 = 0;
	int airplainNum2 = 0;
	if(request.getParameter("schedule_num1") != null) {
		airplainNum1 = Integer.parseInt(request.getParameter("schedule_num1"));
	}
	if(request.getParameter("schedule_num2") != null) {
		airplainNum2 = Integer.parseInt(request.getParameter("schedule_num2"));
	}
	int people = Integer.parseInt(request.getParameter("people"));
	String seat = request.getParameter("seat");
	int adult = Integer.parseInt(request.getParameter("adult"));
	int child = Integer.parseInt(request.getParameter("child"));
	int toddler = Integer.parseInt(request.getParameter("toddler"));
	int fee = (people * 70000) - (child * 21000) - (toddler * 60000);
%>
	
<%
	for(int i=0; i<people; i++){
%>
		<h2 style="font-size:15px; font-weight:bold; color:blue; padding:5px 0;">예약자 정보<%= i+1 %></h2>
		<form method="post" action="./reservationAction.do" class="cssform">
			<table class="my_table1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name<%= i+1 %>" /></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="birthday<%= i+1 %>" /></td>
				</tr>
				<tr>
					<th>등급</th>
					<td>
						<select  name="grade<%= i+1 %>">
							<option value="1" selected>성인</option>
							<option value="2">아동</option>
							<option value="3">유아</option>
						</select>
					</td>
				</tr>
			</table>
		<br/>
<%
	}
%>
	<input type="hidden" name="seat" value="<%= seat %>" />
	<input type="hidden" name="people" value="<%= people %>" />
	<input type="hidden" name="schedule_num1" value="<%= airplainNum1 %>" />
	<input type="hidden" name="fee" value="<%= fee %>" />
	<input type="hidden" name="seat" value="<%= seat %>" />
<%
	if(request.getParameter("schedule_num2") != null) {
%>
		<input type="hidden" name="schedule_num2" value="<%= airplainNum2 %>" />
<%
	}
%>

<span class="red bold">현재 결제 하실 금액은 <%= fee %>원 입니다</span>
<br/>
<p>
			<label for="user">카드종류</label>
			<select>
				<option selected>선택</option>
				<option>신한</option>
				<option>외환</option>
				<option>현대</option>
				<option>삼성</option>
				<option>BC</option>
				<option>국민</option>
				<option>롯데</option>
				<option>시티</option>
				<option>NH</option>
				<option>수협</option>
			</select>
		</p>
		<p>
			<label for="user">카드번호</label>
			<input type="text" size="4" /> - <input type="text" size="4" /> - <input type="text" size="4" />
		</p>
		<p>
			<label for="user">이메일 주소</label>
			<input type="text" size="5" /> @ 
			<select>
				<option>hanmail.net</option>
				<option>naver.com</option>
				<option>nate.com</option>
				<option>yahoo.com</option>
				<option>gmail.com</option>
				<option>hotmail.net</option>
			</select>
		</p>
		<br/><br/><br/>
		비밀번호를 3회 이상 연속으로 잘못 입력하였을 경우 모든 거래가 중지 될 수 있습니다<br/>
		결제가 모두 완료 될때까지 창을 새로 고침하거나 종료 하지 말아 주십시오<br/>
		카드 명세서에는 (주)명지Airport 으로 표시 됩니다<br/><br/>
		<input type="checkbox" /> <span class="bold">명지 항공예약의  정책에 동의 하며, 결제에 관한 세부 내역을 모두 확인하였습니다.</span><br/>
		<input type="submit" value="예약하기" class="formbutton" />
</form>