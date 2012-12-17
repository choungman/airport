<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
// $.datepicker.setDefaults($.datepicker.regional["ko"]);
    $(".datePicker").datepicker({ 
     dateFormat: 'yy-mm-dd',
     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
     dayNamesMin: ['일','월','화','수','목','금','토'],
     weekHeader: 'Wk',
     minDate: '+0d', //오늘 이후 날짜 선택 불가
     changeMonth: true, //월변경가능
     changeYear: true, //년변경가능
     yearRange:'1988:+10', // 연도 셀렉트 박스 범위(현재와 같으면 1988~현재년+10)
     showMonthAfterYear: true, //년 뒤에 월 표시
     buttonImageOnly: true, //이미지표시  
     buttonText: '날짜를 선택하세요', 
     autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
     buttonImage: 'img/calander_icon.png', //이미지주소 /wtm/images/egovframework/wtm2/sub/bull_calendar.gif
     showOn: "both" //엘리먼트와 이미지 동시 사용
  });
});
</script>
<form method="post" action="./findScheduleAction.do">
<h2 style="font-size:15px; font-weight:bold; color:blue; padding:5px 0;">항공권 검색</h2>
<table class="my_table1">
	<tr>
		<th>구간</th>
		<td colspan="3">
			<input name="section" type="radio" value="편도" checked />편도 
			<input name="section" type="radio" value="왕복" />왕복 
		</td>
	<tr>
	<tr>
		<th>출발지</th>
		<td>
			<select name="departure">
				<option value="김포">김포</option>
				<option value="광주">광주</option>
				<option value="무안">무안</option>
				<option value="군산">군산</option>
				<option value="대구">대구</option>
				<option value="부산">부산</option>
				<option value="여수">여수</option>
				<option value="울산">울산</option>
				<option value="원주">원주</option>
				<option value="제주">제주</option>
				<option value="진주">진주</option>
				<option value="청주">청주</option>
				<option value="포항">포항</option>
			</select>
		</td>
		<th>가는날</th>
		<td>
			<input type="text" name="departure_date" class="datePicker" />
		</td>
	</tr>
	<tr>
		<th>도착지</th>
		<td>
			<select name="destination">
				<option value="김포">김포</option>
				<option value="광주">광주</option>
				<option value="무안">무안</option>
				<option value="군산">군산</option>
				<option value="대구">대구</option>
				<option value="부산">부산</option>
				<option value="여수">여수</option>
				<option value="울산">울산</option>
				<option value="원주">원주</option>
				<option value="제주">제주</option>
				<option value="진주">진주</option>
				<option value="청주">청주</option>
				<option value="포항">포항</option>
			</select>
		</td>
		<th>오는날</th>
		<td>
			<input type="text" name="back_date" class="datePicker" />
		</td>
	</tr>
	<tr>
		<th>탑승객</th>
		<td colspan="3">
			<select name="adult">
				<option value="1" selected>성인1명</option>
				<option value="2">성인2명</option>
				<option value="3">성인3명</option>
				<option value="4">성인4명</option>
				<option value="5">성인5명</option>
				<option value="6">성인6명</option>
				<option value="7">성인7명</option>
				<option value="8">성인8명</option>
				<option value="9">성인9명</option>
			</select>
			<select name="child">
				<option value="0" selected>소아0명</option>
				<option value="1">소아1명</option>
				<option value="2">소아2명</option>
				<option value="3">소아3명</option>
				<option value="4">소아4명</option>
				<option value="5">소아5명</option>
				<option value="6">소아6명</option>
				<option value="7">소아7명</option>
				<option value="8">소아8명</option>
				<option value="9">소아9명</option>
			</select>
			<select name="toddler">
				<option value="0" selected>유아0명</option>
				<option value="1">유아1명</option>
				<option value="2">유아2명</option>
				<option value="3">유아3명</option>
				<option value="4">유아4명</option>
				<option value="5">유아5명</option>
				<option value="6">유아6명</option>
				<option value="7">유아7명</option>
				<option value="8">유아8명</option>
				<option value="9">유아9명</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>좌석</th>
		<td colspan="3">
			<select name="seat">
				<option value="1">일반석</option>
				<option value="2">비지니스석</option>
				<option value="3">일등석</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="4"><input type="submit" value="검색" class="formbutton" /></td>
	</tr>
</table>
</form>