<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="개인정보확인"/>
</jsp:include>

<section id="container">
<div style="width:1800px">
	<div id="UserInfo_Menu_Container">
		<div class="btn-group-vertical" style="width:250px;">
			<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/memberInfo.do')">개인정보확인</button>
			<button type="button" class="btn btn-outline-primary" data-toggle="collapse" data-target="#borrow">도서이용내역</button>
			<div id="borrow" class="collapse">
				<a class="dropdown-item" href="${path }/member/memberBorrowing.do">▷대출현황조회</a>
		      	<a class="dropdown-item" href="${path }/member/memberBorrowed.do">▷대출이력조회</a>
		      	<a class="dropdown-item" href="${path }/member/memberBooking.do">▷예약현황조회</a>
			</div>
			<button type="button" class="btn btn-outline-primary" data-toggle="collapse" data-target="#hope">희망 도서</button>
			<div id="hope" class="collapse">
				<a class="dropdown-item" href="${path }/member/memberHopeBook.do">▷희망도서 신청</a>
		      	<a class="dropdown-item" href="${path }/member/memberHopeBookRecord.do">▷희망도서 신청/이력 조회</a>
			</div>
			<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/memberBookMark.do')">관심 도서</button>
			<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/memberReadingRoom.do')">열람실 이용내역</button>
			<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/membershipCard.do')">모바일 회원증</button>
			<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/memberDelete.do')">회원 탈퇴</button>
		</div>
	</div>
	<div id="UserInfo_Container">
		<div>
			<h2>개인정보확인</h2>
			<hr id="h2_line2" >
		</div>
		<div id="member_card">
			<div>
				<h2 id="m-top">KH도서관</h2>
				<img src="${path }/resources/images/profile.png" width=300px height=300px id="m-top">
				<p id="m-top">회원 번호 : 00-00000</p>
				<p>성  명 : 홍 길 동</p>
			</div>
		</div>
	</div>
</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>