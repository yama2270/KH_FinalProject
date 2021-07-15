<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="열람실 전체조회" />
</jsp:include>

<div id="ad_right">
	<div id="contHeader">열람실 관리>전체조회</div>
	<div style="overflow: overlay; margin: auto;">
		<div id="contBody">
			<div id="useWrap">
				<div id="usageHeader">전체조회</div>
				<table id="useHeaTab">
					<tr>
						<td>총좌석 : X</td>
						<td>이용좌석 : X</td>
						<td>잔여좌석 : X</td>
						<td>사용불가 : X</td>
					</tr>
				</table>
				<table id="useTab">
					<tr>
						<th>열람실</th>
						<th>총좌석</th>
						<th>사용좌석</th>
						<th>잔여좌석</th>
						<th>사용불가</th>
						<th>이용시간</th>
					</tr>
					<tr>
						<td>열람실</td>
						<td>총좌석</td>
						<td>사용좌석</td>
						<td>잔여좌석</td>
						<td>사용불가</td>
						<td>이용시간</td>
					</tr>
					<tr>
						<td>열람실</td>
						<td>총좌석</td>
						<td>사용좌석</td>
						<td>잔여좌석</td>
						<td>사용불가</td>
						<td>이용시간</td>
					</tr>
					<tr>
						<td>열람실</td>
						<td>총좌석</td>
						<td>사용좌석</td>
						<td>잔여좌석</td>
						<td>사용불가</td>
						<td>이용시간</td>
					</tr>
					<tr>
						<td>열람실</td>
						<td>총좌석</td>
						<td>사용좌석</td>
						<td>잔여좌석</td>
						<td>사용불가</td>
						<td>이용시간</td>
					</tr>
				</table>
			</div>
			<div id="resWrap">
				<div id="resHeader">예약현황</div>
				<table id="resTab">
					<tr>
						<th style="width: 60px;"><input type="checkbox"></th>
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
					<tr>
						<td><input type="checkbox"></td>
						<td>아이디</td>
						<td>이름</td>
						<td>예약번호</td>
						<td>열람실</td>
						<td>좌석번호</td>
						<td>시작시간</td>
						<td>종료시간</td>
						<td><button type="button" class="btn btn-outline-secondary">수정</button></td>
						<td><button type="button" class="btn btn-outline-secondary">삭제</button></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>아이디</td>
						<td>이름</td>
						<td>예약번호</td>
						<td>열람실</td>
						<td>좌석번호</td>
						<td>시작시간</td>
						<td>종료시간</td>
						<td><button type="button" class="btn btn-outline-secondary">수정</button></td>
						<td><button type="button" class="btn btn-outline-secondary">삭제</button></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>아이디</td>
						<td>이름</td>
						<td>예약번호</td>
						<td>열람실</td>
						<td>좌석번호</td>
						<td>시작시간</td>
						<td>종료시간</td>
						<td><button type="button" class="btn btn-outline-secondary">수정</button></td>
						<td><button type="button" class="btn btn-outline-secondary">삭제</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
</section>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />