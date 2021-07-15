<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="회원상세"/>
</jsp:include>
        <div id="ad_right">
            <div id="contHeader">회원상세</div>
            <div style="overflow:overlay;height:690px;">
                <div id="contBody">
                    <div id="memberDetail">
                        <div id="memDetLef">
                            <div id="memberImg">이미지</div>
                            <div id="memDefLefBtn">
                                <button type="button" class="btn btn-outline-secondary">수정</button>
                            </div>
                        </div>
                        <div id="memDetRig">
                            <form action="" method="post">
                                <table id="memberDetTab">
                                    <tr>
                                        <th>회원번호</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>아이디</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td><input type="email"></td>
                                    </tr>
                                    <tr>
                                        <th>생년월일</th>
                                        <td>
                                           <input type="text" id="datePicker">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>전화번호</th>
                                        <td id="detTabTel">
                                            <select class="detPhone">
                                                <option selected>선택</option>
                                                <option value="010">010</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                            </select>
                                            - <input class="detPhone" type="text">
                                            - <input class="detPhone" type="text">
                                        </td>
                                    </tr>
                                    <tr style="height:150px">
                                        <th>주소</th>
                                        <td id="detTabAdd">
                                            <input class="addInp" style="margin-bottom : 10px;" type="text"
                                                id="sample4_postcode" placeholder="우편번호">
                                            <input style="width:90px;margin-left:8px;font-size:15px;text-align:center;" type="button"
                                                onclick="sample4_execDaumPostcode()" value="우편번호"><br>
                                            <input class="addInp" style="margin-bottom : 10px;width:285px;" type="text"
                                                id="sample4_roadAddress" placeholder="도로명주소"> <br>
                                            <input class="addInp" type="text" id="sample4_detailAddress" style="width:285px;"
                                                placeholder="상세주소">
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <div id="memberBooHis">
                        <div id="booHisLef">
                            <div id="booLenHis_header">
                                도서대출내역
                            </div>
                            <table id="booLenHis_tab" class="booHisTab">
                                <tr>
                                    <th>대출번호</th>
                                    <th>도서번호</th>
                                    <th>도서명</th>
                                    <th>대출일</th>
                                    <th>반납일</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                            </table>
                        </div>
                        <div id="booHisRig">
                            <div id="booBooHis_header">
                                도서예약내역
                            </div>
                            <table id="booBooHis_tab" class="booHisTab">
                                <tr>
                                    <th>예약번호</th>
                                    <th>도서번호</th>
                                    <th>도서명</th>
                                    <th>예약일</th>
                                    <th>대출예정일</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="memberDetBtn">
                        <button type="button" class="btn btn-outline-secondary">수정하기</button>
                        <button type="button" class="btn btn-outline-secondary">뒤로가기</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script>
    
		 // Daum API 
		
		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function (data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if (data.buildingName !== '' && data.apartment === 'Y') {
		                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if (extraRoadAddr !== '') {
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample4_postcode').value = data.zonecode;
		                document.getElementById("sample4_roadAddress").value = roadAddr;
		
		            }
		        }).open();
		    }
		
		    // DatePicker
		
		$(function() {	
			$('#datePicker').datepicker({
			    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			    // startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			    endDate: '+0d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
			    // clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
			    // datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
			    // daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
			    // daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
			    // disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			    // immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
			    // multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
			    // multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
			    templates : {
			        leftArrow: '&laquo;',
			        rightArrow: '&raquo;'
			    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
			    // showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
			    title: "생년월일",	//캘린더 상단에 보여주는 타이틀
			    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
			    toggleActive : false,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			    // weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
			    language : "kr"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
			    
			}).on("changeDate", function(e) {
		             //이벤트의 종류
		             //show : datePicker가 보이는 순간 호출
		             //hide : datePicker가 숨겨지는 순간 호출
		             //clearDate: clear 버튼 누르면 호출
		             //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
		             //changeMonth : 월이 변경되면 호출
		             //changeYear : 년이 변경되는 호출
		             //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
		             
		             // console.log(e);// 찍어보면 event 객체가 나온다.
		             //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데 
		             // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
		             // 위와 같은 형태로 보인다. 
		             // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다. 
		        }//datepicker end
		    )//ready end
		});
		
    </script>

	<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>
    



