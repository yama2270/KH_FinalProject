<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="열람실A" />
</jsp:include>

<div id="ad_right">
	<div id="contHeader">열람실 관리 > 열람실 A</div>
	<div style="overflow: overlay; margin: auto;">
		<div id="contBody">
			<div id="roomHeaWrap">
				<div class="rooTabTit">열람실 A</div>
				<table id="roomHeaTab">
					<tr>
						<td>총좌석 : 40</td>
						<td>이용좌석 : ${manage["이용중"]==null? "0": manage["이용중"] }</td>
						<td>잔여좌석 : ${manage["이용가능"]==null? "0": manage["이용가능"] }</td>
						<td>사용불가 : ${manage["사용불가"]==null? "0": manage["사용불가"] }</td>
					</tr>
				</table>
			</div>
			<div id="roomWrap">
				<div id="room-door">출입문</div>
				<table id="roomTab" style="border-spacing: 1em 0.5em;">
					<c:forEach begin="0" end="3" varStatus="status">
					<tr>
						<c:forEach begin="${status.index*10 }" end="${status.index==0?'':status.index }9" var="l" items="${listStudy }">
							<c:choose>
								<c:when test="${l.usageStatus=='이용중' }">
									<td style="background-color:#0069d9;color:white">${l.seatNo }<input name="bookingNo" value="${l.bookingNo }" style="display:none;"></td>
								</c:when>
								<c:when test="${l.usageStatus=='사용불가' }">
									<td style="background-color:#c82333;color:white">${l.seatNo }<input name="bookingNo" value="${l.bookingNo }" style="display:none;"></td>
								</c:when>
								<c:otherwise>
									<td style="background-color:#218838;color:white">${l.seatNo }<input name="bookingNo" value="${l.bookingNo }" style="display:none;"></td>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div id="seatSta">
				<button type="button" class="btn btn-primary">사용중</button>
				<button type="button" class="btn btn-success">사용가능</button>
				<button type="button" class="btn btn-danger">이용불가</button>
			</div>
			<div style="margin-top: 20px;">
				<div class="rooTabTit">이용 중 회원목록</div>
				<table id="roomUseTab">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>예약번호</th>
						<th>좌석번호</th>
						<th>시작시간</th>
						<th>종료시간</th>
					</tr>
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>예약번호</td>
						<td>좌석번호</td>
						<td>시작시간</td>
						<td>종료시간</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>예약번호</td>
						<td>좌석번호</td>
						<td>시작시간</td>
						<td>종료시간</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>예약번호</td>
						<td>좌석번호</td>
						<td>시작시간</td>
						<td>종료시간</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>예약번호</td>
						<td>좌석번호</td>
						<td>시작시간</td>
						<td>종료시간</td>
					</tr>
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
        $(".navOptions").eq(3).children().eq(1).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })
    
    $("#roomTab").find("td").click((e)=>{
    	console.log($(e.target));
    }) 
    
	</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />