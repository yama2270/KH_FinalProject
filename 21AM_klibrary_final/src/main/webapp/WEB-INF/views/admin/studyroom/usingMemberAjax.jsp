<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

		<table id="roomUseTab">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>예약번호</th>
				<th>좌석번호</th>
				<th>시작시간</th>
				<th>종료시간</th>
			</tr>
		<c:forEach var="l" items="${list }">
			<tr>
				<td>${l.member.userId }</td>
				<td>${l.member.userName }</td>
				<td>${l.bookingNo }</td>
				<td>${l.seatNo }</td>
				<td>${l.startTime }</td>
				<td>${l.endTime }</td>
			</tr>
		</c:forEach>
		</table>
		<div style="margin-top:10px;">
		${pageBar }
		</div>