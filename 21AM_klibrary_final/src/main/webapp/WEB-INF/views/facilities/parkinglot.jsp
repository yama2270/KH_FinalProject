<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="주차안내"/>
</jsp:include>
<body>
   <div class="divcontainer1">
    <br>
    	<h2 id="title11">주차안내</h2>
    <br>
  </div>
    <section id="ad_containerad">
        <div class="list-group-containers" >
	            <ul class="list-group">
	              <li class="list-group-item" id="menutitle">이용안내</li>
	              <li class="list-group-item" onclick="location.assign('${path}/notice/booktime.do')">이용시간</li>
	              <li class="list-group-items">편의시설 <i class="fas fa-plus"></i>
	              	<ul class="submenu">
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/copymachine.do')">자료복사</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/parkinglot.do')">주차안내</li>
                    </ul>
	              </li>
	              <li class="list-group-items">열람실 안내<i class="fas fa-plus"></i>
	              	<ul class="submenu">
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomA.do')">열람실 A</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomB.do')">열람실 B</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomC.do')">열람실 C</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomD.do')">열람실 D</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomE.do')">열람실 E</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomnotice.do')">열람실이용안내</li>
                    </ul>
	              </li>
	            </ul>
        	</div>
        <div id="he_right">
            <div id="titleheadnamec">편의시설 -> 주차안내</div>
            <div id="contbody">
                <div class="pama">
                    <h2>주차장 이용 안내</h2>
                    <p>「도서관 이용 사전예약자」에 한에 이용가능합니다.</p>
                    <ul>
                        <li>주차장 운영시간</li>
                        <p>평일(월~금) / 주말 : 08:00~19:00(운영시간 이후 입차.출차 불가)</p>
                        <p>* 도서관 이용 사전예약 하신 분에 한해 도서관 운영 시간내에서 이용 가능합니다.</p>
                    </ul>
                    <h2>주차요금</h2>
                    <table class="parkingtable">
                        <tr>
                            <th class="parkingtablehead" id="parkingtables">구분</th>
                            <th class="parkingtablehead" id="parkingtables2">주차요금</th>
                            <th class="parkingtablehead2" id="parkingtables3">비고</th>
                        </tr>
                        <tr>
                            <td class="parkingtablebody" id="parkingtables">일반 이용자</td>
                            <td class="parkingtablebody" id="parkingtables2">30분 초과 시 매 15분마다 500원
                                (1일 최고요금 10,000원)</td>
                            <td class="parkingtablebody2" id="parkingtables3">1일 1회에 한하여 30분 이내 무료</td>
                        </tr>
                    </table>
                    <h2>차량 요일제 실시</h2>
                    <table class="parkingtable">
                        <tr>
                            <th class="parkingtablehead" id="parkingtables4">구분</th>
                            <th class="parkingtablehead" id="parkingtables">월요일</th>
                            <th class="parkingtablehead" id="parkingtables">화요일</th>
                            <th class="parkingtablehead" id="parkingtables">수요일</th>
                            <th class="parkingtablehead" id="parkingtables">목요일</th>
                            <th class="parkingtablehead" id="parkingtables">금요일</th>
                            <th class="parkingtablehead2" id="parkingtables">공휴일(토요일,일요일)</th>
                        </tr>
                        <tr>
                            <td class="parkingtablebody">출입제한 승용차 끝번호</td>
                            <td class="parkingtablebody">1,6</td>
                            <td class="parkingtablebody">2,7</td>
                            <td class="parkingtablebody">3,8</td>
                            <td class="parkingtablebody">4,9</td>
                            <td class="parkingtablebody">5,0</td>
                            <td class="parkingtablebody2">-</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </section>

<script>
    
    // navigation 이벤트
    
    $(function(){

        const naviList = $(".list-group").children();
        const options = $(".submenu")

        $(naviList).click((e)=>{
            $(naviList).children().not('i').hide();
            $(naviList).children().filter('i').attr("class","fas fa-plus");
            $(options).children().css({"font-size":"15px","fontWeight":"normal"})
            $(e.target).find("ul").show();
            $(e.target).find("i").attr("class","fas fa-minus");
        })

        // navigation - option 이벤트 

        $(options).mouseover((e)=>{
            $(e.target).css("textDecoration","underline");
        })

        $(options).mouseout((e)=>{
            $(e.target).css("textDecoration","");
        })

        $(options).click((e)=>{
            $(options).children().css({"font-size":"15px","fontWeight":"normal"})
            $(e.target).css({"font-size":"20px","fontWeight":"bold"})
            return false;
        })

    })

</script>

</body>
</html>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>