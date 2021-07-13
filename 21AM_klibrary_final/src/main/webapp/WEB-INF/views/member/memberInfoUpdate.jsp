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
		<table id="Info_Update_table">
			<tr>
				<th><p style="margin-top:10px;">성 명</p></th>
				<td><input type="text" id="name" placeholder="성명을 입력하세요." class="InfoInput"></td>
			</tr>
			<tr>
				<th><p style="margin-top:10px;">회원 아이디</p></th>
				<td><input type="text" id="userId" placeholder="회원 아이디를 입력하세요." class="InfoInput"></td>
			</tr>
			<tr>
				<th><p style="margin-top:10px;">비밀번호 변경</p></th>
				<td><input type="password" id="password" placeholder="비밀번호를 입력하세요." class="InfoInput"></td>
			</tr>
			<tr>
				<th><p style="margin-top:10px;">비밀번호 변경확인</p></th>
				<td><input type="password" id="passwordCheck" placeholder="비밀번호를 재입력하세요." class="InfoInput"></td>
			</tr>
			<tr>
				<th><p style="margin-top:10px;">휴대폰 전화</p></th>
				<td>
					<input type="text" id="phone1" class="phone">ㅡ
					<input type="text" id="phone2" class="phone">ㅡ
					<input type="text" id="phone3" class="phone">
					<!-- 자바스크립트로 하이픈(-)&CSS 수정하기 -->
				</td>
			</tr>
			<tr>
				<th><p style="margin-top:10px;">성 별</p></th>
				<td>
					<label><input type="radio" id="gender" value="남">남자</label>
					<label><input type="radio" id="gender" value="남">여자</label>
				</td>
			</tr>
			<tr >
				<th><p style="margin-top:10px;">생년월일</p></th>
				<td><input type="date" id="date" class="InfoInput"></td>
			</tr>
			<tr>
				<th><p style="margin-top:10px;">주 소</p></th>
				<td>
					<input type="text" id="address1" placeholder="주소를 입력하세요." class="InfoInput">
					<button type="button" class="btn btn-outline-success" style="height:30px;">우편번호 검색</button>
				</td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" id="address2" placeholder="상세주소를 입력하세요." class="InfoInput"></td>
			</tr>
			<tr>
				<th><p style="margin-top:10px;">이메일</p></th>
				<td><input type="email" id="email" placeholder="이메일 입력하세요." class="InfoInput"></td>
			</tr>
		</table>
	</div>
	<div id="Ok_Cancel_btn">
		<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/memberInfoUpdate.do')">확인</button>
		<button type="button" class="btn btn-outline-danger">취소</button>
	</div>
</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>