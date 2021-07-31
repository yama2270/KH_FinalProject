<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
                <td class="seattablehead">
                	<select class="fontsize" name="searchOption" aria-label="Default select example">
                        <option selected>시간선택</option>
                        <option value="">00:00</option>
                        <option value="">01:00</option>
                        <option value="">02:00</option>
                        <option value="">03:00</option>
                        <option value="">04:00</option>
                        <option value="">05:00</option>
                        <option value="">06:00</option>
                        <option value="">07:00</option>
                        <option value="">08:00</option>
                        <option value="">09:00</option>
                        <option value="">10:00</option>
                        <option value="">11:00</option>
                        <option value="">12:00</option>
                        <option value="">13:00</option>
                        <option value="">14:00</option>
                        <option value="">15:00</option>
                        <option value="">16:00</option>
                        <option value="">17:00</option>
                        <option value="">18:00</option>
                        <option value="">19:00</option>
                        <option value="">20:00</option>
                        <option value="">21:00</option>
                        <option value="">22:00</option>
                        <option value="">23:00</option>
                   	</select>
                </td>
            </tr>
            <tr>
                <td class="seattablehead">끝나는시간</td>
                <td class="seattablehead">
                	<select class="fontsize" name="searchOption" aria-label="Default select example">
                        <option selected>시간선택</option>
                        <option value="">00:00</option>
                        <option value="">01:00</option>
                        <option value="">02:00</option>
                        <option value="">03:00</option>
                        <option value="">04:00</option>
                        <option value="">05:00</option>
                        <option value="">06:00</option>
                        <option value="">07:00</option>
                        <option value="">08:00</option>
                        <option value="">09:00</option>
                        <option value="">10:00</option>
                        <option value="">11:00</option>
                        <option value="">12:00</option>
                        <option value="">13:00</option>
                        <option value="">14:00</option>
                        <option value="">15:00</option>
                        <option value="">16:00</option>
                        <option value="">17:00</option>
                        <option value="">18:00</option>
                        <option value="">19:00</option>
                        <option value="">20:00</option>
                        <option value="">21:00</option>
                        <option value="">22:00</option>
                        <option value="">23:00</option>
                   	</select>
                </td>
            </tr>
            <tr>
                <td class="seattablehead">이용상태</td>
                <td class="seattablehead">사용중</td>
            </tr>
            <tr>
                <td colspan="2" class="seatcall">
		        <button onclick="test();" >닫기</button>
                <button>예약하기</button>
                </td>
            </tr>
        </table>
    </div>

<script>
    function test(){
        close();
    }
</script>

</body>
</html>
