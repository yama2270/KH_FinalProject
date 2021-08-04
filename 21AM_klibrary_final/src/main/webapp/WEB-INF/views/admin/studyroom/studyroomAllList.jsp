<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="열람실 전체조회" />
</jsp:include>

<div id="ad_right">
	<div id="contHeader">열람실 관리>열람실 조회</div>
	<div style="overflow: overlay; margin: auto;">
		<div id="contBody">
			<div id="useWrap">
				<div id="usageHeader">열람실 조회</div>
				<table id="useHeaTab">
					<tr>
						<td>총좌석 : 160</td>
						<td>이용좌석 : ${toManage.TOUSESEAT }</td>
						<td>잔여좌석 : ${toManage.TORESEAT }</td>
						<td>사용불가 : ${toManage.TONASEAT }</td>
					</tr>
				</table>
				<table id="useTab">
					<tr>
						<th>열람실</th>
						<th>총좌석</th>
						<th>이용좌석</th>
						<th>잔여좌석</th>
						<th>사용불가</th>
						<th>이용시간</th>
					</tr>
					<c:forEach items="${manageList }" var="s">
					<tr>
						<td>${s.roomName }</td>
						<td>${s.toSeat }</td>
						<td>${s.toUsSeat }</td>
						<td>${s.toReSeat }</td>
						<td>${s.toNaSeat }</td>
						<td>09:00 ~ 23:00</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div id="resWrap">
				<div id="resHeader">예약현황</div>
				<table id="resTab">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>예약번호</th>
						<th>열람실</th>
						<th>좌석번호</th>
						<th>시작시간</th>
						<th>종료시간</th>
						<th style="width: 80px;">수정</th>
						<th style="width: 80px;">삭제</th>
					</tr>
					<c:forEach var="b" items="${bookingList }">
					<tr>
						<td>${b.member.userId }</td>
						<td>${b.member.userName }</td>
						<td>${b.bookingNo }</td>
						<td>${b.roomName }</td>
						<td>${b.seatNo }</td>
						<td>${b.startTime }</td>
						<td>${b.endTime }</td>
						<td><button type="button" class="btn btn-outline-secondary">수정</button></td>
						<td><button type="button" class="btn btn-outline-secondary" onclick="delBooking(this);" value="${b.bookingNo }">삭제</button></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
</section>

	<script>
	
    $(function(){
        // ul show()
        $(".navOptions").eq(3).show();
        // ul li 배경화면 
        $(".navOptions").eq(3).children().eq(0).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })
    
    
    // 열람실 예약 삭제하기 
    const delBooking = function(e){
    	
    	if(confirm('예약을 삭제하시겠습니까?')){
    		location.href = '${path}/admin/studyroom/delBooking.do?bookingNo='+$(e).val();
    	}
    	
    }
    
	</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />