<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hy.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yh.css">
<body id="ad_body">
    <div class="seathead">
        <h2>좌석정보</h2>
        <table class="seattable">
            <tr>
                <th class="seattablehead">열람실</th>
                <th class="seattablehead">A</th>
            </tr>
            <tr>
                <td class="seattablehead">좌석번호</td>
                <td class="seattablehead">1</td>
            </tr>
            <tr>
                <td class="seattablehead">시작시간</td>
                <td class="seattablehead">09:00</td>
            </tr>
            <tr>
                <td class="seattablehead">끝나는시간</td>
                <td class="seattablehead">12:00</td>
            </tr>
            <tr>
                <td class="seattablehead">이용상태</td>
                <td class="seattablehead">사용중</td>
            </tr>
            <tr>
                <td colspan="2" class="seatcall"><button>예약하기</button></td>
            </tr>
        </table>
        <button onclick="test();" class="seatback">닫기</button>
    </div>

<script>
    function test(){
        close();
    }


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>