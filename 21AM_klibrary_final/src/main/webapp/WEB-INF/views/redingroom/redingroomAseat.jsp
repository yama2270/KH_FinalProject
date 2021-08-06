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
        <form class="d-flex" action="${path }/notice/redingroombooking.do" method="post">
        <table class="seattable">
            <tr>
                <th class="seattablehead" colspan="2">열람실A
                	<input type="hidden" name="studyroomtype" value="열람실A">
                </th>
            </tr>
            <tr>
                <td class="seattablehead">좌석번호</td>
                <td class="seattablehead">
                	<input type="hidden" name="seatno" value="${list.seatNo }">
                	<c:out value="${list.seatNo }"/>
                </td>
            </tr>
            <tr>
                <td class="seattablehead">시작시간</td>
                <td class="seattablehead">
                	<select class="fontsize" name="searchOption" aria-label="Default select example">
                        <option selected>시간선택</option>
                        <option value="09:00">09:00</option>
                        <option value="10:00">10:00</option>
                        <option value="11:00">11:00</option>
                        <option value="12:00">12:00</option>
                        <option value="13:00">13:00</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                        <option value="17:00">17:00</option>
                        <option value="18:00">18:00</option>
                        <option value="19:00">19:00</option>
                        <option value="20:00">20:00</option>
                        <option value="21:00">21:00</option>
                   	</select>
                </td>
            </tr>
            <tr>
                <td class="seattablehead">끝나는시간</td>
                <td class="seattablehead">
                	<select class="fontsize" name="searchOption2" aria-label="Default select example">
                        <option selected>시간선택</option>
                        <option value="10:00">10:00</option>
                        <option value="11:00">11:00</option>
                        <option value="12:00">12:00</option>
                        <option value="13:00">13:00</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                        <option value="17:00">17:00</option>
                        <option value="18:00">18:00</option>
                        <option value="19:00">19:00</option>
                        <option value="20:00">20:00</option>
                        <option value="21:00">21:00</option>
                        <option value="22:00">22:00</option>
                   	</select>
                </td>
            </tr>
            <tr>
                <td class="seattablehead">이용상태</td>
                <td class="seattablehead">
                	<input type="hidden" name="usagestatus" value="${list.usageStatus }">
                	<input type="hidden" name="userid" value="${loginMember.userId }">
                	<c:out value="${list.usageStatus }"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="seatcall">
                <button onclick="booking();">예약하기</button>
		        <button onclick="test();" >닫기</button>
                </td>
            </tr>
        </table>
        </form>
    </div>

<script>
    function test(){
        close();
    }
    
  
    
</script>

</body>
</html>
