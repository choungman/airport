<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    
    <title>명지 항공 예약 시스템</title>
   
    <!-- CSS Reset -->
    <link rel="stylesheet" type="text/css" href="./styleSheet/myResetStyle.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts-grids/reset-fonts-grids.css">
    <!-- My CSS-->
    <link rel="stylesheet" type="text/css" href="./styleSheet/myStyle.css" />
    <!-- JqueryUI CSS -->
    <link rel="stylesheet" type="text/css" href="./styleSheet/jquery-ui-1.9.0.custom.css">
    <!-- JqueryMenu -->
    <link rel="stylesheet" type="text/css" href="./styleSheet/jqueryslidemenu.css" />
    <!--[if lte IE 7]>
    <style type="text/css">
    html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
    </style>
    <![endif]-->
    
    <script type="text/javascript" src="./javascript/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="./javascript/jquery-ui-1.9.0.custom.js"></script>
    <script type="text/javascript" src="./javascript/jqueryslidemenu.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            
            $('#checkout').hide();
            
            $('#pdsList').hide();
            $('#notice_tab #modernbricksmenu li').eq(0).click(function(){
                $('#notice_tab #modernbricksmenu li').each(function(index){
                    $(this).removeClass('current');
                });
                $('#notice_tab #modernbricksmenu li').eq(0).addClass('current');
                $('#noticeList').show();
                $('#pdsList').hide();
            });
            $('#notice_tab #modernbricksmenu li').eq(1).click(function(){
                $('#notice_tab #modernbricksmenu li').each(function(index){
                    $(this).removeClass('current');
                });
                $('#notice_tab #modernbricksmenu li').eq(1).addClass('current');
                $('#pdsList').show();
                $('#noticeList').hide();
            });
            
            $('#translate_tab').tabs();
			
			$( "#maincontainer" ).hide();
			var optionss = {};
			function callback() {
				setTimeout(function() {
				$( "#maincontainer:visible" ).removeAttr( "style" ).fadeOut();
				}, 1000 );
			};
			$('#maincontainer').show( 'blind',  optionss, 1500);
			$(".datepicker").datepicker({
				dateFormat         : 'yy-mm-dd',
				buttonImage        : './images/icon/calendar.png',
				buttonImageOnly : true,
				showOn: 'both',
				showAnim: 'toggle',
				minDate: '2d'  //최소 이전 날짜(2d - 2일후부터)
			});
			$("#search_result_table tr").mouseover(function(){
				$(this).css('background-color', '#62B1D0');
				$(this).css('cursor', 'pointer');
			});
			$("#search_result_table tr").mouseout(function(){
				$(this).css('background-color', '#ffffff');
			});

			$("#airport_search_text").focus(function(){
				$(this).attr('value', '');
			});
			$("#airport_search_text").blur(function(){
				if($(this).attr('value') == ""){
					$(this).attr('value', '도시명or공항명');
				}
			});
        });
    </script>
</head>
<body>
    <div id="maincontainer">
        <div id="topsection">
            <div id="membershipwrap">
                <div id="membership">
                    <div id="checkin">
                        <ul class="arrowunderline">
                            <li><a href="#">로그인</a></li>
                            <li><a href="#">회원가입</a></li>
                        </ul>
                    </div>
                    <div id="checkout">
                        <ul>
                            <li><a href="#">로그아웃</a></li>
                            <li><a href="#">개인정보수정</a></li>
                            <li><a href="#">MyPage</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="title">
                <h1>명지항공시스템 타이틀</h1>
            </div>
            <div id="myslidemenu" class="jqueryslidemenu">
                <ul>
                    <li><a href="#">홈으로</a></li>
                    <li><a href="#">예약하기</a></li>
                    <li><a href="#">공지사항</a>
                        <ul>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">자료실</a></li>
                        </ul>
					</li>
                    <li><a href="#">도움말</a>
                        <ul>
                            <li><a href="#">자주묻는질문</a></li>
                            <li><a href="#">연락처</a></li>
                        </ul>
                    </li>
                </ul>
                <br style="clear: left" />
            </div>
        </div>
        
        <div id="contentwrapper">
            <div id="contentcolumn">
                <div class="innertube">
                    <h3>가는 항공편</h3>
                    <table id="search_result_table" class="table_style1">
                        <tr>
                            <th>항공사</th>
                            <th>편명</th>
                            <th>운행시간</th>
                            <th>좌석</th>
                            <th>가격</th>
                            <th>잔여</th>
                            <th>가능</th>
                        </tr>
                        <tr>
                            <td>대한항공</td>
                            <td>KE1200편</td>
                            <td>10.24 06:50</td>
                            <td>일반석</td>
                            <td>82,000</td>
                            <td>9</td>
                            <td>가능</td>
                        </tr>
                        <tr>
                            <td>대한항공</td>
                            <td>KE1200편</td>
                            <td>10.24 06:50</td>
                            <td>일반석</td>
                            <td>82,000</td>
                            <td>9</td>
                            <td>가능</td>
                        </tr>
                        <tr>
                            <td>대한항공</td>
                            <td>KE1200편</td>
                            <td>10.24 06:50</td>
                            <td>일반석</td>
                            <td>82,000</td>
                            <td>9</td>
                            <td>가능</td>
                        </tr>
                        <tr>
                            <td>진에어</td>
                            <td>KE1200편</td>
                            <td>10.24 06:50</td>
                            <td>일반석</td>
                            <td>82,000</td>
                            <td>9</td>
                            <td>가능</td>
                        </tr>
                    </table>
                    <h3>오는 항공편</h3>
                    <table id="search_result_table" class="table_style1">
                        <tr>
                            <th>항공사</th>
                            <th>편명</th>
                            <th>운행시간</th>
                            <th>좌석</th>
                            <th>가격</th>
                            <th>잔여</th>
                            <th>가능</th>
                        </tr>
                        <tr>
                            <td>대한항공</td>
                            <td>KE1200편</td>
                            <td>10.24 06:50</td>
                            <td>할인석</td>
                            <td>62,000</td>
                            <td>9</td>
                            <td>가능</td>
                        </tr>
                        <tr>
                            <td>대한항공</td>
                            <td>KE1200편</td>
                            <td>10.24 06:50</td>
                            <td>일반석</td>
                            <td>82,000</td>
                            <td>9</td>
                            <td>가능</td>
                        </tr>
                    </table>
                    <h3>최종선택/예약</h3>
                    <table id="select_result_table" class="table_style1">
                        <tr>
                            <th></th>
                            <th>항공편</th>
                            <th>여정</th>
                            <th>출발시간</th>
                            <th>도착시간</th>
                        </tr>
                        <tr>
                            <td>출발</td>
                            <td>진에어 LJ0641편</td>
                            <td>김포→제주</td>
                            <td>10.23 (화) 06:35</td>
                            <td>10.23 (화) 07:40</td>
                        </tr>
                        <tr>
                            <td>도착</td>
                            <td>대한항공 KE1200편</td>
                            <td>제주→김포</td>
                            <td>10.24 (수) 06:50</td>
                            <td>10.24 (수) 07:55</td>
                        </tr>
                    </table>
					<div id="fee">
						예상요금 <span>127,600원</span>
						<p>(유류할증료 및 공항세 불포함)</p>
						<input type="button" value="예약하기" />
					</div>
				</div>
            </div>
        </div>
            
        <div id="leftcolumn">
            <div class="innertube">
                <div id="notice_tab">
                    <div id="modernbricksmenu">
                        <ul>
                        <li class="current"><a href="#" title="공지사항">공지사항</a></li>
                        <li><a href="#" title="자료실">자료실</a></li>
                        </ul>
                    </div>
                    <div id="modernbricksmenuline">&nbsp;</div>
                    <div id="noticeList">
                        <ul>
                            <li><a href="#">HTML 모든 것을 알려주마 샘플 활용법</a> <span class="date">2009.10.15</span></li>
                            <li><a href="#">W3C 사이트 리뉴얼 소식 및 공지사항</a> <span class="date">2009.10.15</span></li>
                            <li><a href="#">KWCAG2.0 소식</a> <span class="date">2009.10.15</span></li>
                            <li><a href="#">서버 점검으로 인한 사이트 이용안내 입니다.</a> <span class="date">2009.10.15</span></li>
                            <li><a href="#">여러분들이 생각하는 웹 접근성에 대해 이야긴..</a> <span class="date">2009.10.15</span></li>
                        </ul>
						<p class="more"><a href="#" >더보기</a></p>
                    </div>
                    <div id="pdsList">
                        <ul>
                            <li><a href="#">디자인 사이트 링크 모음</a> <span class="date">2009.10.15</span></li>
                            <li><a href="#">웹 접근성 관련 자료 모음</a> <span class="date">2009.10.15</span></li>
                            <li><a href="#">예제 샘플 응용해 보기</a> <span class="date">2009.10.15</span></li>
                            <li><a href="#">웹 접근성 향상을 위한 국가표준 기술 가이드 라인</a> <span class="date">2009.10.15</span></li>
                            <li><a href="#">로얄티 프리 이미지 자료</a> <span class="date">2009.10.15</span></li>
                        </ul>
					    <p class="more"><a href="#" >더보기</a></p>
                    </div>
                </div>
                
                <div id="translate_tab">
                    <h3>항공권 검색</h3>
					<ul>
						<li><a href="#tabs-1" onfocus="this.blur()">국제선</a></li>
						<li><a href="#tabs-2" onfocus="this.blur()">국내선</a></li>
					</ul>
					<div id="tabs-1">
						<form id="translate_form_oversea" method="post" action="">
							<table id="oversea" class="table_style1">
								<tr>
									<th>
										구 간
									</th>
									<td colspan="3">
										<input type="radio" name="section">왕복
										<input type="radio" name="section">편도
										<input type="radio" name="section">다구간
									</td>
								</tr>    
								<tr>
									<th>
										출발지
									</th>
									<td>
										<select>
											<option>인천</option>
											<option>김포</option>
											<option>부산</option>
											<option>제주</option>
										</select>
									</td>
									<th>
										가는날
									</th>
									<td>
										<input type="text" class="datepicker" readonly />
									</td>
								</tr>
								<tr>
									<th>
										도착지
									</th>
									<td>
										<input type="text" id="airport_search_text" value="도시명or공항명" size="14" />
									</td>
									<th>
										오는날
									</th>
									<td>
										<input type="text" class="datepicker" readonly />
									</td>
								</tr>
								<tr>
									<th>
										탑승객
									</th>
									<td colspan="3">
										<select>
											<option>성인0명</option>
											<option selected>성인1명</option>
											<option>성인2명</option>
											<option>성인3명</option>
											<option>성인4명</option>
											<option>성인5명</option>
										</select>
										<select>
											<option>소아0명</option>
											<option>소아1명</option>
											<option>소아2명</option>
											<option>소아3명</option>
											<option>소아4명</option>
											<option>소아5명</option>
										</select>
										<select>
											<option>유아0명</option>
											<option>유아1명</option>
											<option>유아2명</option>
											<option>유아3명</option>
											<option>유아4명</option>
											<option>유아5명</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>
										좌석
									</th>
									<td colspan="3">
										<select>
											<option>일반석</option>
											<option>비즈니스석</option>
											<option>일등석</option>
										</select>
									</td>
								</tr>        
							</table>
						</form>
					</div>
					<div id="tabs-2">
						<form id="translate_form_internal" method="post" action="">
							<table id="internal" class="table_style1">
								<tr>
									<th>
										구 간
									</th>
									<td colspan="3">
										<input type="radio" name="section">왕복
										<input type="radio" name="section">편도
										<input type="radio" name="section">다구간
									</td>
								</tr>    
								<tr>
									<th>
										출발지
									</th>
									<td>
										<select>
											<option>인천</option>
											<option>김포</option>
											<option>부산</option>
											<option>제주</option>
										</select>
									</td>
									<th>
										가는날
									</th>
									<td>
										<input type="text" class="datepicker" readonly />
									</td>
								</tr>
								<tr>
									<th>
										도착지
									</th>
									<td>
										<select>
											<option>인천</option>
											<option>김포</option>
											<option>부산</option>
											<option>제주</option>
										</select>
									</td>
									<th>
										오는날
									</th>
									<td>
										<input type="text" class="datepicker" readonly />
									</td>
								</tr>
								<tr>
									<th>
										탑승객
									</th>
									<td colspan="3">
										<select>
											<option>성인0명</option>
											<option selected>성인1명</option>
											<option>성인2명</option>
											<option>성인3명</option>
											<option>성인4명</option>
											<option>성인5명</option>
										</select>
										<select>
											<option>소아0명</option>
											<option>소아1명</option>
											<option>소아2명</option>
											<option>소아3명</option>
											<option>소아4명</option>
											<option>소아5명</option>
										</select>
										<select>
											<option>유아0명</option>
											<option>유아1명</option>
											<option>유아2명</option>
											<option>유아3명</option>
											<option>유아4명</option>
											<option>유아5명</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>
										좌석
									</th>
									<td colspan="3">
										<select>
											<option>일반석</option>
											<option>비즈니스석</option>
											<option>일등석</option>
										</select>
									</td>
								</tr>        
							</table>
						</form>
					</div>
					<img src="./images/btn_srch.gif" alt="검색버튼" />
				</div>
			</div>
        </div>
        
        <div id="rightcolumn">
        </div>
        
        <div id="footer">
            <p>copyright@ 명지대학교 컴퓨터공학과 신동욱 | 안형주</p>
        </div>
    </div>
</body>
</html>
