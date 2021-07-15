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
						<td>총좌석 : X</td>
						<td>이용좌석 : X</td>
						<td>잔여좌석 : X</td>
						<td>사용불가 : X</td>
					</tr>
				</table>
			</div>
			<div id="roomWrap">
				<div id="room-door">출입문</div>
				<table id="roomTab" style="border-spacing: 1em 0.5em;">
					<tr>
						<td>A1</td>
						<td>A2</td>
						<td>A3</td>
						<td>A4</td>
						<td>A5</td>
						<td>A6</td>
						<td>A7</td>
						<td>A8</td>
						<td>A9</td>
						<td>A10</td>
					</tr>
					<tr>
						<td>A11</td>
						<td>A12</td>
						<td>A13</td>
						<td>A14</td>
						<td>A15</td>
						<td>A16</td>
						<td>A17</td>
						<td>A18</td>
						<td>A19</td>
						<td>A20</td>
					</tr>
					<tr>
						<td>A21</td>
						<td>A22</td>
						<td>A23</td>
						<td>A24</td>
						<td>A25</td>
						<td>A26</td>
						<td>A27</td>
						<td>A28</td>
						<td>A29</td>
						<td>A30</td>
					</tr>
					<tr>
						<td>A31</td>
						<td>A32</td>
						<td>A33</td>
						<td>A34</td>
						<td>A35</td>
						<td>A36</td>
						<td>A37</td>
						<td>A38</td>
						<td>A39</td>
						<td>A40</td>
					</tr>
				</table>
			</div>
			<div id="seatSta">
				<button type="button" class="btn btn-primary">사용중</button>
				<button type="button" class="btn btn-secondary">사용가능</button>
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

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />